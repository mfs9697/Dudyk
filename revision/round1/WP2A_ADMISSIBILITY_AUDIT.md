# WP2A — Single-zone admissibility audit

## Reviewer question

Is the statement that only one material admits a physically admissible
process zone a general property, or only a numerical observation for the
reported parameter sets?

## Existing state

The model tests, for each candidate material (i),

[
C g_2<0,qquad C Q_i>0,
]

with

[
Q_i=g_1 q_i l^{lambda_0-lambda}.
]

Since (l>0), the sign of (Q_i) is the sign of (g_1q_i).

The current routine `matlab/calculate_figure4_admissibility.m` does not
compute general (Q_i) signs. It is intentionally limited to
(E_1/E_2=0.5), (
u_1=
u_2=0.3), and inserts the baseline sign map for
(q_1,q_2). In contrast,
`matlab/calculate_asymptotic_coefficients.m` evaluates (q_1,q_2) and the
full (Q_i) prefactors from the analytical formulas and Wiener--Hopf factors.
That function is the correct starting point for the broader audit.

## Required calculation

Create a new verification routine that, for every sampled material/angle
point:

1. solves for (lambda_0) and (lambda);
2. evaluates (g_2,Q_1,Q_2) independently of the Figure-4 hard-coded sign
   map;
3. evaluates admissibility for both signs of (C);
4. records whether neither, exactly one, or both materials are admissible;
5. checks material-interchange symmetry;
6. refines around any candidate transition or simultaneous-admissibility
   point.

### Search domain

Use a staged search rather than one coarse grid.

**Stage A — broad mathematical scan**

- (E_1/E_2>0), logarithmically sampled over at least (10^{-3}) to
  (10^3);
- (
u_1,
u_2in(-1,0.5)), with dense practical coverage and additional
  samples near the mathematical limits;
- (0<alpha<pi), excluding the degenerate straight-interface point
  (alpha=pi/2).

**Stage B — adaptive refinement**

Refine every sign-change surface of (g_2,Q_1,Q_2) and every point where
(|Q_i|) or (|g_2|) is small.

**Stage C — independent spot checks**

For representative and boundary cases, recompute the signs by a second
route or higher precision.

## Verdict classes

- **A: proven exclusive** — only if an analytical sign argument is obtained.
- **B: numerically exclusive on domain D** — if no counterexample is found;
  the manuscript must explicitly state domain D and avoid a theorem claim.
- **C: counterexample found** — report it and revise the branching-direction
  interpretation accordingly.

## Initial status

Started. The repository audit confirms that general exclusivity is presently
unverified; only the baseline sign map was encoded.
