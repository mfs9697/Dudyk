# Analytical queries identified during translation

These checks compare the approved equations with one another. The translation
retains the source formulas. Resolve these points before treating the
English derivation as publication-ready.

## AQ-AN-01: stress transform and its analyticity strip

Location: Section 3.1, definition of Phi_i^+ and eq:wiener-hopf-functional;
Section 2, eq:matched-far-field.

Write A = C Q_i d_i^lambda. The matching condition gives
sigma_theta(rho d_i,beta_i) = A rho^lambda + o(rho^-1).
The displayed raw integral from 1 to infinity therefore converges at
infinity only for Re p < -1-lambda, since

    integral_1^infinity A rho^(p+lambda) d rho
      = -A/(p+lambda+1).

Because -1 < lambda < 0, this convergence region does not include p = 0.
The integral as printed cannot itself define a function analytic
throughout the left half-plane or in a strip straddling the imaginary
axis. Its continuation contains the matching-field pole unless that
term is explicitly subtracted.

Subtracting A rho^lambda inside the integral is a possible regularization,
but it changes the meaning of Phi_i^+ and requires checking the rational
forcing term and the signs in the functional equation and its solution.
Moreover, the stated remainder o(rho^-1) alone does not establish
convergence at p = 0 or any positive-width strip to its right. A stronger
decay estimate or an explicit continuation prescription is needed.

Requested author decision: specify whether Phi_i^+ is a raw transform,
a regularized transform, or an analytically continued quantity; state
its actual domain and reconcile the definition with the functional
equation. Do not silently change the far-field remainder.

## AQ-AN-02: factor argument in the opening formula

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

Requested author decision: confirm whether G_i^+(-1-lambda) is a
typographical error in both opening formulas, or identify the preceding
relation or convention that changes this reduction. Then compare the
confirmed expression against the numerical implementation and opening
plots before modifying any results.

The derivative J_i = dW_i/dd_i was also checked directly against the
printed W_i proportional to d_i^2: the factor of two is consistent.
This limited check does not validate the complete transform solution.
