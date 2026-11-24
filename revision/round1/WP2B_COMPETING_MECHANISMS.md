# WP2B — Quantitative competition of corner branching and branch-tip propagation

## Reviewer question

The manuscript identifies two competing local mechanisms but does not compare
their critical load levels. Provide a quantitative comparison.

## 1. Corner-branching threshold

For an admissible material \(i\),

$$
\sigma'=\frac{Cl^{\lambda_0}}{\sigma_i}.
$$

Write Eq. (8) as

$$
\frac{d_i}{l}=[A_i\sigma']^{-1/\lambda},
$$

where

$$
A_i=
\frac{
g_1q_iK^+(-1-\lambda)G_i^+(-1)
}{
(1+\lambda)K^+(-1)G_i^+(-1-\lambda)
}.
$$

On the physically admissible loading ray \(A_i\sigma'>0\).

Define

$$
B_i=
-\frac{
\lambda K^+(-1)
}{
\sqrt{\pi G_i(0)}(1+\lambda)G_i^+(-1)
},
\qquad
D_i=
-\frac{
4\lambda
}{
\pi(\lambda+2)[G_i^+(-1)]^2
}.
$$

Then

$$
\delta'_i=B_i\frac{d_i}{l},\qquad
J'_i=D_i\frac{d_i}{l}.
$$

For the normalized critical opening

$$
\Delta_i=
\frac{E_i\delta_{ic}}
{4(1-\nu_i^2)\sigma_i l},
$$

the critical normalized load magnitude is

$$
\boxed{
|\sigma'_{c,\delta}|
=
\frac{1}{|A_i|}
\left(\frac{\Delta_i}{B_i}\right)^{-\lambda}
}.
$$

For

$$
\mathcal J_i=
\frac{E_iJ_{ic}}
{4(1-\nu_i^2)\sigma_i^2l},
$$

the energy-based value is

$$
\boxed{
|\sigma'_{c,J}|
=
\frac{1}{|A_i|}
\left(\frac{\mathcal J_i}{D_i}\right)^{-\lambda}
}.
$$

When

$$
J_{ic}=\chi_i\sigma_i\delta_{ic},
$$

Eq. (11) gives
\(\mathcal J_i/D_i=\Delta_i/B_i\), so the two critical-load
expressions coincide.

The dimensional threshold is

$$
|C_{\rm corner}|
=
\sigma_i l^{-\lambda_0}|\sigma'_c|.
$$

## 2. Branch-tip propagation threshold

The Nazarenko--Kipnis solution for the same stationary V-shaped
interfacial shear crack gives

$$
\boxed{
K_{II}=g_1k\,C\,l^{\lambda_0+1/2}
}
$$

with

$$
k=
\frac{
2\sqrt{2}(1+\kappa_2e)\Gamma(\lambda_0+3/2)
}{
[1+\kappa_1+(1+\kappa_2)e]\Gamma(\lambda_0+2)
G^+(-1-\lambda_0)
}.
$$

The quantities \(e,\kappa_i,\lambda_0,g_1\), and the base factor
\(G^+(-1-\lambda_0)\) are exactly the quantities used in Appendix A of the
submitted manuscript. The source kernel is algebraically identical to the
current base kernel because

$$
\kappa_1+(1+\kappa_1\kappa_2)e+\kappa_2e^2
=
(e+\kappa_1)(1+e\kappa_2)
$$

and the denominators are likewise identical.

Hence

$$
\mathcal K_{II}=g_1k
$$

and

$$
|C_{\rm tip}|
=
\frac{K_{IIc}}
{|\mathcal K_{II}|l^{\lambda_0+1/2}}.
$$

The signs on a particular admissible loading ray are retained in the actual
\(C\) and \(K_{II}\); magnitudes are used here only to compare which threshold
is reached first.

## 3. Dimensionless mechanism selection

Define the independent normalized branch-tip resistance

$$
\mathcal R_{II}
=
\frac{K_{IIc}}{\sigma_i\sqrt l}.
$$

Combining the two critical loads gives

$$
\boxed{
\frac{|C_{\rm corner}|}{|C_{\rm tip}|}
=
\frac{
|\mathcal K_{II}|\,|\sigma'_c|
}{
\mathcal R_{II}
}
}.
$$

Thus:

- **corner branching first** if
  \[
  |\mathcal K_{II}|\,|\sigma'_c|<\mathcal R_{II};
  \]
- **interfacial branch-tip propagation first** if
  \[
  |\mathcal K_{II}|\,|\sigma'_c|>\mathcal R_{II};
  \]
- equality gives the competition boundary.

This is a quantitative comparison even when the independent critical material
parameters are left symbolic.

Substitution of the opening criterion gives the mechanism boundary

$$
\boxed{
\mathcal R_{II}^{*}(\Delta_i)
=
\frac{|\mathcal K_{II}|}{|A_i|}
B_i^{\lambda}\Delta_i^{-\lambda}
}.
$$

The energy form is

$$
\boxed{
\mathcal R_{II}^{*}(\mathcal J_i)
=
\frac{|\mathcal K_{II}|}{|A_i|}
D_i^{\lambda}\mathcal J_i^{-\lambda}
}.
$$

## 4. Baseline verification

For

$$
E_1/E_2=0.5,\qquad
\nu_1=\nu_2=0.3,\qquad
\alpha=45^\circ,
$$

with material 1 active, the independent calculation gives

| Quantity | Value |
|---|---:|
| \(\lambda_0\) | \(-0.08908980745\) |
| \(\lambda\) | \(-0.61319722657\) |
| \(g_1\) | \(-0.58386949748\) |
| \(k\) | \(1.16364321914\) |
| \(\mathcal K_{II}=g_1k\) | \(-0.67941578160\) |
| \(A_1\) | \(-0.6183253228\) |
| \(B_1\) | \(0.9888266934\) |
| \(D_1\) | \(0.5671702733\) |

The signs are consistent with the admissible \(45^\circ\) branch:
\(C<0\) and \(g_1<0\), giving positive Mode-II intensity in the source
convention.

The opening-based competition boundary is

$$
\boxed{
\mathcal R_{II}^{*}
=
1.1063967431\,\Delta_1^{0.6131972266}
}
$$

and the energy-based boundary is

$$
\boxed{
\mathcal R_{II}^{*}
=
1.5557536217\,\mathcal J_1^{0.6131972266}
}.
$$

Their equivalence follows from
\(\mathcal J_1=(D_1/B_1)\Delta_1\), with

$$
\frac{D_1}{B_1}=0.5735790479,
$$

consistent with Eq. (11).

## 5. Verification

The implementation is in
\`revision/round1/verify_wp2.py\`.

GitHub Actions run \`45407525585\` passed the existing Python tests and the
complete WP2 verification. The baseline calculation independently reproduces
the previously verified \(q_1\), \(G_1(0)\), \(G_1^+(-1)\), \(A_1\), and
\(B_1\) checkpoints before evaluating the new branch-tip coefficient and
competition boundary.

No material toughness/opening values were invented.

## Verdict

Reviewer 1's requested quantitative comparison is feasible and is now
derived. The revised manuscript should add the dimensionless critical-load
ratio and explain that a numerical ordering of the mechanisms requires the
independent material properties \(K_{IIc}\) and either
\(\delta_{ic}\) or \(J_{ic}\). The comparison itself is complete without
assigning arbitrary values to those properties.
