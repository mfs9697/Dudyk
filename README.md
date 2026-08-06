# Dudyk paper reproducibility workspace

This repository contains the source manuscript, an equation audit, and two
independent implementations of the four stress-singularity exponents plotted
in Figure 4. The MATLAB implementation also contains the first controlled
Wiener-Hopf reconstruction for the 45-degree solid-blue case in Figures 2
and 3. The four root quantities are:

- `lambda0`: intact broken bimaterial interface;
- `lambda`: interface after formation of the symmetric shear crack;
- `lambda1`: process zone in material 1;
- `lambda2`: process zone in material 2.

The calculation preserves the determinant printed as `D1_printed` for audit
purposes and adds `D1_corrected`, the material-symmetry image of the printed
`D2`. The two formulas differ in the signs of the two `p*sin(2*alpha)` terms
in the second product. Only `D1_corrected` reproduces Figure 4 and the
material-interchange rule stated in the manuscript.

## Repository layout

- `manuscript/original/Стаття.pdf`: supplied Ukrainian manuscript;
- `docs/EQUATION_INVENTORY.md`: equation-by-equation audit and proposed
  correction;
- `docs/REPRODUCIBILITY.md`: independent-recalculation protocol and acceptance
  criteria;
- `matlab/`: MATLAB R2023a implementation, regression tests, sweeps, and plots;
- `python/`: standard-library reference calculation and optional plotting
  script;
- `tests/`: Python regression and symmetry tests;
- `results/`: independently generated CSV and JSON reference results;
- `figures/`: complete mathematical curves, the physically admissible
  Figure-4 segments, a separate printed-`D1` audit plot, and the 45-degree
  Figure-2 calibration output.

## Verification status

The Python regression suite contains six tests and passes. It verifies the
reported roots at 45 and 135 degrees, determinant residuals, material-swap
symmetry, the pointwise corrected-`D1` identity, and failure of the printed
`D1` to satisfy that identity.

The MATLAB R2023a regression suite was run independently on 5 August 2026 and
reported:

```text
All characteristic-root tests passed.
```

All 179 MATLAB angle rows were compared with the Python reference. Maximum
absolute differences for the four physical branches were:

| Branch | Maximum absolute difference |
| --- | ---: |
| `lambda0` | `3.17e-10` |
| `lambda` | `4.74e-9` |
| `lambda1` | `5.17e-11` |
| `lambda2` | `2.70e-10` |

The largest residual in the independently generated MATLAB data was below
`1.0e-14`. At 90 degrees the geometry is degenerate, so the CSV contains
`NaN`/empty values rather than treating zero as an ordinary interior root.

## MATLAB workflow

From the repository root:

```matlab
addpath('matlab');
run_characteristic_root_tests
run_process_zone_tests
example_reproduce_roots
generate_baseline_sweep
generate_figure4
generate_figure2_45deg_calibration
```

The baseline sweep and Figure-4 commands write:

- `results/baseline_roots_matlab_1deg.csv`;
- `figures/figure4_recalculated.pdf` and `.png`;
- `figures/figure4_admissible_segments.pdf` and `.png`;
- `figures/figure4_D1_audit.pdf` and `.png`.

The final command writes:

- `results/figure2_45deg_calibration.csv`;
- `figures/figure2_45deg_calibration.pdf` and `.png`.

The calibration case is

```text
alpha = 45 degrees, C < 0, material 1,
E1/E2 = 0.5, nu1 = nu2 = 0.3.
```

It evaluates the Appendix-A coefficients, the base and material-1
Wiener-Hopf plus factors, and normalized Eqs. (8)-(10). At
`sigma'=-0.5`, the regression checkpoints are approximately
`d1/l=0.14743436`, `delta1'=0.14544227`, and `J1'=0.03716462`.
The exponent controlling the load power law in Eqs. (8)-(10) is the common
shear-cracked-corner exponent `lambda=-0.61319723`; it is not the Figure-4
root `lambda1`.

`figure4_recalculated` is the complete mathematical root map.
`figure4_admissible_segments` overlays the original physical segments selected
by `C*g2 < 0` and `C*Qi > 0`. The admissibility helper is deliberately limited
to the documented Figure-4 baseline; other material pairs require a verified
calculation of the `Q1` and `Q2` signs before they can be plotted this way.

For one angle:

```matlab
material = struct('E1', 0.5, 'E2', 1.0, 'nu1', 0.3, 'nu2', 0.3);
roots = calculate_characteristic_roots(deg2rad(45), material);

roots.lambda0.selected
roots.lambda.selected
roots.lambda1.selected
roots.lambda2.selected
roots.lambda1_symmetry.selected
roots.lambda1_D1_printed.selected
```

`lambda1` is the direct root of `D1_corrected`. `lambda1_symmetry` is an
independent calculation through transformed `D2`; the two values must agree.

## Python workflow

Python 3.10 or newer is recommended. The root calculation and tests use only
the standard library.

```bash
python -m unittest discover -s tests -v

python python/characteristic_roots.py \
  --alpha-deg 45 \
  --output-json results/baseline_example.json \
  --sweep-csv results/baseline_roots_1deg.csv
```

The optional plotting script requires Matplotlib:

```bash
python python/plot_figure4.py
```

## Root convention

Every characteristic equation is solved using

```text
p = -1 - lambda,   -1 < lambda < 0.
```

Endpoint roots are excluded. The selected physical branch is the most
negative real root in this interval, continuously connected to the reported
curve. All detected sign-changing roots are retained in the detailed result.
