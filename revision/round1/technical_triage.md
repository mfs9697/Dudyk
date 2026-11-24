# Reviewer 1 technical triage — Round 1

## Overall assessment

Reviewer 1 explicitly states that the derivations are rigorous/coherent and that
the paper merits publication. The requested revision is mainly about making
implicit connecting steps explicit. Reviewer 2 recommends publication without
specific requested changes.

## R1.1 — Eq. (1): clarification only

- `theta=0,pi`: symmetry boundaries; `tau_rtheta=0` follows from symmetry.
- `theta=alpha`: material interface / contacting crack faces.
- `[[tau_rtheta]]=0`: traction continuity; it says the two limiting shear
  tractions are equal, not that their common value is zero.
- `tau_rtheta=0`: frictionless contact; this separately sets that common
  tangential traction to zero.
- Proposed revision: split Eq. (1) and the explanatory paragraph explicitly
  by physical origin.

## R1.2 — Eq. (2): clarification only

Rewrite as a piecewise boundary condition on the active bisector and state
separately that the inactive material bisector remains a symmetry line.

## R1.3 — Eqs. (3)–(4): clarification plus assumption labeling

- State explicitly that `o(r^-1)` is the decay imposed on the correction
  field in the retained leading-order inner model so that `Phi_i^+` is
  analytic for `Re p<0`; it is not an intrinsic statement about the full
  outer expansion.
- State that Eq. (4) is the standard homogeneous-medium Mode-I tip asymptotic
  because the process-zone tip lies locally inside one homogeneous material.
- Explain the free-boundary counting: `d_i` is unknown; regularity `k_i=0`
  supplies the additional scalar solvability condition that determines it.

## R1.4 — Wiener–Hopf construction: mathematical exposition required

Add:
1. a compact transformed-elasticity step leading to Eq. (5), or an appendix;
2. the gamma identity
   `K^+(p)K^-(p)=p*cot(pi p)`;
3. the boundary factorization convention for the positive even kernel,
   `G_i = G_i^+/G_i^-` on the contour;
4. an explicit statement that the elementary meromorphic factors associated
   with the known poles/zeros are carried by the rational and gamma factors,
   while the zero-index regular part on the factorization contour is treated
   by the Cauchy factor;
5. a short Liouville argument yielding Eq. (6).

This point must be verified carefully against the exact meromorphic
continuation before manuscript editing.

## R1.5 — Eq. (9): submitted placement of G_i(0) appears correct

Using the regularity relation from `k_i=0`, define

`A_i = sigma_i K^+(-1)/G_i^+(-1)`.

Then Eq. (6) reduces to

`Phi_i^-(p) = A_i K^-(p)G_i^-(p) lambda/[(p+1)(p+1+lambda)]`.

At `p=0`:
- `K^-(0)=1/sqrt(pi)`;
- for the manuscript's ratio factorization convention and positive even
  kernel, `G_i^-(0)=1/G_i^+(0)=1/sqrt(G_i(0))`.

Hence `Phi_i^-(0)`, and therefore `delta_i`, contains
`1/sqrt(G_i(0))`, agreeing with submitted Eq. (9). The reviewer's
alternative follows from a different product-factorization convention.
The revision should display these intermediate identities explicitly.

At `p=1`, use
`K^-(1)=K^+(-1)=2/sqrt(pi)` and
`G_i^-(1)=1/G_i^+(-1)` to make Eqs. (10)–(11) directly checkable.

## R1.6a — single-zone admissibility: downgrade scope, then test more broadly

The manuscript already limits the statement to examined parameter sets, but
the wording should be strengthened so that no global uniqueness theorem is
implied. Define admissibility independently for each material by `CQ_i>0`.
For the reported baseline sweeps only one material is admissible at a time.
Outside the tested space, the model should evaluate both candidate directions
rather than assume exclusivity.

Before finalizing the response, perform a broader numerical parameter sweep to
see whether counterexamples occur.

## R1.6b — competing critical loads: new scientific addition

The revision should quantitatively compare:
- corner branching threshold `C_corner`, obtained from
  `delta_i(C)=delta_ic` or `J_i(C)=J_ic`;
- interfacial branch-tip threshold `C_tip`, obtained from
  `K_II(C)=K_IIc` for the stationary V-shaped crack.

Because both thresholds depend on independent material fracture-resistance
parameters, a unique numerical ordering cannot be asserted without specifying
those parameters. The strongest response is therefore to derive a dimensionless
critical-load ratio / mechanism-selection inequality and, if useful, plot a
mechanism map versus an appropriate normalized resistance ratio. Do not invent
material critical values.

## Planned order

1. independently verify R1.4 factorization/regularization;
2. independently rederive R1.5 (already strongly supported by the stored
   September formula audit);
3. broaden admissibility scan for R1.6a;
4. recover the published `K_II(C)` relation and derive the critical-load
   competition formula for R1.6b;
5. only then edit the manuscript and draft the response letter.
