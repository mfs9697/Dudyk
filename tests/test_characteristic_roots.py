#!/usr/bin/env python3
"""Regression tests for the standard-library reference implementation."""

from __future__ import annotations

import math
import sys
import unittest
from pathlib import Path


PACKAGE_ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(PACKAGE_ROOT / "python"))

from characteristic_roots import (  # noqa: E402
    MaterialPair,
    calculate_four_characteristic_roots,
    characteristic_residual,
    determinant_D1_corrected,
    determinant_D1_printed,
    determinant_D2_printed,
)


class CharacteristicRootTests(unittest.TestCase):
    def setUp(self) -> None:
        self.material = MaterialPair(0.5, 1.0, 0.3, 0.3)

    def assertClose(self, actual: float | None, expected: float) -> None:
        self.assertIsNotNone(actual)
        assert actual is not None
        self.assertAlmostEqual(actual, expected, places=7)

    def test_baseline_45_degrees(self) -> None:
        roots = calculate_four_characteristic_roots(
            math.radians(45.0), self.material
        )
        self.assertClose(roots["lambda0"].selected, -0.0890898074554554)
        self.assertClose(roots["lambda"].selected, -0.613197226573069)
        self.assertClose(roots["lambda1"].selected, -0.393830808986692)
        self.assertClose(
            roots["lambda1_symmetry"].selected, -0.393830808986692
        )
        self.assertClose(roots["lambda2"].selected, -0.467538415699738)
        self.assertIsNone(roots["lambda1_D1_printed"].selected)

    def test_baseline_135_degrees(self) -> None:
        roots = calculate_four_characteristic_roots(
            math.radians(135.0), self.material
        )
        self.assertClose(roots["lambda0"].selected, -0.111538168236385)
        self.assertClose(roots["lambda"].selected, -0.546757699996872)
        self.assertClose(roots["lambda1"].selected, -0.458591400438215)
        self.assertClose(
            roots["lambda1_symmetry"].selected, -0.458591400438215
        )
        self.assertClose(roots["lambda2"].selected, -0.300163929823271)
        self.assertClose(
            roots["lambda1_D1_printed"].selected, -0.165819966896308
        )

    def test_material_swap_definition_of_lambda1(self) -> None:
        alpha = math.radians(135.0)
        roots = calculate_four_characteristic_roots(alpha, self.material)
        mirrored = calculate_four_characteristic_roots(
            math.pi - alpha, self.material.swapped()
        )
        self.assertClose(roots["lambda0"].selected, mirrored["lambda0"].selected)
        self.assertClose(roots["lambda"].selected, mirrored["lambda"].selected)
        self.assertClose(roots["lambda1"].selected, mirrored["lambda2"].selected)

    def test_corrected_D1_is_pointwise_material_swap_of_D2(self) -> None:
        materials = (
            self.material,
            MaterialPair(2.3, 1.1, 0.22, 0.34),
        )
        for material in materials:
            swapped = material.swapped()
            for angle in (15.0, 45.0, 75.0, 105.0, 135.0, 165.0):
                alpha = math.radians(angle)
                for p in (-0.9, -0.5, -0.1):
                    direct = determinant_D1_corrected(p, alpha, material)
                    transformed = material.e * determinant_D2_printed(
                        p, math.pi - alpha, swapped
                    )
                    self.assertAlmostEqual(direct, transformed, places=12)

    def test_selected_residuals(self) -> None:
        for angle in (15.0, 45.0, 75.0, 105.0, 135.0, 165.0):
            roots = calculate_four_characteristic_roots(
                math.radians(angle), self.material
            )
            for name in (
                "lambda0",
                "lambda",
                "lambda1",
                "lambda1_symmetry",
                "lambda2",
            ):
                result = roots[name]
                if result.selected is not None:
                    self.assertIsNotNone(result.residual)
                    assert result.residual is not None
                    self.assertLess(result.residual, 1.0e-8)

    def test_printed_D1_is_not_material_swap_of_printed_D2(self) -> None:
        alpha = math.radians(135.0)
        p = -0.4
        direct = determinant_D1_printed(p, alpha, self.material)
        transformed = self.material.e * determinant_D2_printed(
            p, math.pi - alpha, self.material.swapped()
        )
        self.assertGreater(abs(direct - transformed), 1.0e-2)


if __name__ == "__main__":
    unittest.main(verbosity=2)
