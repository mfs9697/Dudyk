# Reproducibility protocol

## Scope

This protocol independently recalculates the four stress-singularity
exponents in Figure 4 of the supplied manuscript for

\[
E_1/E_2=0.5,\qquad \nu_1=\nu_2=0.3,\qquad
\alpha=1^\circ,\ldots,179^\circ.
\]

It tests the printed equations, the manuscript's material-interchange rule,
and the proposed two-sign correction of `D1`. It does not reproduce the later
Wiener-Hopf factorization or the process-zone length, opening, and energy
curves; those require a separate inventory and calculation stage.

## Independent implementations

1. MATLAB R2023a implementation in `matlab/`.
2. Standard-library Python implementation in `python/characteristic_roots.py`.

Both implementations solve

\[
D_j(-1-\lambda_j)=0,\qquad -1<\lambda_j<0,
\]

using an interval scan followed by a bracketed scalar root calculation.
Endpoint roots are excluded. The selected branch is the most negative real
root in the open interval.

## Required execution

MATLAB:

```matlab
addpath('matlab');
run_characteristic_root_tests
generate_baseline_sweep
generate_figure4
```

Python:

```bash
python -m unittest discover -s tests -v
python python/characteristic_roots.py \
  --alpha-deg 45 \
  --output-json results/baseline_example.json \
  --sweep-csv results/baseline_roots_1deg.csv
python python/plot_figure4.py
```

## Numerical checkpoints

For the baseline material pair:

| Angle | `lambda0` | `lambda` | `lambda1` | `lambda2` |
| ---: | ---: | ---: | ---: | ---: |
| 45 deg | -0.0890898075 | -0.6131972266 | -0.3938308090 | -0.4675384157 |
| 135 deg | -0.1115381682 | -0.5467577000 | -0.4585914004 | -0.3001639298 |

At 45 degrees the printed `D1` has no sign-changing interior root. At
135 degrees its selected root is approximately `-0.1658199669`, rather than
the Figure-4 value `-0.4585914004`.

## Acceptance criteria

- all Python tests pass;
- all MATLAB tests pass;
- selected determinant residuals are below `1e-7`;
- MATLAB-Python differences for the four physical roots are below `1e-6`;
- `D1_corrected(p)` equals `e*D2_swapped(p)` to floating-point precision;
- `lambda1` agrees with `lambda1_symmetry` to the root-search tolerance;
- both implementations exclude the degenerate 90-degree value consistently;
- the publication figure and the printed-`D1` diagnostic are separate.

## Verified result

The MATLAB suite passed on 5 August 2026. Across all 179 rows, the maximum
MATLAB-Python differences were `3.17e-10`, `4.74e-9`, `5.17e-11`, and
`2.70e-10` for `lambda0`, `lambda`, `lambda1`, and `lambda2`, respectively.
There were no mismatches in root availability.

## Remaining limitation

The original source code and symbolic derivation used to produce the
manuscript are unavailable. The proposed correction is therefore established
by the manuscript's exact material-swap symmetry and by reproduction of
Figure 4, but it should still be checked against the authors' original notes
before the revised equation is described as the recovered original formula.
