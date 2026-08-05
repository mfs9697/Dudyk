#!/usr/bin/env python3
"""Create the recalculated Figure 4 and a separate printed-D1 audit plot."""

from __future__ import annotations

import argparse
import csv
import math
from pathlib import Path

import matplotlib.pyplot as plt


plt.rcParams.update(
    {
        "font.family": "serif",
        "font.serif": ["DejaVu Serif"],
        "mathtext.fontset": "stix",
        "font.size": 10,
    }
)


def _number(value: str) -> float:
    if not value or value.strip().lower() == "nan":
        return math.nan
    return float(value)


def read_results(path: Path) -> dict[str, list[float]]:
    with path.open(newline="", encoding="utf-8-sig") as stream:
        rows = list(csv.DictReader(stream))
    required = {
        "alpha_deg",
        "lambda0",
        "lambda",
        "lambda1",
        "lambda2",
        "lambda1_D1_printed",
    }
    missing = required.difference(rows[0] if rows else {})
    if missing:
        raise ValueError(f"Missing CSV columns: {sorted(missing)}")
    return {name: [_number(row[name]) for row in rows] for name in required}


def format_axes(axis: plt.Axes) -> None:
    axis.set_xlim(0.0, 180.0)
    axis.set_ylim(-1.0, 0.0)
    axis.set_xticks(range(0, 181, 30))
    axis.set_yticks([value / 10 for value in range(-10, 1)])
    axis.set_xlabel(r"Half-angle, $\alpha$ (deg)")
    axis.set_ylabel("Stress-singularity exponent")
    axis.grid(True, color="0.88", linewidth=0.6)
    axis.axvline(90.0, color="0.35", linestyle=":", linewidth=1.0)
    axis.text(91.5, -0.98, "degenerate limit", fontsize=8, color="0.35")


def save_figure(figure: plt.Figure, stem: Path) -> None:
    figure.savefig(stem.with_suffix(".pdf"), bbox_inches="tight")
    figure.savefig(stem.with_suffix(".png"), dpi=600, bbox_inches="tight")
    plt.close(figure)


def generate(csv_path: Path, output_dir: Path) -> None:
    data = read_results(csv_path)
    output_dir.mkdir(parents=True, exist_ok=True)
    alpha = data["alpha_deg"]

    figure, axis = plt.subplots(figsize=(6.8, 4.6), constrained_layout=True)
    axis.plot(alpha, data["lambda0"], color="#7242a1", lw=1.8, label=r"$\lambda_0$")
    axis.plot(alpha, data["lambda"], color="#c51f1f", lw=1.8, label=r"$\lambda$")
    axis.plot(alpha, data["lambda1"], color="#198c3b", lw=1.8, label=r"$\lambda_1$")
    axis.plot(alpha, data["lambda2"], color="#1459b3", lw=1.8, label=r"$\lambda_2$")
    format_axes(axis)
    axis.legend(frameon=False, ncol=4, loc="lower center")
    save_figure(figure, output_dir / "figure4_recalculated")

    figure, axis = plt.subplots(figsize=(6.8, 4.6), constrained_layout=True)
    axis.plot(alpha, data["lambda1"], color="#198c3b", lw=1.8, label=r"Corrected $D_1$")
    axis.plot(
        alpha,
        data["lambda1_D1_printed"],
        color="black",
        linestyle="--",
        lw=1.4,
        label=r"Printed $D_1$",
    )
    format_axes(axis)
    axis.legend(frameon=False, loc="lower left")
    save_figure(figure, output_dir / "figure4_D1_audit")


def main() -> None:
    project_root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--csv",
        type=Path,
        default=project_root / "results" / "baseline_roots_matlab_1deg.csv",
    )
    parser.add_argument(
        "--output-dir", type=Path, default=project_root / "figures"
    )
    args = parser.parse_args()
    generate(args.csv, args.output_dir)


if __name__ == "__main__":
    main()
