#!/usr/bin/env python3
"""Recalculate the g2 sign-change angles reported in manuscript Table 1.

The script reuses the audited intact-corner determinant and root selector from
``characteristic_roots.py``.  For each E1/E2 ratio it finds the two roots of

    g2(alpha, lambda0(alpha)) = 0,

with nu1 = nu2 = 0.3 and lambda0 defined by D0(-1-lambda0)=0.
"""

from __future__ import annotations

import csv
import math
from pathlib import Path

from characteristic_roots import (
    MaterialPair,
    RootOptions,
    find_real_characteristic_roots,
)

RATIOS = [0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.99]
AUTHOR_ALPHA1 = [2.6, 7.1, 9.2, 10.8, 12.0, 12.9, 13.7, 14.5, 15.1, 15.6, 16.1]
AUTHOR_ALPHA2 = [108.0, 107.9, 107.7, 107.5, 107.3, 107.1, 106.9, 106.7, 106.5, 106.3, 106.2]

ROOT_OPTIONS = RootOptions(
    scan_points=4001,
    residual_tolerance=1.0e-12,
    duplicate_tolerance=1.0e-9,
)


def lambda0(alpha_deg: float, material: MaterialPair) -> float:
    result = find_real_characteristic_roots(
        "D0", math.radians(alpha_deg), material, ROOT_OPTIONS
    )
    if result.selected is None:
        raise RuntimeError(f"No lambda0 root at alpha={alpha_deg:g} deg")
    return result.selected


def g2(alpha_deg: float, material: MaterialPair) -> float:
    alpha = math.radians(alpha_deg)
    lam0 = lambda0(alpha_deg, material)
    e = material.e
    k2 = material.kappa2
    return (
        (1.0 - e)
        * math.cos(lam0 * (math.pi - alpha))
        * (
            (lam0 + 1.0) * math.sin(2.0 * alpha)
            + math.sin(2.0 * (lam0 + 1.0) * alpha)
        )
        + e
        * (1.0 + k2)
        * math.sin(lam0 * math.pi)
        * math.cos((lam0 + 2.0) * alpha)
    )


def bracket_transition(material: MaterialPair, start: float, stop: float) -> tuple[float, float]:
    step = 1.0
    left = start
    f_left = g2(left, material)
    while left < stop:
        right = min(left + step, stop)
        f_right = g2(right, material)
        if f_left == 0.0:
            return left, left
        if f_left * f_right < 0.0:
            return left, right
        left, f_left = right, f_right
    raise RuntimeError(f"No g2 sign change found on [{start}, {stop}] deg")


def bisect_transition(material: MaterialPair, left: float, right: float) -> float:
    if left == right:
        return left
    f_left = g2(left, material)
    f_right = g2(right, material)
    if f_left * f_right > 0.0:
        raise ValueError("Transition bracket has no sign change")
    for _ in range(80):
        middle = 0.5 * (left + right)
        f_middle = g2(middle, material)
        if abs(f_middle) < 1.0e-12 or right - left < 1.0e-9:
            return middle
        if f_left * f_middle <= 0.0:
            right, f_right = middle, f_middle
        else:
            left, f_left = middle, f_middle
    return 0.5 * (left + right)


def main() -> None:
    rows = []
    for ratio, author1, author2 in zip(RATIOS, AUTHOR_ALPHA1, AUTHOR_ALPHA2):
        material = MaterialPair(E1=ratio, E2=1.0, nu1=0.3, nu2=0.3)
        alpha1 = bisect_transition(material, *bracket_transition(material, 0.5, 89.5))
        alpha2 = bisect_transition(material, *bracket_transition(material, 90.5, 179.5))
        rows.append(
            {
                "E1_over_E2": ratio,
                "nu1": 0.3,
                "nu2": 0.3,
                "alpha1_author_deg": author1,
                "alpha1_exact_deg": alpha1,
                "alpha1_difference_deg": alpha1 - author1,
                "alpha2_author_deg": author2,
                "alpha2_exact_deg": alpha2,
                "alpha2_difference_deg": alpha2 - author2,
            }
        )
        print(
            f"E1/E2={ratio:>4g}: alpha1={alpha1:.9f} deg, "
            f"alpha2={alpha2:.9f} deg"
        )

    output = Path(__file__).resolve().parents[1] / "results" / "table1_transition_angles.csv"
    with output.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)
    print(f"Wrote {output}")


if __name__ == "__main__":
    main()
