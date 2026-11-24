# WP2B — Quantitative competition of corner branching and branch-tip propagation

## Reviewer question

The manuscript identifies two competing local mechanisms but does not compare
their critical load levels. Provide a quantitative comparison.

## Mechanism 1 — corner branching

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

For the physically admissible loading ray, \(A_i\sigma'>0\).

Define the positive geometry coefficients

$$
B_i=
-\frac{
\lambda K^+(-1)
}{
\sqrt{\pi G_i(0)}(1+\lambda)G_i^+(-1)
},
$$

and

$$
D_i=
-\frac{
4\lambda
}{
\pi(\lambda+2)[G_i^+(-1)]^2
}.
$$

Then the submitted normalized relations are

$$
\delta'_i=B_i\frac{d_i}{l},
\qquad
J'_i=D_i\frac{d_i}{l}.
$$

### Explicit opening-based threshold

Let

$$
\Delta_i\equiv\delta'_{ic}
=
\frac{E_i\delta_{ic}}
{4(1-\nu_i^2)\sigma_i l}.
$$

At initiation,

$$
\Delta_i
=
B_i[A_i\sigma'_c]^{-1/\lambda},
$$

so

$$
\boxed{
\sigma'_{c,\delta}
=
\frac{1}{A_i}
\left(\frac{\Delta_i}{B_i}\right)^{-\lambda}
}.
$$

### Explicit energy-based threshold

Let

$$
\mathcal J_i\equiv J'_{ic}
=
\frac{E_iJ_{ic}}
{4(1-\nu_i^2)\sigma_i^2 l}.
$$

Then

$$
\boxed{
\sigma'_{c,J}
=
\frac{1}{A_i}
\left(\frac{\mathcal J_i}{D_i}\right)^{-\lambda}
}.
$$

When

$$
J_{ic}=\chi_i\sigma_i\delta_{ic},
$$

Eq. (11) implies \(\mathcal J_i/D_i=\Delta_i/B_i\), and therefore

$$
\sigma'_{c,J}=\sigma'_{c,\delta}.
$$

The dimensional corner threshold is

$$
C_{\rm corner}
=
\sigma_i l^{-\lambda_0}\sigma'_c.
$$

## Mechanism 2 — interfacial propagation from the V-crack tips

Nazarenko--Kipnis derive the Mode-II stress-intensity factor in the form

$$
K_{II}
=
\mathcal K_{II}(\alpha,E_1/E_2,\nu_1,\nu_2)
\,C\,l^{\lambda_0+1/2}.
$$

The exact coefficient must be mapped into the current notation and current
base-kernel normalization before implementation.

The branch-tip threshold is

$$
C_{\rm tip}
=
\frac{K_{IIc}}
{\mathcal K_{II}l^{\lambda_0+1/2}},
$$

with the sign handled on the physically relevant loading ray.

## Dimensionless mechanism-selection inequality

Define

$$
\mathcal R_{II}
=
\frac{K_{IIc}}{\sigma_i\sqrt l}.
$$

Combining the two thresholds gives

$$
\frac{|C_{\rm corner}|}{|C_{\rm tip}|}
=
\frac{
|\mathcal K_{II}|\,|\sigma'_c|
}{
\mathcal R_{II}
}.
$$

Therefore

$$
\boxed{
|\mathcal K_{II}|\,|\sigma'_c|<\mathcal R_{II}
}
$$

means corner branching reaches its threshold first, while the opposite
inequality means branch-tip interfacial propagation reaches its threshold
first. Equality gives the competition boundary.

Substituting either explicit expression for \(\sigma'_c\) above produces a
mechanism map in the two independent normalized fracture-resistance
parameters \(\Delta_i\) (or \(\mathcal J_i\)) and \(\mathcal R_{II}\).

No numerical ordering can be claimed until the independent material
quantities \(\delta_{ic}\) or \(J_{ic}\), and \(K_{IIc}\), are specified.

## Required outputs

1. exact notation mapping to the current manuscript;
2. verified formula for \(\mathcal K_{II}\);
3. verification of the two explicit corner critical-load formulas above;
4. sign-consistent dimensionless mechanism-selection inequality;
5. reproducible numerical implementation for the baseline material pair;
6. optional parameterized mechanism map, with no invented fracture data;
7. concise reviewer-facing conclusion.

## Initial status

Started. The corner side of the comparison is now explicit. The remaining
scientific work is the exact Nazarenko--Kipnis coefficient/kernel mapping,
sign handling, and reproducible numerical evaluation.
