# WP2B — Quantitative competition of corner branching and branch-tip propagation

## Reviewer question

The manuscript identifies two competing local mechanisms but does not compare
their critical load levels. Provide a quantitative comparison.

## Mechanism 1 — corner branching

For an admissible material (i),

[
sigma'=rac{Cl^{lambda_0}}{sigma_i}.
]

The submitted solution gives

[
rac{d_i}{l}=[A_isigma']^{-1/lambda},
]

where

[
A_i=
rac{g_1q_iK^+(-1-lambda)G_i^+(-1)}
{(1+lambda)K^+(-1)G_i^+(-1-lambda)}.
]

At fixed geometry,

[
delta'_i=B_irac{d_i}{l},qquad
J'_i=D_irac{d_i}{l},
]

with the coefficients (B_i,D_i) already defined by Eqs. (9)--(10).

Thus a specified critical opening or energy parameter determines a
dimensionless corner threshold (sigma'_{c}), and

[
C_{m corner}=sigma_i l^{-lambda_0}sigma'_c.
]

WP2B must write the explicit inverse formulas for (sigma'_c) under both
criteria and verify their equivalence when
(J_{ic}=chi_isigma_idelta_{ic}).

## Mechanism 2 — interfacial propagation from the V-crack tips

Nazarenko--Kipnis derive the Mode-II stress-intensity factor in the form

[
K_{II}
=
mathcal K_{II}(alpha,E_1/E_2,
u_1,
u_2)
,C,l^{lambda_0+1/2}.
]

The exact coefficient must be transcribed and mapped into the current
notation from the original source before implementation.

The branch-tip threshold is then

[
C_{m tip}
=
rac{K_{IIc}}
{mathcal K_{II}l^{lambda_0+1/2}},
]

with the appropriate sign handled on the physically relevant loading ray.

## Mechanism-selection inequality

After verifying both thresholds, define dimensionless material groups such as

[
Delta_i=
rac{E_idelta_{ic}}
{4(1-
u_i^2)sigma_i l},
qquad
mathcal R_{II}=
rac{K_{IIc}}{sigma_isqrt l},
]

or the corresponding energy-based group.

Then express

[
|C_{m corner}|<|C_{m tip}|
]

as a dimensionless inequality / mechanism map.

Interpretation:

- corner branching first;
- branch-tip interfacial propagation first;
- equality = competing threshold.

## Source evidence already identified

The Nazarenko--Kipnis line of work explicitly gives
(K_{II}propto C l^{lambda_0+1/2}) and obtains the breaking load by setting
(K_{II}=K_{IIc}). The coefficient and notation mapping still require a
source-level verification before code is written.

## Required outputs

1. exact notation mapping to the current manuscript;
2. verified formula for (mathcal K_{II});
3. explicit corner critical-load formulas from both criteria;
4. dimensionless mechanism-selection inequality;
5. reproducible numerical implementation for the baseline material pair;
6. optional parameterized mechanism map, with no invented fracture data;
7. concise reviewer-facing conclusion.

## Initial status

Started. The source formula and the repository's corner-threshold relations
make a parameterized quantitative comparison feasible.
