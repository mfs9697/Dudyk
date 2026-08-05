# Dudyk paper reproducibility workspace

This repository contains the source manuscript, an equation audit, and two
independent implementations of the four stress-singularity exponents plotted
in Figure 4:

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
- `figures/`: recalculated Figure 4 and a separate printed-`D1` audit plot.

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
example_reproduce_roots
generate_baseline_sweep
generate_figure4
```

The last two commands write:

- `results/baseline_roots_matlab_1deg.csv`;
- `figures/figure4_recalculated.pdf` and `.png`;
- `figures/figure4_D1_audit.pdf` and `.png`.

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
