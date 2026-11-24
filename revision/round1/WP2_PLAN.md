# WP2 — Reviewer 1 comment 6: physical selection mechanisms

Branch: \`verification/ijf-r1-wp2-mechanisms\`

Base: \`revision/ijf-round1\` after merge of WP1 (PR #17).

## Status

**WP2A and WP2B are closed scientifically.** No manuscript files were edited
in WP2.

Verification was run independently on the disposable branch
\`verification/ijf-r1-wp2-ci\`. GitHub Actions run
\`45407525585\` passed the existing Python regression suite and the complete
WP2 verification, including the broad admissibility sweep, material-swap
checks, 50-digit edge-case checks, and the baseline competing-mechanism
calculation.

The generated verification artifact is named \`wp2-verification\` and has
SHA-256 digest

\`9361a357c40f634e2f2cec4f375c20898de6fc72c2b1fdab13aa61d01f2cb6b7\`.

## WP2A — single-zone admissibility

The model requires

$$
Cg_2<0,\qquad CQ_i>0.
$$

Because

$$
q_i=
\frac{
2S_i(-1-\lambda)K^+(-1-\lambda)G^+(-1-\lambda)
}{
(\lambda-\lambda_0)D'(-1-\lambda)
K^+(-1-\lambda_0)G^+(-1-\lambda_0)
},
$$

the factor multiplying \(S_i\) is common to both materials. Hence

$$
\operatorname{sgn}(Q_1Q_2)=\operatorname{sgn}(S_1S_2).
$$

A broad deterministic scan of 92,800 nondegenerate cases found no point with
\(S_1S_2>0\), and therefore no candidate for simultaneous admissibility of
both materials. The scan covered

- \(E_1/E_2=10^{-3}\ldots10^3\) on 25 logarithmic samples;
- \(\nu_1,\nu_2\in\{-0.95,-0.75,-0.50,-0.25,0,0.25,0.45,0.49\}\);
- \(\alpha=3^\circ,6^\circ,\ldots,177^\circ\), excluding \(90^\circ\).

A second seeded continuous random scan of 20,000 points over
\(10^{-3}\le E_1/E_2\le10^3\),
\(-0.99<\nu_i<0.499\), and
\(0.2^\circ<\alpha<179.8^\circ\) also found no same-sign pair.

The two sampled points closest to \(S_1S_2=0\), both near limiting
geometries/material parameters, were recomputed at 50-digit precision and
retained \(S_1S_2<0\).

A 1,000-case material-interchange check confirmed the expected determinant,
root, and \(S_i\) mappings to numerical precision.

### WP2A verdict

This is **not** promoted to a global analytical theorem. The revision should
state that the one-material-at-a-time result is a numerical observation
supported over the explicitly reported broad parameter domain. The
branching-direction procedure should continue to evaluate both candidate
materials through the two admissibility inequalities rather than assume
exclusivity a priori.

This directly satisfies the reviewer's alternative of clearly downgrading and
scoping the claim.

## WP2B — competing critical loads

Nazarenko and Kipnis give the branch-tip Mode-II stress-intensity factor in
the same notation as the present outer field:

$$
K_{II}=g_1 k\,C\,l^{\lambda_0+1/2},
$$

where

$$
k=
\frac{
2\sqrt{2}(1+\kappa_2e)\Gamma(\lambda_0+3/2)
}{
[1+\kappa_1+(1+\kappa_2)e]\Gamma(\lambda_0+2)
G^+(-1-\lambda_0)
}.
$$

Their base kernel \(G\) is algebraically identical to the base kernel in
Appendix A of the submitted manuscript. Thus

$$
\mathcal K_{II}=g_1k.
$$

The branch-tip threshold is

$$
|C_{\rm tip}|=
\frac{K_{IIc}}
{|\mathcal K_{II}|\,l^{\lambda_0+1/2}}.
$$

For corner branching, write Eq. (8) as

$$
\frac{d_i}{l}=[A_i\sigma']^{-1/\lambda},
\qquad
\sigma'=\frac{Cl^{\lambda_0}}{\sigma_i},
$$

and define the positive coefficients \(B_i,D_i\) by

$$
\delta_i'=B_i\frac{d_i}{l},\qquad
J_i'=D_i\frac{d_i}{l}.
$$

Then

$$
|\sigma'_{c,\delta}|=
\frac{1}{|A_i|}
\left(\frac{\Delta_i}{B_i}\right)^{-\lambda},
\qquad
\Delta_i=
\frac{E_i\delta_{ic}}
{4(1-\nu_i^2)\sigma_i l},
$$

and

$$
|\sigma'_{c,J}|=
\frac{1}{|A_i|}
\left(\frac{\mathcal J_i}{D_i}\right)^{-\lambda},
\qquad
\mathcal J_i=
\frac{E_iJ_{ic}}
{4(1-\nu_i^2)\sigma_i^2l}.
$$

These thresholds coincide when
\(J_{ic}=\chi_i\sigma_i\delta_{ic}\).

Define

$$
\mathcal R_{II}=
\frac{K_{IIc}}{\sigma_i\sqrt l}.
$$

The two mechanisms are then compared by

$$
\frac{|C_{\rm corner}|}{|C_{\rm tip}|}
=
\frac{|\mathcal K_{II}|\,|\sigma'_c|}
{\mathcal R_{II}}.
$$

Therefore:

- corner branching first if
  \[
  |\mathcal K_{II}|\,|\sigma'_c|<\mathcal R_{II};
  \]
- branch-tip interfacial propagation first if the inequality is reversed;
- equality is the mechanism boundary.

No arbitrary fracture constants are needed to state this quantitative
comparison.

### Baseline numerical checkpoint

For \(E_1/E_2=0.5\), \(\nu_1=\nu_2=0.3\),
\(\alpha=45^\circ\), material 1:

- \(\lambda_0=-0.08908980745\);
- \(\lambda=-0.61319722657\);
- \(g_1=-0.58386949748\);
- \(k=1.16364321914\);
- \(\mathcal K_{II}=g_1k=-0.67941578160\);
- \(A_1=-0.6183253228\);
- \(B_1=0.9888266934\);
- \(D_1=0.5671702733\).

The opening-based mechanism boundary becomes

$$
\mathcal R_{II}^{*}
=
1.1063967431\,\Delta_1^{\,0.6131972266},
$$

and the equivalent energy-based form is

$$
\mathcal R_{II}^{*}
=
1.5557536217\,\mathcal J_1^{\,0.6131972266}.
$$

The two are identical when the critical opening and energy characteristics are
calibrated consistently.

## Stop condition

Satisfied. WP2 can now be merged into \`revision/ijf-round1\`. The verified
findings may then be carried into WP3 for the R1.6 manuscript revision and
response.
