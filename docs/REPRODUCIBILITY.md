# Reproducibility protocol

## Scope

This protocol independently recalculates the four stress-singularity
exponents in Figure 4 of the supplied manuscript for

\[
E_1/E_2=0.5,\qquad \nu_1=\nu_2=0.3,\qquad
\alpha=1^\circ,\ldots,179^\circ.
\]

It tests the printed equations, the manuscript's material-interchange rule,
and the author-confirmed two-sign correction of `D1`. A second, MATLAB-only
stage
reconstructs the Wiener-Hopf factors and process-zone length, opening, and
energy rate for all four Figure-2 cases. All four calculations were
executed independently in MATLAB R2023a. The original 10-degree discrepancy
was subsequently traced by the authors to an incorrect material index in a
Wiener-Hopf plus factor. The complete Figure-3 angle sweep remains a later
stage.

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
run_process_zone_tests
generate_baseline_sweep
generate_figure4
generate_figure2_45deg_calibration
generate_figure2
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

For the Figure-2 process-zone calculations:

- the base, material-1, and material-2 kernel limits at zero match their
  analytic Taylor limits;
- the corrected material-1 kernel equals the material-swapped material-2
  kernel both on the real axis and on the factorization contour;
- the kernels are real and positive on the sampled imaginary axis;
- factor values at 45 degrees computed with contour truncations 20 and 40
  agree within `2e-8`;
- the more slowly converging 10-degree base and material-2 factors computed
  with truncations 40 and 60 agree within `1e-6`;
- the calculated `Q_i` and `g2` signs admit exactly the four load/material
  combinations printed in the Figure-2 legend;
- the opposite load sign is rejected for every case;
- `d1/l` follows the exact power law `|sigma'|^(-1/lambda)`;
- `delta1'` and `J1'` remain proportional to `d1/l`;
- at `sigma'=-0.5`, the three normalized values agree with the recorded
  calibration checkpoints within the test tolerances.

## Four-case Figure-2 endpoints

The generator uses 201 load points on each applicable half-axis and the
same baseline material pair as Figure 4. With contour truncation 60, the
endpoint checkpoints are:

| `alpha` | Material | `sigma'` | `lambda` | `d_i/l` | `delta_i'` | `J_i'` |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 10 deg | 2 | +0.5 | -0.8716344816 | 0.0313248064 | 0.0677727059 | 0.0217258213 |
| 45 deg | 1 | -0.5 | -0.6131972266 | 0.1474343617 | 0.1454422653 | 0.0371646165 |
| 105 deg | 2 | -0.5 | -0.2615246972 | 0.0370357093 | 0.0134427769 | 0.0039225730 |
| 135 deg | 1 | +0.5 | -0.5467577000 | 0.0510105194 | 0.0578658843 | 0.0133074138 |

All four rows were generated independently in MATLAB R2023a and the complete
process-zone regression suite passed. The 105- and 135-degree endpoints fall
on the corresponding original curves to the precision readable from the
published plot. The corrected author Mathcad worksheet supplies a second,
independent implementation of the 10-degree endpoint.

### 10-degree discrepancy: author-confirmed resolution

The original green dashed curve at `sigma'=+0.5` is visually approximately
`d_2/l=0.030`, `delta_2'=0.045`, and `J_2'=0.010`. Direct, internally
consistent use of Eqs. (8)-(10) with the material-2 kernel gives the
10-degree row in the table and therefore exposes the original plotted
discrepancy rather than reproducing it by curve fitting.

On 18 August 2026 the authors confirmed that the original calculation
contained an incorrect material index in a Wiener-Hopf plus factor in the
material-2 opening calculation. They also confirmed
`beta_1=pi, beta_2=0` and supplied a corrected Mathcad worksheet in which
the material-2 kernel and its plus factors are used consistently. At
`alpha=10 degrees`, material 2, and `sigma'=+0.5`, the worksheet gives:

| Quantity | Author Mathcad | MATLAB (truncation 60) | Relative difference |
| --- | ---: | ---: | ---: |
| `d_2/l` | 0.031324808641 | 0.031324806384 | 7.22e-8 |
| `delta_2'` | 0.067772709985 | 0.067772705874 | 6.07e-8 |
| `J_2'` | 0.021725819934 | 0.021725821310 | 6.34e-8 |

The small differences are consistent with the Mathcad contour truncation
`[-40,40]` and its evaluation of `G_2(0)` as `G_2(1e-5)`. The corrected
calculation therefore independently validates the repository implementation.
The old Figure-2 and small-angle Figure-3 curves remain historical outputs and
must be regenerated. Because the old Figure-2 energy curve also differs from
the corrected `J_2'` value, the replacement tables should be checked across
all three panels when the authors provide them.

## Verified result

The characteristic-root MATLAB suite passed on 5 August 2026. Across all
179 rows, the maximum MATLAB-Python differences were `3.17e-10`, `4.74e-9`,
`5.17e-11`, and `2.70e-10` for `lambda0`, `lambda`, `lambda1`, and `lambda2`,
respectively. There were no mismatches in root availability. The complete
four-case Figure-2 MATLAB suite was subsequently run and all process-zone
tests passed. The independently supplied author Mathcad result now provides a
second implementation of the corrected 10-degree endpoint.

## Remaining limitations

The author has confirmed that the printed `D1` contained the two sign errors
identified by the material-swap audit and that the original calculation
program used the corrected expression. The author has also confirmed the
direction convention `beta_1=pi, beta_2=0` and supplied a corrected Mathcad
worksheet for the process-zone parameters. The private correspondence,
edited manuscript, and Mathcad source are not committed to this public
repository; only the non-confidential technical conclusions and numerical
checkpoints are recorded here.

The published Figure-2 and Figure-3 curves have not yet been replaced. The
authors plan to provide recalculated numerical tables. The next implementation
stage is a complete Figure-3 angle sweep with systematic contour-convergence
checks near the admissibility boundaries and the degenerate 90-degree limit,
followed by an automated comparison with those author tables.
