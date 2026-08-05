# Characteristic-root reproducibility package

This package implements the four stress-singularity exponents used in
Figure 4 of the supplied manuscript:

- `lambda0`: intact broken interface;
- `lambda`: interface after formation of the symmetric shear crack;
- `lambda1`: post-zone exponent in material 1, calculated by material-swap
  symmetry;
- `lambda2`: post-zone exponent in material 2.

The package also exposes the direct root of the printed `D1` determinant as a
diagnostic because it does not reproduce the material-1 branch in Figure 4.
See [EQUATION_INVENTORY.md](EQUATION_INVENTORY.md) for the complete formula
audit.

## Contents

- `python/characteristic_roots.py`: tested, standard-library reference code;
- `matlab/*.m`: MATLAB implementation for the manuscript workflow;
- `tests/test_characteristic_roots.py`: regression, residual, and symmetry
  tests;
- `results/baseline_roots_1deg.csv`: recalculation for
  `E1/E2=0.5`, `nu1=nu2=0.3`, and integer angles from 1 to 179 degrees;
- `results/baseline_example.json`: detailed output at 45 degrees.

## Python usage

Python 3.10 or newer is recommended. No third-party packages are required.

```bash
python python/characteristic_roots.py --alpha-deg 45
```

Generate the baseline one-degree sweep:

```bash
python python/characteristic_roots.py \
  --E1 0.5 --E2 1 --nu1 0.3 --nu2 0.3 \
  --sweep-csv results/baseline_roots_1deg.csv
```

Run the tests from the package root:

```bash
python -m unittest discover -s tests -v
```

## MATLAB usage

Add the MATLAB folder to the path and run:

```matlab
addpath('matlab');
example_reproduce_roots
run_characteristic_root_tests
generate_baseline_sweep
```

For one angle:

```matlab
material = struct('E1',0.5,'E2',1.0,'nu1',0.3,'nu2',0.3);
roots = calculate_characteristic_roots(deg2rad(45), material);

roots.lambda0.selected
roots.lambda.selected
roots.lambda1.selected
roots.lambda2.selected
```

Each result also contains all detected real roots, the selected root, and the
absolute determinant residual.

## Root convention

The code solves

```text
p = -1 - lambda,   -1 < lambda < 0
```

and selects the smallest real `lambda` by default. Endpoint roots are excluded.
At the degenerate flat-interface value `alpha=90 degrees`, the code returns no
interior root rather than inserting the limiting value zero.

## Verification status

The Python reference implementation has been executed in the supplied
workspace. Five automated tests pass, covering:

- the four baseline roots at 45 and 135 degrees;
- characteristic-equation residuals;
- material-swap symmetry;
- the numerical disagreement between the direct printed `D1` and the
  Figure-4 material-1 branch.

The MATLAB code is a direct vectorized translation of the tested Python
formulas. A MATLAB executable was not available in the build environment, so
`run_characteristic_root_tests.m` is included for immediate verification in
MATLAB R2023a.
