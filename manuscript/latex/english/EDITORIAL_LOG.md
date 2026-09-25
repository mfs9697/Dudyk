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


## Batch 2 - September 22, 2026

Scope: Section 3, all four subsections, and Appendix A, all three
subsections. Based on main after the merge of PR #2 (edc53c0fe262).
US spelling; no new literature, numerical results, or equation corrections.

### Definitions and terminology

- Introduced the complex Mellin variable p, real-part notation, strip
  constants, kernel, factors, contour variable z, imaginary unit, real
  integration variable t, and Euler gamma function at first use.
- Identified e as a dimensionless elastic ratio and kappa_i as material
  parameters (they are not both mismatch measures).
- Distinguished the base kernel G and its factor from the zone kernels G_i.
- Identified the auxiliary determinant coefficients, S_i and s_mn functions,
  q_i, derivative D', and generic exponent lambda_* in Appendix A.
- Defined the asterisk in the opening relation as the dimensional transform
  moment consistent with the printed equality and the rho = r/d_i scaling.
  This explicit convention replaces otherwise undefined notation; it is
  not a separate new physical assumption.
- Distinguished normalization primes from differentiation and introduced
  J_ic as an independently specified material threshold.
- Used process zone, normal cohesive traction, and Mode I consistently;
  no unnecessary abbreviations were introduced.

### Scope and energy interpretation

- Harmonized W_i and J_i with the approved September Introduction:
  work against separation resistance per unit out-of-plane thickness,
  and a zone-related energy parameter. The printed W_i and J_i equations
  and the legacy equation label are unchanged.
- Specified differentiation along the equilibrium family with geometry and
  material properties fixed. Did not identify J_i with a global energy
  release rate or a separately established contour integral.
- Retained the independent critical material property and the local scope
  of the branching-initiation criterion.
- Replaced sequential-crack-formation wording in Appendix A with the
  prescribed stationary configuration, and clarified that l is branch length.
- The author-confirmed signs in D_1 are preserved. The Ukrainian hidden
  worknote says the earlier printed second product had minus then plus
  signs, whereas the original programs and corrected expression use plus
  then minus. This provenance remains here, outside the clean manuscript.

### Analytical issues found

See AUTHOR_QUERIES_BATCH02.md for derivations and requested decisions.
AQ-AN-01 concerns convergence/regularization of the raw stress transform
and the claimed strip across the imaginary axis. The earlier o(r^-1)
matching remainder was checked and left unchanged.
AQ-AN-02 concerns G_i^+(-1-lambda) versus G_i^+(-1) in the opening
coefficient. Both source opening formulas remain unchanged pending review
against the analytical conventions and numerical implementation.
The derivative of the printed W_i gives the printed J_i correctly.

### Verification

The combined wrapper includes Batch 1 for definitions and live appendix
references. Figure 2 remains outside this extract and is explicitly cited
as a figure in the source manuscript; no artificial label is supplied.
Source-equation, label, and citation comparisons and the final build are
recorded below after verification.

- Verified exact preservation of 26 Section 3 and 22 Appendix A display
  environments against the remote source, plus all labels and citation keys.
- Final XeLaTeX/BibTeX build: 11 pages; no warnings, missing glyphs,
  unresolved references/citations, or overfull/underfull boxes.
- All 11 pages visually inspected; the appendix heading was shortened
  to avoid an awkward word break and the revised page was rechecked.
- This is translation and internal consistency checking, not a fresh
  validation of the numerical method or resolution of the two queries.


## Batch 3 — September 22, 2026

Scope: Section 4, all three subsections, Table 1, and the captions of
Figures 2--4. Based on the approved Ukrainian source at commit
\`0522cdae9e86\`. US spelling; no new numerical model or literature was
introduced.

### Numerical and editorial checks

- Preserved the simultaneous physical-admissibility conditions
  \(Cg_2<0\) and \(CQ_i>0\), the four Figure-2 reference configurations,
  all normalized quantities, and the three-stage exponent comparison.
- Retained the current verified baseline transitions
  \(\alpha_1=12.9202^\circ\) and \(\alpha_2=107.0897^\circ\).
  These match the current \`results/table1_transition_angles.csv\`
  values 12.920209601243 and 107.089673026137 degrees. An older planning
  note contains earlier values 12.9141 and 107.0842; it is stale and was
  not used for the translation.
- Rechecked the quoted Figure-2 endpoint for
  \(\alpha=45^\circ\), \(i=1\), \(\sigma'=-0.5\):
  \(d_1/l=0.147434361702781\),
  \(\delta_1'=0.145442265256109\), and
  \(J_1'=0.0371646165395893\), which round to the manuscript values.
- Rechecked the small-scale warning against the full Figure-3 CSV. The
  largest sampled \(d_i/l\) is 0.17793332415152 at
  \(\alpha=35^\circ\), so the manuscript statement "of order 0.18" is
  accurate.
- The source section contains six displayed equation environments and four
  structural labels; the English section preserves all six displays and
  all four labels. The four old numerical Author Query boxes are omitted
  from the clean translation because their scientific substance is already
  reflected in the approved wording.

### Harmonization with the approved September manuscript

- Replaced a temporal "crack appears, then zone appears" narrative in the
  singularity discussion by comparison of three local configurations:
  intact corner, prescribed stationary V-shaped interfacial shear crack,
  and crack-plus-zone. This is consistent with the approved Introduction.
- Kept \(J_i\) as the zone-related energy parameter rather than calling it
  a globally established energy-release rate.
- Expressed the angular maxima as larger branching-driving measures and,
  for fixed \(J_{i\mathrm c}\), lower critical applied loading, not as a
  change in material fracture resistance.
- Made the deformation/energy criterion statement consistent with the
  approved abstract: for fixed geometry both characteristics are uniquely
  linked to \(d_i\), so the criteria are equivalent only when their
  independently specified critical material parameters are chosen
  consistently.
- Retained the explicit limitation of the shielding inequality
  \(|\lambda_0|<|\lambda_i|<|\lambda|\) to the investigated baseline
  material pair and physically admissible branches.

### Relation to AQ-AN-02

The MATLAB implementation in
\`calculate_process_zone_parameters.m\` evaluates the opening multiplier
with \(G_i^+(-1-\lambda)\), matching the printed opening formula and the
approved Figures 2--3. The corrected author Mathcad comparison documented
in \`docs/AUTHOR_VALIDATION_2026-08-18.md\` uses the same factor convention.
Accordingly, the numerical agreement verifies reproduction of the approved
implementation but is not an independent algebraic resolution of AQ-AN-02.
The analytical query remains open.

### Figure packaging

Figures 2 and 3 are committed and available to the English wrapper.
The intended Figure-4 asset,
\`figures/figure4_admissible_segments.pdf\`, is referenced by the source,
described in \`figures/README.md\`, and generated by
\`matlab/generate_figure4.m\`, but is currently absent from the repository.
The English preamble now provides the same safe figure-file fallback
behavior, in English, so compilation can proceed while making the missing
asset visible rather than silently substituting \`figure4_recalculated.pdf\`.


## Formula correction and numerical regeneration — September 25, 2026

M. V. Dudyk independently rechecked the analytical discrepancies found
during translation and confirmed both corrections:

- the opening formula must use (G_i^+(-1)), not
  (G_i^+(-1-lambda));
- the coefficients in (W_i) and (J_i) must be (8/pi) and
  (16/pi), replacing (32/(9pi)) and (64/(9pi)).

The English Section 3 formulas and the MATLAB implementation were updated,
and Figures 2 and 3 were regenerated from the corrected code. The process-zone
length is unchanged. At the 45-degree reference point the corrected values are

[
d_1/l=0.1474343617,qquad
delta_1'=0.1457870324,qquad
J_1'=0.0836203872.
]

The regenerated Figure-3 sweep also resolves an earlier overstatement:
the angular maxima are close but not coincident. On the principal
negative-load material-1 branch they occur at 35 degrees for (d_1/l),
32 degrees for (delta_1'), and 33 degrees for (J_1'). The English
discussion now states this explicitly and does not infer a universal
critical-load ranking from a single prescribed-load sweep.

AQ-AN-02 is closed. The August Mathcad opening and energy values are retained
only as historical regression data for the superseded formulas; the
zone-length values remain valid.
