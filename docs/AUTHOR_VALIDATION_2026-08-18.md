# Author validation record — 18 August 2026

## Purpose

This note records the non-confidential technical conclusions obtained after
the authors reviewed the repository's equation and reproducibility audit.
The private email, edited Word manuscript, Mathcad worksheet, and its listing
are intentionally not included because this repository is public.

## Confirmed corrections

The authors confirmed the following points:

1. The correct direction convention is
   \[
   \beta_1=\pi,\qquad \beta_2=0.
   \]
   The reversed labels in Appendix A of the earlier paper and in the draft
   manuscript were typographical errors.
2. The index \(i\) in \(D_i\), \(G_i\), \(Q_i\), and \(\beta_i\)
   denotes the material number.
3. The original material-2 process-zone program contained an incorrect index
   in a Wiener-Hopf plus factor in the opening calculation. The corrected
   worksheet uses \(G_2\), \(G_2^+(-1-\lambda)\), and
   \(G_2^+(-1)\) consistently.
4. The printed \(D_1(p)\) transposed the signs of the two
   \(p\sin(2\alpha)\) terms in its second product. The original author
   programs used the corrected expression, so the reported Figure-4
   singularity exponents remain valid.
5. The draft manuscript lost the power in factors \(\sigma_i^2\) in the
   potential-energy and energy-release-rate expressions. Those powers are to
   be restored in the revised text.

## Independent 10-degree comparison

For
\[
E_1/E_2=0.5,\quad \nu_1=\nu_2=0.3,\quad
\alpha=10^\circ,\quad i=2,\quad \sigma'=+0.5,
\]
the corrected author Mathcad worksheet and this repository give:

| Quantity | Author Mathcad | MATLAB, contour 60 | Relative difference |
| --- | ---: | ---: | ---: |
| \(d_2/l\) | 0.031324808641 | 0.031324806384 | 7.22e-8 |
| \(\delta_2'\) | 0.067772709985 | 0.067772705874 | 6.07e-8 |
| \(J_2'\) | 0.021725819934 | 0.021725821310 | 6.34e-8 |

The Mathcad worksheet evaluates the factorization contour on \([-40,40]\)
and approximates \(G_2(0)\) by \(G_2(10^{-5})\). The MATLAB publication
calculation uses contour truncation 60 and the analytic zero limit. These
implementation details account for the observed differences.

## Subsequent small-angle convergence audit

The 10-degree comparison validates the corrected equations and material index,
but the full Figure-3 sweep revealed that the fixed Mathcad truncation
\(T=40\) is not converged at the smallest angles. Direct evaluation could not
initially extend beyond approximately \(T=80\) because numerator and
denominator determinants separately overflow while their ratios remain
finite. The MATLAB implementation now removes their common
\(\exp(2\pi t)\) scale on the imaginary axis and uses an angle-adaptive
contour.

At \(\alpha=1^\circ\), material 2, and \(\sigma'=+0.5\):

| Quantity | Author procedure, \(T=40\) | Converged MATLAB, \(T=690\) | Signed relative change |
| --- | ---: | ---: | ---: |
| \(d_2/l\) | 0.000335848036383 | 0.000334567324703 | -0.3813% |
| \(\delta_2'\) | 0.000277858135311 | 0.000276833276375 | -0.3688% |
| \(J_2'\) | 0.000234391474616 | 0.000235061074026 | +0.2857% |

Increasing the adaptive tail exponent from 24 to 30 changes the computed plus
factors by at most \(8.69\times10^{-13}\) over the tested boundary angles;
the maximum terminal kernel log-deviation is \(1.40\times10^{-8}\).
Therefore the author table is retained as an independent reproduction test at
its stated \(T=40\), whereas the replacement Figure 3 uses the converged
adaptive values.

## Consequences

- The repository's consistent 10-degree calculation is independently
  validated.
- The previously plotted 10-degree Figure-2 curve is obsolete.
- The small-angle material-2 branch and the complete admissible Figure 3
  have now been regenerated with contour-convergence checks.
- Figure 4 may be retained numerically after correcting the printed
  \(D_1(p)\) formula and clarifying physical admissibility.
- The revised manuscript should replace its historical Figures 2 and 3 with
  the corrected repository outputs.
- Any complete recalculated author table should be compared automatically with
  `results/figure3_recalculated.csv`.

The complete Figure-3 angle sweep, contour-convergence audit, and admissibility
checks are now finished. The remaining task is manuscript integration and,
if supplied, external comparison with a complete author table.
