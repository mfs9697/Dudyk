# Analytical queries identified during translation

These checks record analytical issues identified during translation.
Both queries were resolved on September 25, 2026. The current English
derivation contains the corrected formulas and the restored superposition
step; this file is retained as an audit record.

## AQ-AN-01: stress transform and its analyticity strip — RESOLVED September 25, 2026

Location: Section 2, eq:matched-far-field; Section 3.1, definition of
`Phi_i^+` and eq:wiener-hopf-functional.

The apparent inconsistency came from omitting the superposition step used in
the source methodology. The 2024 predecessor paper explicitly decomposes the
full solution into (i) the known no-process-zone field and (ii) a correction
problem whose stresses decay as `o(r^-1)` at infinity. The same construction
appears in the earlier 2006 Wiener--Hopf treatment.

For the present scalar problem, write

    A_i = C Q_i d_i^lambda

and define the correction stress on the active bisector by

    sigma_hat_i(r) = sigma_theta(r,beta_i) - C Q_i r^lambda.

The matching condition gives

    sigma_hat_i(r) = o(r^-1),  r -> infinity,

whereas on the active process-zone segment `0<r<d_i`,

    sigma_hat_i(r) = sigma_i - C Q_i r^lambda.

Thus the plus transform is the Mellin transform of the correction stress,

    Phi_i^+(p)
      = integral_1^infinity sigma_hat_i(rho d_i) rho^p d rho,

not the raw transform of the total stress. Consequently, on `0<rho<1`,

    integral_0^1
      [sigma_i - C Q_i d_i^lambda rho^lambda] rho^p d rho
    = sigma_i/(p+1)
      - C Q_i d_i^lambda/(p+lambda+1),

which reproduces the printed functional equation without changing any sign
or forcing term.

The decay `sigma_hat_i=o(r^-1)` makes `Phi_i^+` analytic for
`Re p<0`. Near the corner, the post-zone eigenfield gives the displacement
gradient order `r^lambda_i`, so `Phi_i^-` is analytic for
`Re p>-1-lambda_i`. The transformed boundary traction on the active segment
also requires `Re p>-1-lambda`. Therefore the functional equation is
initially valid in the common Mellin strip

    max{-1-lambda, -1-lambda_i} < Re p < 0.

This is the correct initial convergence strip. The earlier statement of a
strip `-epsilon_2 < Re p < epsilon_1` straddling the imaginary axis was
stronger than the stated asymptotics justify.

The Wiener--Hopf construction does not require the raw integral defining
`Phi_i^+` to converge on `Re p=0`. The functional relation, established
in the nonempty overlap strip, supplies the analytic/meromorphic continuation
of the separated combinations to the factorization contour. The manuscript
now states this explicitly and no longer claims integral convergence on the
imaginary axis.

Resolution: restore the superposition step in Section 2, define `Phi_i^+`
as the correction-stress transform in Section 3, replace the overstated
common strip by the actual Mellin overlap, and retain the existing functional
equation and Wiener--Hopf solution unchanged. No numerical recalculation is
required.

## AQ-AN-02: factor argument in the opening formula — RESOLVED September 25, 2026

Location: eq:process-zone-opening and the normalized delta_i' formula.

The source denominator contains G_i^+(-1-lambda). Direct substitution of
the source zone-length relation into the source Phi_i^- solution instead
appears to give G_i^+(-1).

For a transparent check, write

    A = sigma_i K^+(-1) / G_i^+(-1),
    B = C Q_i d_i^lambda K^+(-1-lambda)
        / [(1+lambda) G_i^+(-1-lambda)].

The condition k_i = 0 is B = A. At p = 0, the second line of
eq:wiener-hopf-solution therefore becomes

    Phi_i^-(0)
      = K^-(0) G_i^-(0) [A - B/(1+lambda)]
      = K^-(0) G_i^-(0) A lambda/(1+lambda).

The source factorization for a positive even kernel, normalized at
infinity, gives K^-(0) = 1/sqrt(pi) and
G_i^-(0) = 1/sqrt(G_i(0)). Combining this with the displayed definition
delta_i = -4(1-nu_i^2)d_i Phi_i^-(0)/E_i yields

    delta_i =
      -4(1-nu_i^2) sigma_i lambda K^+(-1) d_i
      / [E_i sqrt(pi G_i(0)) (1+lambda) G_i^+(-1)].

Author decision (September 25, 2026): M. V. Dudyk independently rechecked
the derivation and confirmed that the direct reduction is correct:
G_i^+(-1) must replace G_i^+(-1-lambda) in the opening formula and its
normalized form. He also confirmed a second coefficient correction found
during the same audit: W_i and J_i must contain 8/pi and 16/pi,
respectively, instead of 32/(9 pi) and 64/(9 pi).

The manuscript formulas and MATLAB implementation were corrected, and
Figures 2 and 3 and their numerical discussion were regenerated. The
process-zone length formula is unaffected.

The derivative J_i = dW_i/dd_i was also checked directly against the
printed W_i proportional to d_i^2: the factor of two is consistent.
This limited check does not validate the complete transform solution.


### Batch 3 numerical-implementation check — September 22, 2026

The current MATLAB routine \`calculate_process_zone_parameters.m\` evaluates
the process-zone plus factor at both \(p=-1-\lambda\) and \(p=-1\). Its
opening multiplier is implemented as

    -lambda K^+(-1) /
    [sqrt(pi G_i(0)) (1+lambda) G_i^+(-1-lambda)],

so the numerical Figure-2 and Figure-3 opening curves follow the printed
opening formula. The independently compared corrected author Mathcad values
documented in \`docs/AUTHOR_VALIDATION_2026-08-18.md\` use the same factor
convention. Therefore the excellent numerical reproduction established implementation
agreement with the superseded formula, but it did not choose between that
formula and the direct algebraic reduction recorded above. This check is now
historical: after the author confirmed the analytical correction, the
numerical implementation and plots were updated. AQ-AN-02 is closed.
