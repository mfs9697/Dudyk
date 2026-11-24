# WP2 — Reviewer 1 comment 6: physical selection mechanisms

Branch: \`verification/ijf-r1-wp2-mechanisms\`

Base: \`revision/ijf-round1\` after merge of WP1 (PR #17).

## Purpose

Address Reviewer 1 comment R1.6 without editing the manuscript until the new
physics has been independently checked.

WP2 is split into two independent scientific questions.

### WP2A — Is single-zone admissibility genuinely exclusive?

Determine whether the two physical conditions

$$
Cg_2<0,\qquad CQ_i>0
$$

can make process zones in both materials simultaneously admissible for any
elastic contrast, Poisson-ratio pair, interface angle, and loading sign.

The submitted manuscript only reports exclusivity for the parameter sets
examined. The existing MATLAB helper
\`calculate_figure4_admissibility.m\` explicitly refuses non-baseline
materials, so the broader statement has not yet been tested.

WP2A must distinguish among:

1. an analytical exclusivity theorem;
2. a numerically supported observation over a clearly stated domain;
3. a counterexample with simultaneous admissibility.

No global theorem may be claimed from a numerical sweep alone.

### WP2B — Which mechanism reaches its critical load first?

Quantitatively compare:

1. corner branching governed by
   \(\delta_i=\delta_{ic}\) or \(J_i=J_{ic}\);
2. interfacial propagation from the existing V-crack branch tips governed by
   \(K_{II}=K_{IIc}\).

The comparison must use the same outer loading amplitude \(C\) and the same
stationary crack geometry.

Nazarenko--Kipnis give the branch-tip scaling

$$
K_{II}=\mathcal K_{II}(\alpha,E_1/E_2,\nu_1,\nu_2)
\,C\,l^{\lambda_0+1/2},
$$

so that

$$
C_{\rm tip}
=
\frac{K_{IIc}}
{\mathcal K_{II}l^{\lambda_0+1/2}}.
$$

The corner model uses

$$
\sigma'=\frac{Cl^{\lambda_0}}{\sigma_i},
\qquad
C_{\rm corner}=\sigma'_c\sigma_i l^{-\lambda_0}.
$$

Therefore, on a common loading ray,

$$
\frac{|C_{\rm corner}|}{|C_{\rm tip}|}
=
|\mathcal K_{II}|\,|\sigma'_c|\,
\frac{\sigma_i\sqrt l}{K_{IIc}}.
$$

This is only the starting form. WP2B must verify the exact coefficient and
sign convention in the source paper, derive \(\sigma'_c\) explicitly from
the opening and energy criteria, and formulate a reviewer-ready mechanism
selection inequality.

## Guardrails

- Do not edit \`submission/ijf/IJF_manuscript.tex\` during WP2.
- Do not modify the frozen submitted branch.
- Do not invent \(\delta_{ic}\), \(J_{ic}\), \(K_{IIc}\), or other material
  fracture properties.
- Any illustrative mechanism map must be parameterized by dimensionless
  resistance groups unless independently sourced material data are added and
  documented.
- Preserve the distinction between analytical proof and numerical evidence.
- Re-run existing regression tests after adding verification code.

## Stop condition

WP2 stops when both WP2A and WP2B have evidence-backed verdicts, reproducible
scripts/results, and a concise reviewer-facing conclusion. Manuscript editing
belongs to WP3.
