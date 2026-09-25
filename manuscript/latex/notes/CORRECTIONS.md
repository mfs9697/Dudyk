# Corrections that must survive the Word-to-TeX transfer

This checklist combines the author corrections with the completed repository
audit.

1. Use the symmetry-corrected determinant `D1_corrected`. In the second
   product, the two `p sin(2 alpha)` signs are opposite to those printed in
   the draft. The authors confirmed that their calculation programs used the
   corrected formula.
2. Use the material-direction convention `beta1=pi`, `beta2=0`. The reversed
   labels near Eq. (A.3) are a typographical error.
3. Restore the missing powers `sigma_i^2` in the work and zone-related
   energy expressions.
4. In the process-zone opening formula use `G_i^+(-1)`, not
   `G_i^+(-1-lambda)`. M. V. Dudyk independently rechecked and confirmed
   this correction on 25 September 2026.
5. In `W_i` and `J_i` use the coefficients `8/pi` and `16/pi`,
   respectively, instead of `32/(9 pi)` and `64/(9 pi)`. The normalized
   energy formula therefore contains `-4 lambda/[pi(lambda+2)(G_i^+(-1))^2]`.
6. Use the material-2 kernel and its plus factors consistently in the
   material-2 process-zone calculation. The historical 10-degree Figure-2
   curve used an incorrect index and is obsolete.
7. Do not use the fixed Mathcad contour `T=40` as a converged small-angle
   reference. Preserve the August Mathcad table only as historical regression
   for the pre-25-September opening/energy formulas. Figure 3 uses the
   angle-adaptive contour documented in `docs/REPRODUCIBILITY.md`.
8. Treat `alpha=90 degrees` as a degenerate analytic limit, not an ordinary
   computed root or process-zone row.
9. Define the selected characteristic root unambiguously as the most negative
   real root in `(-1,0)` continuously connected to the reported branch.
10. Do not describe the angular maxima of `d_i/l`, `delta_i'`, and `J_i'`
    as coincident. In the regenerated one-degree sweep of the principal
    negative-load material-1 branch they occur at 35, 32, and 33 degrees,
    respectively.
11. Preserve the superposition step in the Wiener--Hopf derivation:
    `Phi_i^+` is the Mellin transform of the correction stress
    `sigma_hat_i = sigma_theta - C Q_i r^lambda`, not of the total stress.
    The initial common Mellin strip is
    `max(-1-lambda,-1-lambda_i) < Re p < 0`; the factorization contour is
    reached by analytic/meromorphic continuation of the functional relation.
