# WP2A — Single-zone admissibility audit

## Reviewer question

Is the statement that only one material admits a physically admissible
process zone a general property, or only a numerical observation for the
reported parameter sets?

## Analytical reduction

For each candidate material \(i\),

$$
Cg_2<0,\qquad CQ_i>0,
$$

and

$$
Q_i=g_1q_i l^{\lambda_0-\lambda}.
$$

Appendix A gives

$$
q_i=
\frac{
2S_i(-1-\lambda)K^+(-1-\lambda)G^+(-1-\lambda)
}{
(\lambda-\lambda_0)D'(-1-\lambda)
K^+(-1-\lambda_0)G^+(-1-\lambda_0)
}.
$$

The multiplier outside \(S_i\) is common to \(i=1,2\). Hence

$$
\boxed{
\operatorname{sgn}(Q_1Q_2)
=
\operatorname{sgn}(S_1S_2)
}.
$$

Simultaneous admissibility for a fixed loading sign would require

$$
CQ_1>0,\qquad CQ_2>0,
$$

and therefore \(Q_1Q_2>0\). Thus any counterexample must have
\(S_1S_2>0\).

## Reproducible numerical audit

The verification script is
\`revision/round1/verify_wp2.py\`.

### Deterministic broad scan

The calculation resolved the cracked-corner eigenvalue \(\lambda\) for
**92,800** nondegenerate parameter combinations:

- 25 logarithmic values of \(E_1/E_2\) from \(10^{-3}\) to \(10^3\);
- \(\nu_1,\nu_2\) independently sampled at
  \(-0.95,-0.75,-0.50,-0.25,0,0.25,0.45,0.49\);
- \(\alpha=3^\circ,6^\circ,\ldots,177^\circ\), excluding
  \(90^\circ\).

Result:

$$
\boxed{\text{number of cases with }S_1S_2>0=0.}
$$

The grid point closest to zero was near the extreme small-angle/material
limit:
\(E_1/E_2=10^{-3}\), \(\nu_1=0.49\), \(\nu_2=-0.95\),
\(\alpha=3^\circ\), with the double-precision product approximately
\(-1.55\times10^{-7}\).

### Continuous random scan

A second deterministic-seed scan used 20,000 continuously sampled cases with

- \(10^{-3}\le E_1/E_2\le10^3\) (log-uniform);
- \(-0.99<\nu_1,\nu_2<0.499\);
- \(0.2^\circ<\alpha<179.8^\circ\).

Again,

$$
\boxed{\text{number of cases with }S_1S_2>0=0.}
$$

The closest random case occurred at a very small angle
(\(\alpha\approx0.289^\circ\)); its product was approximately
\(-2.33\times10^{-12}\).

### High-precision edge check

The closest deterministic and random cases were recomputed at 50-digit
precision. Both retained

$$
S_1S_2<0,
$$

so the observed negative signs are not double-precision sign flips near zero.

### Material-interchange check

For 1,000 seeded random cases, the implementation independently verified the
material-swap relations, including

$$
D(p;\alpha,m)
=
e\,D(p;\pi-\alpha,m^{\rm swap}),
$$

and

$$
S_1(\alpha,m)=-eS_2(\pi-\alpha,m^{\rm swap}),\qquad
S_2(\alpha,m)=-eS_1(\pi-\alpha,m^{\rm swap}).
$$

The selected \(\lambda\) values were invariant under the swap to numerical
precision.

### CI verification

Disposable branch: \`verification/ijf-r1-wp2-ci\`.

GitHub Actions run \`45407525585\` passed:

- the existing Python regression suite;
- the complete WP2 deterministic and random scans;
- the material-interchange assertions;
- both 50-digit edge-case assertions;
- the independent baseline WP2B checkpoints.

The verification artifact \`wp2-verification\` has SHA-256 digest

\`9361a357c40f634e2f2cec4f375c20898de6fc72c2b1fdab13aa61d01f2cb6b7\`.

## Verdict

**Verdict B: numerically exclusive on the stated domain.**

No simultaneous-admissibility case was found in the broad verified domain,
but the numerical scan is not presented as a proof over the complete
mathematical parameter space. The revised manuscript should therefore:

1. explicitly describe the one-material result as a numerical observation
   over the investigated domain;
2. report enough of that domain to make the scope clear;
3. continue to formulate admissibility independently for each candidate
   material through \(Cg_2<0\) and \(CQ_i>0\);
4. avoid wording that implies a general uniqueness theorem.

This directly answers Reviewer 1 without overclaiming.
