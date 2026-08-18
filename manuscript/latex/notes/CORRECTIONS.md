# Corrections that must survive the Word-to-TeX transfer

This checklist combines the five comments in the edited Word manuscript with
the completed repository audit.

1. Use the symmetry-corrected determinant `D1_corrected`. In the second
   product, the two `p sin(2 alpha)` signs are opposite to those printed in
   the draft. The authors confirmed that their calculation programs used the
   corrected formula.
2. Use the material-direction convention `beta1=pi`, `beta2=0`. The reversed
   labels near Eq. (A.3) are a typographical error.
3. Restore the missing powers `sigma_i^2` in the potential-energy and
   energy-release-rate expressions. The normalized numerical results are
   unchanged when the normalization is applied consistently.
4. Use the material-2 kernel and its plus factors consistently in the
   material-2 process-zone calculation. The historical 10-degree Figure-2
   curve used an incorrect index and is obsolete.
5. Do not use the fixed Mathcad contour `T=40` as a converged small-angle
   reference. Preserve it only as an independent reproduction test. Figure 3
   uses the angle-adaptive contour documented in `docs/REPRODUCIBILITY.md`.
6. Treat `alpha=90 degrees` as a degenerate analytic limit, not an ordinary
   computed root or process-zone row.
7. Define the selected characteristic root unambiguously as the most negative
   real root in `(-1,0)` continuously connected to the reported branch.
