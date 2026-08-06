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

## Physical-admissibility reconstruction

The complete `lambda1` and `lambda2` roots are mathematical solutions of the
characteristic equations. The process-zone model additionally requires

\[
Cg_2<0,\qquad CQ_i>0.
\]

The MATLAB plot evaluates the Appendix-A expression

\[
\begin{aligned}
g_2={}&(1-e)\cos[\lambda_0(\pi-\alpha)]
\{(\lambda_0+1)\sin 2\alpha
+\sin[2(\lambda_0+1)\alpha]\}\\
&+e(1+\kappa_2)\sin(\lambda_0\pi)
\cos[(\lambda_0+2)\alpha].
\end{aligned}
\]

For the documented baseline, the manuscript reports `Q1<0, Q2>0` below
90 degrees and the opposite signs above 90 degrees. Combining these signs
with the computed `g2` signs produces exactly four admissible segments:

| Load sign | Branch | Material | Angle interval | Plot style |
| --- | --- | ---: | --- | --- |
| `C>0` | `lambda2` | 2 | `0 < alpha < alpha1` | green dashed |
| `C<0` | `lambda1` | 1 | `alpha1 < alpha < 90` | blue solid |
| `C<0` | `lambda2` | 2 | `90 < alpha < alpha2` | blue dashed |
| `C>0` | `lambda1` | 1 | `alpha2 < alpha < 180` | green solid |

The legend follows the original manuscript by identifying these colored
segments with the representative normalized loads `sigma'=+0.5` and
`sigma'=-0.5`. Since

\[
\sigma'=\frac{C l^{\lambda_0}}{\sigma_i},
\]

its sign is the sign of `C` and therefore selects the admissible branch. Its
magnitude controls the process-zone length, opening, and energy-release rate
in the later calculations, but it does not change any of the four
characteristic exponents in Figure 4. The remaining portions of `lambda1` and
`lambda2` are shown as gray dotted complete mathematical branches and are
identified as such in the legend.

Linear interpolation of the one-degree `g2` sweep gives
`alpha1=12.9141 degrees` and `alpha2=107.0842 degrees`, matching the rounded
Table-1 values 12.9 and 107.1 degrees. Because the `Q1/Q2` sign calculation
has not yet been independently implemented for arbitrary materials, the
MATLAB helper rejects material pairs other than this verified baseline.

## Acceptance criteria

- all Python tests pass;
- all MATLAB tests pass;
- selected determinant residuals are below `1e-7`;
- MATLAB-Python differences for the four physical roots are below `1e-6`;
- `D1_corrected(p)` equals `e*D2_swapped(p)` to floating-point precision;
- `lambda1` agrees with `lambda1_symmetry` to the root-search tolerance;
- both implementations exclude the degenerate 90-degree value consistently;
- the complete mathematical curves, physically admissible segments, and the
  printed-`D1` diagnostic are separate;
- the `g2` sign changes for the Figure-4 baseline agree with Table 1 at
  approximately 12.9 and 107.1 degrees.

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
