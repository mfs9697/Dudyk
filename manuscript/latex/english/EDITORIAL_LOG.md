# Translation and editorial log

## Batch 1 — September 22, 2026

Scope: Section 2 (problem formulation), all three subsections, and the
Figure 1 caption. US spelling. No new literature or numerical results.

### Scientific scope preserved across the September revision

The latest Introduction and abstract describe a prescribed stationary
V-shaped crack and competing corner/outer-tip mechanisms. The older
post-instability interpretation must not be restored. Section 2 still
used sequential-fracture wording. The English version harmonizes its
heading, crack description, and caption with the approved Introduction:
each branch has length l, total length is 2l, the crack is stationary,
and the two candidate process zones are considered separately.
This is an explicit consistency edit, not a new stability calculation.

### Definitions at first use

| Symbols | Editorial treatment |
| --- | --- |
| E_i, nu_i, i | Young's modulus, Poisson's ratio, and material index identified immediately. |
| alpha | Explicitly identified as the half-angle measured through material 2. |
| r, theta, O | Distance, angular reference, and origin defined in the introducing sentence. |
| u_r, u_theta | Radial and circumferential displacement components distinguished. |
| sigma_theta, tau_rtheta | Normal and shear stress components identified, with their traction meaning on a radial line. |
| C, g_1, g_2, lambda_0 | Defined directly after the first displayed field; C remains a generalized stress intensity factor. |
| D_0 | Identified as the intact-corner characteristic determinant immediately after its first use; formula remains in Appendix A. |
| l | Explicit branch length; total length 2l stated. |
| beta_i | Bisector direction defined before its displayed values. |
| d_i, sigma_i | Zone length and constant normal cohesive traction defined immediately. |
| L | Characteristic outer dimension defined before the scale assumption. |
| f and jump notation | Generic field quantity and the order of one-sided limits stated explicitly. |
| j | Other material index identified immediately after the boundary conditions. |
| Q_i, lambda, D | Defined after the matching relation; Q_i includes its dependence on l. |
| k_i | Local Mode I stress intensity factor defined immediately after the tip asymptotics. |

The former early list beta_i, d_i, sigma_i, Q_i was removed to avoid
introducing undefined symbols in a bookkeeping sentence. Definitions now
follow the actual mathematical development. Little-o notation and the
one-sided tip limits are explained.

### Terminology and abbreviations

- Use "V-shaped interfacial shear crack," "crack faces," "process zone,"
  "normal cohesive traction," "physical admissibility," and "asymptotic matching."
- Define Mode I as opening mode and Mode II as in-plane shear mode.
- Do not introduce SIF, PZ, or other abbreviations in this short section;
  spelling the terms out is clearer and avoids unnecessary shorthand.
- Preserve the distinction between generalized C and local k_i, and
  between intact-corner lambda_0 and cracked-corner lambda.
- Retain the bisector as a symmetry-based modeling assumption, without
  claiming it was obtained through directional optimization.

### Other editorial clarifications

1. Q_i depends on crack length as well as angle and elastic properties:
   Appendix A gives Q_i = g_1 q_i l^(lambda_0-lambda). The previous sentence
   omitted l. The equation itself was not changed.
2. The infinite-radius matching limit belongs to the local inner problem;
   the physical overlap remains d_i << r << l.
3. k_i = 0 removes the inverse-square-root singular term; it does not mean
   that the bounded tip stress vanishes. No new regularity condition is added.
4. Figure 1's geometry and labels are unchanged. The caption explicitly
   states branch length and alternative zones.
5. AQ-PS-01 and AQ-PS-02 are retained in the Ukrainian baseline and are
   omitted from the clean English text following the reported approval.
   Their substance is preserved in the careful symmetry and regularity
   wording; no separate author answers or new citations are invented.

### Verification and follow-up

- All 12 display equations match the source after whitespace and terminal
  punctuation normalization. All section/equation/figure labels and all
  citation keys are preserved.
- Build and visual inspection apply to the batch extract, not to a completed
  English manuscript or a fresh validation of the analytical model.
- Final XeLaTeX/BibTeX build: four pages, no unresolved references or
  citations, no font warnings, and no overfull or underfull boxes. All four
  rendered pages were visually inspected; Figure 1 remains vector artwork.
- Retain the source's o(r^-1) matching remainder. During the derivation
  batch, check its connection to the transform regularization and Appendix A;
  do not silently weaken or strengthen an asymptotic claim in translation.
- The revised Introduction calls W_i work of separation resistance and J_i
  a zone-related energy parameter; Section 3 still uses older potential-energy
  and energy-release-rate wording. Harmonize these in the next batch using
  the approved scope and equations, without assuming a global crack energy
  release rate.
- Recheck definitions in final manuscript order after the Introduction and
  abstract are translated; define abbreviations independently in the abstract
  only if they are actually needed.
