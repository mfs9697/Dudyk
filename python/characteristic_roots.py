#!/usr/bin/env python3
"""Characteristic exponents for a broken bimaterial interface.

The formulas are transcribed from Eqs. (5), (A.2), and (A.4) of the
manuscript supplied as ``Стаття.pdf``.  The stress exponent ``lambda`` and
the Mellin variable ``p`` are related by

    p = -1 - lambda,      -1 < lambda < 0.

Only the Python standard library is used so that the calculation remains
portable and auditable.
"""

from __future__ import annotations

import argparse
import csv
import json
import math
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Callable, Iterable, Sequence


@dataclass(frozen=True)
class MaterialPair:
    """Elastic constants for the two plane-strain materials."""

    E1: float
    E2: float
    nu1: float
    nu2: float

    def __post_init__(self) -> None:
        if self.E1 <= 0.0 or self.E2 <= 0.0:
            raise ValueError("Young's moduli E1 and E2 must be positive.")
        if not (-1.0 < self.nu1 < 0.5 and -1.0 < self.nu2 < 0.5):
            raise ValueError("Poisson ratios must lie in (-1, 0.5).")

    @property
    def e(self) -> float:
        return (1.0 + self.nu2) * self.E1 / ((1.0 + self.nu1) * self.E2)

    @property
    def kappa1(self) -> float:
        return 3.0 - 4.0 * self.nu1

    @property
    def kappa2(self) -> float:
        return 3.0 - 4.0 * self.nu2

    def swapped(self) -> "MaterialPair":
        return MaterialPair(self.E2, self.E1, self.nu2, self.nu1)


@dataclass(frozen=True)
class RootOptions:
    """Controls for the real-root search on -1 < lambda < 0."""

    scan_points: int = 20001
    endpoint_margin: float = 1.0e-8
    residual_tolerance: float = 1.0e-10
    duplicate_tolerance: float = 1.0e-8
    max_bisection_iterations: int = 120
    selector: str = "smallest_lambda"

    def __post_init__(self) -> None:
        if self.scan_points < 101:
            raise ValueError("scan_points must be at least 101.")
        if not (0.0 < self.endpoint_margin < 0.1):
            raise ValueError("endpoint_margin must lie in (0, 0.1).")
        if self.selector not in {"smallest_lambda", "largest_lambda"}:
            raise ValueError("Unknown root selector.")


@dataclass
class RootResult:
    determinant: str
    alpha_deg: float
    roots: list[float]
    selected: float | None
    residual: float | None
    selector: str
    note: str = ""


def _trig_terms(p: float, alpha: float) -> dict[str, float]:
    """Repeated trigonometric terms, kept explicit for formula auditing."""

    return {
        "sin_2pa": math.sin(2.0 * p * alpha),
        "sin_2pba": math.sin(2.0 * p * (math.pi - alpha)),
        "sin_2a": math.sin(2.0 * alpha),
        "cos_2pa": math.cos(2.0 * p * alpha),
        "cos_2pba": math.cos(2.0 * p * (math.pi - alpha)),
        "cos_2a": math.cos(2.0 * alpha),
        "sin_pa_sq": math.sin(p * alpha) ** 2,
        "sin_pba_sq": math.sin(p * (math.pi - alpha)) ** 2,
        "sin_a_sq": math.sin(alpha) ** 2,
    }


def determinant_D0(p: float, alpha: float, material: MaterialPair) -> float:
    """Intact-corner determinant D0(p), manuscript Eq. (A.2)."""

    t = _trig_terms(p, alpha)
    e = material.e
    k1 = material.kappa1
    k2 = material.kappa2

    left_plus = t["sin_2pa"] + p * t["sin_2a"]
    right_k1_plus = k1 * t["sin_2pba"] + p * t["sin_2a"]
    right_minus = t["sin_2pba"] - p * t["sin_2a"]
    left_k2_minus = k2 * t["sin_2pa"] - p * t["sin_2a"]

    b0 = left_plus * right_k1_plus
    b1 = (
        (1.0 + k1) * (1.0 + k2) * math.sin(p * math.pi) ** 2
        - left_plus * right_k1_plus
        - right_minus * left_k2_minus
    )
    b2 = right_minus * left_k2_minus
    return b0 + e * b1 + e * e * b2


def determinant_D(p: float, alpha: float, material: MaterialPair) -> float:
    """Shear-cracked-corner determinant D(p), manuscript Eq. (A.4)."""

    t = _trig_terms(p, alpha)
    e = material.e
    k1 = material.kappa1
    k2 = material.kappa2

    a0 = (
        (1.0 + k1)
        * (t["cos_2pba"] - t["cos_2a"])
        * (t["sin_2pa"] + p * t["sin_2a"])
    )
    a1 = (
        (1.0 + k2)
        * (t["cos_2pa"] - t["cos_2a"])
        * (t["sin_2pba"] - p * t["sin_2a"])
    )
    return a0 + e * a1


def determinant_D1_printed(p: float, alpha: float, material: MaterialPair) -> float:
    """Printed D1(p) from manuscript Eq. (5).

    This function is retained as an audit diagnostic.  It does not reproduce
    the material-1 branch plotted in Fig. 4 under the stated material-swap
    symmetry; see EQUATION_INVENTORY.md.
    """

    t = _trig_terms(p, alpha)
    e = material.e
    k1 = material.kappa1
    k2 = material.kappa2

    return (
        2.0
        * e
        * (1.0 + k2)
        * (t["cos_2pa"] - t["cos_2a"])
        * (t["sin_pba_sq"] - p * p * t["sin_a_sq"])
        + (1.0 + k1)
        * (t["sin_2pa"] - p * t["sin_2a"])
        * (t["sin_2pba"] + p * t["sin_2a"])
    )


def determinant_D1_corrected(
    p: float, alpha: float, material: MaterialPair
) -> float:
    """Symmetry-corrected D1(p) for the material-1 process zone.

    Material interchange in printed D2 requires the signs in the second
    product to be ``(+,-)``.  The manuscript prints ``(-,+)`` instead.
    This corrected determinant is exactly ``e`` times transformed D2, so it
    has the same zeros as the independent material-swap calculation.
    """

    t = _trig_terms(p, alpha)
    e = material.e
    k1 = material.kappa1
    k2 = material.kappa2

    return (
        2.0
        * e
        * (1.0 + k2)
        * (t["cos_2pa"] - t["cos_2a"])
        * (t["sin_pba_sq"] - p * p * t["sin_a_sq"])
        + (1.0 + k1)
        * (t["sin_2pa"] + p * t["sin_2a"])
        * (t["sin_2pba"] - p * t["sin_2a"])
    )


def determinant_D2_printed(p: float, alpha: float, material: MaterialPair) -> float:
    """Printed D2(p) from manuscript Eq. (5)."""

    t = _trig_terms(p, alpha)
    e = material.e
    k1 = material.kappa1
    k2 = material.kappa2

    return (
        2.0
        * (1.0 + k1)
        * (t["cos_2pba"] - t["cos_2a"])
        * (t["sin_pa_sq"] - p * p * t["sin_a_sq"])
        + e
        * (1.0 + k2)
        * (t["sin_2pba"] - p * t["sin_2a"])
        * (t["sin_2pa"] + p * t["sin_2a"])
    )


DETERMINANTS: dict[str, Callable[[float, float, MaterialPair], float]] = {
    "D0": determinant_D0,
    "D": determinant_D,
    "D1_printed": determinant_D1_printed,
    "D1_corrected": determinant_D1_corrected,
    "D2_printed": determinant_D2_printed,
}


def characteristic_residual(
    determinant: Callable[[float, float, MaterialPair], float],
    lambda_value: float,
    alpha: float,
    material: MaterialPair,
) -> float:
    """Evaluate D_j(-1-lambda)."""

    return determinant(-1.0 - lambda_value, alpha, material)


def _bisect(
    function: Callable[[float], float],
    left: float,
    right: float,
    options: RootOptions,
) -> float:
    f_left = function(left)
    f_right = function(right)
    if f_left == 0.0:
        return left
    if f_right == 0.0:
        return right
    if f_left * f_right > 0.0:
        raise ValueError("Bisection bracket does not contain a sign change.")

    for _ in range(options.max_bisection_iterations):
        midpoint = 0.5 * (left + right)
        f_mid = function(midpoint)
        if abs(f_mid) <= options.residual_tolerance:
            return midpoint
        if f_left * f_mid <= 0.0:
            right = midpoint
            f_right = f_mid
        else:
            left = midpoint
            f_left = f_mid
        if right - left <= 10.0 * math.ulp(max(1.0, abs(midpoint))):
            break
    return 0.5 * (left + right)


def _deduplicate(values: Iterable[float], tolerance: float) -> list[float]:
    result: list[float] = []
    for value in sorted(values):
        if not result or abs(value - result[-1]) > tolerance:
            result.append(value)
    return result


def find_real_characteristic_roots(
    determinant_name: str,
    alpha: float,
    material: MaterialPair,
    options: RootOptions | None = None,
) -> RootResult:
    """Find all sign-changing real roots in -1 < lambda < 0.

    Endpoint roots are deliberately excluded because alpha = pi/2 and the
    homogeneous-material cases are degenerate limits of the present model.
    """

    if options is None:
        options = RootOptions()
    if determinant_name not in DETERMINANTS:
        raise KeyError(f"Unknown determinant {determinant_name!r}.")
    if not (0.0 < alpha < math.pi):
        raise ValueError("alpha must lie in (0, pi).")

    determinant = DETERMINANTS[determinant_name]
    left_limit = -1.0 + options.endpoint_margin
    right_limit = -options.endpoint_margin
    step = (right_limit - left_limit) / (options.scan_points - 1)

    def equation(lambda_value: float) -> float:
        return characteristic_residual(
            determinant, lambda_value, alpha, material
        )

    roots: list[float] = []
    x_left = left_limit
    f_left = equation(x_left)
    for index in range(1, options.scan_points):
        x_right = left_limit + index * step
        f_right = equation(x_right)
        if not (math.isfinite(f_left) and math.isfinite(f_right)):
            x_left, f_left = x_right, f_right
            continue
        if f_left == 0.0:
            roots.append(x_left)
        elif f_left * f_right < 0.0:
            roots.append(_bisect(equation, x_left, x_right, options))
        x_left, f_left = x_right, f_right

    roots = _deduplicate(roots, options.duplicate_tolerance)
    if roots:
        selected = min(roots) if options.selector == "smallest_lambda" else max(roots)
        residual = abs(equation(selected))
    else:
        selected = None
        residual = None

    return RootResult(
        determinant=determinant_name,
        alpha_deg=math.degrees(alpha),
        roots=roots,
        selected=selected,
        residual=residual,
        selector=options.selector,
    )


def calculate_four_characteristic_roots(
    alpha: float,
    material: MaterialPair,
    options: RootOptions | None = None,
) -> dict[str, RootResult]:
    """Calculate lambda0, lambda, lambda1, and lambda2.

    ``lambda1`` uses the explicit symmetry-corrected D1.  The independent
    material-swap calculation is returned as ``lambda1_symmetry`` and must
    coincide with it. ``lambda1_D1_printed`` retains the exact manuscript
    transcription as a diagnostic.
    """

    if options is None:
        options = RootOptions()

    lambda0 = find_real_characteristic_roots("D0", alpha, material, options)
    lambda_shear = find_real_characteristic_roots("D", alpha, material, options)
    lambda2 = find_real_characteristic_roots("D2_printed", alpha, material, options)

    lambda1 = find_real_characteristic_roots(
        "D1_corrected", alpha, material, options
    )
    lambda1.note = "Symmetry-corrected material-1 branch; reproduces Fig. 4."

    swapped_alpha = math.pi - alpha
    lambda1_symmetry = find_real_characteristic_roots(
        "D2_printed", swapped_alpha, material.swapped(), options
    )
    lambda1_symmetry.determinant = "D2_printed after material swap"
    lambda1_symmetry.alpha_deg = math.degrees(alpha)
    lambda1_symmetry.note = (
        "Independent symmetry check for the corrected material-1 branch."
    )

    lambda1_diagnostic = find_real_characteristic_roots(
        "D1_printed", alpha, material, options
    )
    lambda1_diagnostic.note = (
        "Direct root of printed D1; retained to audit the manuscript inconsistency."
    )

    return {
        "lambda0": lambda0,
        "lambda": lambda_shear,
        "lambda1": lambda1,
        "lambda1_symmetry": lambda1_symmetry,
        "lambda2": lambda2,
        "lambda1_D1_printed": lambda1_diagnostic,
    }


def sweep(
    alpha_degrees: Sequence[float],
    material: MaterialPair,
    options: RootOptions | None = None,
) -> list[dict[str, float | None]]:
    rows: list[dict[str, float | None]] = []
    for alpha_deg in alpha_degrees:
        results = calculate_four_characteristic_roots(
            math.radians(alpha_deg), material, options
        )
        row: dict[str, float | None] = {"alpha_deg": alpha_deg}
        for name in (
            "lambda0",
            "lambda",
            "lambda1",
            "lambda2",
            "lambda1_symmetry",
            "lambda1_D1_printed",
        ):
            result = results[name]
            row[name] = result.selected
            row[f"{name}_residual"] = result.residual
        symmetry = results["lambda1_symmetry"].selected
        corrected = results["lambda1"].selected
        row["lambda1_symmetry_error"] = (
            None
            if symmetry is None or corrected is None
            else abs(corrected - symmetry)
        )
        rows.append(row)
    return rows


def write_sweep_csv(path: Path, rows: Sequence[dict[str, float | None]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = list(rows[0]) if rows else []
    with path.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(stream, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def _parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--alpha-deg", type=float, default=45.0)
    parser.add_argument("--E1", type=float, default=0.5)
    parser.add_argument("--E2", type=float, default=1.0)
    parser.add_argument("--nu1", type=float, default=0.3)
    parser.add_argument("--nu2", type=float, default=0.3)
    parser.add_argument(
        "--sweep-csv",
        type=Path,
        help="Write a 1-degree sweep over 1..179 degrees to this CSV file.",
    )
    parser.add_argument(
        "--output-json",
        type=Path,
        help="Write the selected-angle diagnostic payload to this JSON file.",
    )
    return parser.parse_args()


def main() -> None:
    args = _parse_args()
    material = MaterialPair(args.E1, args.E2, args.nu1, args.nu2)
    results = calculate_four_characteristic_roots(
        math.radians(args.alpha_deg), material
    )
    payload = {
        "material": {**asdict(material), "e": material.e},
        "alpha_deg": args.alpha_deg,
        "results": {name: asdict(result) for name, result in results.items()},
    }
    payload_text = json.dumps(payload, indent=2, sort_keys=True)
    print(payload_text)

    if args.output_json:
        args.output_json.parent.mkdir(parents=True, exist_ok=True)
        args.output_json.write_text(payload_text + "\n", encoding="utf-8")

    if args.sweep_csv:
        rows = sweep([float(value) for value in range(1, 180)], material)
        write_sweep_csv(args.sweep_csv, rows)


if __name__ == "__main__":
    main()
