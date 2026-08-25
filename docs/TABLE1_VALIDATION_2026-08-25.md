# Table 1 validation — 25 August 2026

## Purpose

This note independently checks Table 1 of the revised author manuscript. The table lists the two angles \(\alpha_1<90^\circ\) and \(\alpha_2>90^\circ\) at which the coefficient \(g_2\) changes sign for

\[
\nu_1=\nu_2=0.3,
\qquad E_1/E_2<1.
\]

The transition condition is

\[
g_2(\alpha,\lambda_0)=0,
\]

where \(\lambda_0\in(-1,0)\) is the selected intact-corner singularity exponent satisfying

\[
D_0(-1-\lambda_0)=0.
\]

The formulas for \(D_0\) and \(g_2\) are the same expressions implemented independently in the Python and MATLAB verification paths in this repository.

## Independent calculation

The values below were obtained by solving the coupled equations \(D_0=0\) and \(g_2=0\) for \((\lambda_0,\alpha)\). A high-precision Python calculation was first used to avoid the interpolation error introduced by the previous one-degree angular sweep.

| \(E_1/E_2\) | Author \(\alpha_1\), deg | Recalculated \(\alpha_1\), deg | Author \(\alpha_2\), deg | Recalculated \(\alpha_2\), deg |
| ---: | ---: | ---: | ---: | ---: |
| 0.01 | 2.6 | 2.581832678 | 108.0 | 108.015911142 |
| 0.10 | 7.1 | 7.029918876 | 107.9 | 107.903632305 |
| 0.20 | 9.2 | 9.247834730 | 107.7 | 107.722236761 |
| 0.30 | 10.8 | 10.771629646 | 107.5 | 107.515596843 |
| 0.40 | 12.0 | 11.952079733 | 107.3 | 107.301695329 |
| 0.50 | 12.9 | 12.920209601 | 107.1 | 107.089673026 |
| 0.60 | 13.7 | 13.741687784 | 106.9 | 106.884164620 |
| 0.70 | 14.5 | 14.454881569 | 106.7 | 106.687411421 |
| 0.80 | 15.1 | 15.084458728 | 106.5 | 106.500349474 |
| 0.90 | 15.6 | 15.647354880 | 106.3 | 106.323194478 |
| 0.99 | 16.1 | 16.107098612 | 106.2 | 106.172081737 |

The machine-readable Python comparison is stored in `results/table1_transition_angles.csv`.

## Independent MATLAB confirmation

The same eleven material contrasts were then recalculated with `matlab/verify_table1_transition_angles.m`, using the existing audited MATLAB functions `find_characteristic_roots.m`, `characteristic_determinant.m`, and `normalize_material.m`. The MATLAB run independently solved for the selected intact-corner root \(\lambda_0\) and then located both zeros of \(g_2\) with `fzero`.

The MATLAB values agree with the Python values to all nine decimal places printed in the verification output. At every transition, both defining residuals are at machine-precision level: the reported \(|g_2|\) and \(|D_0(-1-\lambda_0)|\) values are approximately \(10^{-17}\)–\(10^{-16}\), with several values exactly zero at floating-point precision.

The MATLAB output is stored in `results/table1_transition_angles_matlab.csv`.

This two-code agreement removes the earlier ambiguity between exact transition roots and values obtained by linear interpolation of the one-degree Figure-4 sweep.

## Main findings

1. The author's Table 1 is essentially correct at its stated one-decimal precision.
2. All \(\alpha_2\) entries round to the published author values.
3. Ten of eleven \(\alpha_1\) entries also round to the author values. The exception is \(E_1/E_2=0.1\):
   \[
   \alpha_1=7.029918876^\circ,
   \]
   which rounds to \(7.0^\circ\), not \(7.1^\circ\). This entry should be corrected if the table is retained at one-decimal precision.
4. For the baseline \(E_1/E_2=0.5\), the independently confirmed transition angles are
   \[
   \boxed{\alpha_1=12.920209601^\circ,\qquad
   \alpha_2=107.089673026^\circ.}
   \]
5. The values \(12.9141^\circ\) and \(107.0842^\circ\) previously recorded in the manuscript integration were not exact roots. They are the linear-interpolation estimates obtained from the one-degree Figure-4 sweep. They should be replaced by the exact values above wherever the manuscript identifies the roots of \(g_2=0\).

## Recommended manuscript presentation

For Table 1, two decimals are a reasonable compromise between reproducibility and unnecessary numerical precision. The corresponding recommended table is:

| \(E_1/E_2\) | 0.01 | 0.10 | 0.20 | 0.30 | 0.40 | 0.50 | 0.60 | 0.70 | 0.80 | 0.90 | 0.99 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| \(\alpha_1\), deg | 2.58 | 7.03 | 9.25 | 10.77 | 11.95 | 12.92 | 13.74 | 14.45 | 15.08 | 15.65 | 16.11 |
| \(\alpha_2\), deg | 108.02 | 107.90 | 107.72 | 107.52 | 107.30 | 107.09 | 106.88 | 106.69 | 106.50 | 106.32 | 106.17 |

The four-decimal baseline values may be quoted in the text when precise transition locations are useful for defining the admissible angular intervals.
