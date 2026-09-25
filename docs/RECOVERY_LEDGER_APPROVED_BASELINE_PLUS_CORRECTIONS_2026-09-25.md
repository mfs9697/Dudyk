# Recovery ledger: author-approved baseline plus later corrections

Date: 2026-09-25

## Purpose

This file prevents version drift while reconstructing the manuscript from the
version approved by M. V. Dudyk.

The reconstruction must NOT be performed by reverting the repository to an
older commit. The approved manuscript and the later confirmed corrections are
both authoritative, but for different purposes:

1. **Author-approved structural/textual baseline** — the PDF sent to Dudyk and
   approved by him.
2. **Post-approval scientific corrections and clarifications** — the changes
   developed and/or confirmed after that PDF was sent.

The target manuscript is therefore:

> author-approved structure and substantive discussion
> **plus**
> all later confirmed analytical/numerical corrections and clarifications.

## Immutable reference snapshots

### Repository snapshot of all post-approval work

Branch:

`archive/post-approval-corrections-and-english-2026-09-25`

Commit:

`c6df209b7a2c4fdac02caed925b54e2657ad9c33`

This snapshot contains the current Ukrainian source, all confirmed formula
corrections, AQ-AN-01 resolution, regenerated numerical results, the complete
English translation, and the final English language/style sweep.

Do not rewrite or delete this branch during reconstruction.

### Author-approved PDF

Conversation file:

`main_sent to Dudyk and approved.pdf`

SHA-256:

`b0736337f3b8526987006da1834e75040a069b48765ec86ec7fbfeec376f7cad`

PDF metadata:

- title: `Аналітична модель ініціювання відгалуження V-подібної міжфазної тріщини зсуву в її кутовій точці`;
- authors: A. O. Kaminsky, M. F. Selivanov, M. V. Dudyk, T. V. Polishchuk;
- 22 A4 pages;
- LaTeX/MiKTeX build.

This PDF is the structural/textual baseline approved by Dudyk.

## Structural content that must be restored from the approved PDF

The approved PDF contains six numbered sections:

1. Introduction
2. Problem statement
3. Determination of equilibrium process-zone parameters
4. Numerical analysis of results
5. Discussion
6. Conclusions

The current repository source collapsed this structure to five sections and
lost the separate Discussion section. Reconstruction must restore, at minimum,
the following approved material.

### Introduction roadmap

The approved Introduction ends with a paragraph beginning

`Подальший виклад організовано так.`

It explicitly describes Sections 2--6 and must be restored in an updated form
consistent with the reconstructed section numbering.

### Section 5 — Discussion

The approved PDF contains a standalone Discussion with the following
subsections:

- 5.1. Quasi-static family of states and branching initiation
- 5.2. Competing fracture mechanisms
- 5.3. Energy and deformation criteria
- 5.4. Residual corner field and local energy flux
- 5.5. Scope of applicability and prospects for generalization

Important scientific content in this section must not be lost, including:

- the one-parameter family
  `C -> d_i(C) -> {delta_i(C), W_i(C), J_i(C)}`;
- explicit comparison of corner branching and outer-tip interfacial
  propagation as competing mechanisms;
- outer-tip criterion `K_II = K_IIc` as the comparator mechanism;
- the equivalence statement for the deformation and energy criteria only
  under consistent calibration of the corresponding critical parameters;
- the residual-field energy-flux scaling
  `J_i^(el)(R) ~ (H_i^2/E_i) R^(2 lambda_i + 1)`;
- the consequence `lim_{R->0} J_i^(el)(R) = 0` when
  `-1/2 < lambda_i < 0`;
- the interpretation of why no separate finite elastic additive term is
  required in the local initiation criterion for this corner problem;
- the explicit quantitative applicability domain `d_i/l < 0.1`;
- the interpretation of values up to about `d_i/l ~ 0.18` as extrapolation
  useful for trends but outside the main quantitative range;
- the proposed generalization to developed V-shaped interfacial cracks via
  replacement of the outer-field amplitude;
- the related sharp-wedge splitting application.

### Section 6 — Conclusions

The approved PDF contains a numbered five-item Conclusions section. The
reconstructed manuscript should preserve its scientific coverage while
updating formulas/numerical consequences where required by the later
corrections.

## Post-approval scientific corrections that must be preserved

### Confirmed by M. V. Dudyk

Dudyk independently rechecked the two analytical discrepancies and confirmed
the corrections:

1. Opening formula:
   `G_i^+(-1-lambda) -> G_i^+(-1)` in the denominator associated with
   `delta_i`.

2. Work/energy coefficients:
   `32/(9 pi) -> 8/pi` in `W_i`;
   `64/(9 pi) -> 16/pi` in `J_i`.

These corrections override the corresponding formulas printed in the approved
PDF.

### Consequent normalized formulas

Preserve the corrected forms already present in the repository, including

`delta_i' = -lambda K^+(-1) /
[sqrt(pi G_i(0))(1+lambda) G_i^+(-1)] * d_i/l`

and

`J_i' = -4 lambda /
[pi(lambda+2)(G_i^+(-1))^2] * d_i/l`.

The process-zone length formula is unaffected.

### Regenerated numerical results

Preserve the recalculated Figures 2 and 3 and the associated numerical values.

Baseline transition angles:

- `alpha_1 = 12.9202 deg`;
- `alpha_2 = 107.0897 deg`.

At `alpha=45 deg`, material 1, `sigma'=-0.5`:

- `d_1/l = 0.14743436`;
- `delta_1' = 0.14578703`;
- `J_1' = 0.08362039`.

Principal negative-load material-1 angular branch:

- `max(d_1/l) = 0.17793332` at `35 deg`;
- `max(delta_1') = 0.20770529` at `32 deg`;
- `max(J_1') = 0.11391440` at `33 deg`.

Do not restore the superseded values from the approved PDF.

### AQ-AN-01 — Mellin-transform/superposition clarification

Preserve the later clarification that the Wiener--Hopf plus transform is
defined for the correction stress, not the raw total stress:

`sigma_hat_i(r) = sigma_theta(r,beta_i) - C Q_i r^lambda`.

Then

`sigma_hat_i(r) = o(r^-1)` as `r -> infinity`,

and on the active process-zone segment

`sigma_hat_i(r) = sigma_i - C Q_i r^lambda`.

The initial common Mellin strip is

`max(-1-lambda,-1-lambda_i) < Re p < 0`.

The functional equation established there is then analytically/meromorphically
continued to the Wiener--Hopf factorization contour. Do not restore the old
claim that the raw total-stress transform itself converges in a strip crossing
`Re p=0`.

### AQ-AN-02 / energy-parameter interpretation

Preserve the later clarification that

`J_i = dW_i/dd_i`

is a **zone-related energy parameter** along the adopted one-parameter
equilibrium family, not an independently established global contour integral.

Preserve both initiation criteria:

- `J_i = J_ic`;
- `delta_i = delta_ic`.

Treat `J_ic` and `delta_ic` as independently specified material
parameters. The two criteria select the same critical state only when those
critical values are calibrated consistently for the same fixed-geometry
one-parameter equilibrium family.

### Stationary-crack framing

Preserve the later cleaned interpretation of the V-shaped interfacial shear
crack as a prescribed stationary defect.

The corner-branching mechanism and outer-tip interfacial-propagation mechanism
are competing local mechanisms, not prescribed sequential stages.

While restoring the approved Discussion, avoid wording that implies a
mandatory temporal sequence of the mathematical configurations.

### Elastic-contrast symmetry

Preserve the explicit symmetry used to justify tabulating only
`E_1/E_2 < 1`:

`(E_1,nu_1) <-> (E_2,nu_2)`,
`alpha <-> pi-alpha`,
material `1 <-> 2`.

For equal Poisson ratios this includes
`E_1/E_2 <-> E_2/E_1`.

### Figure 4 and numerical packaging

Preserve the final publication asset
`figures/figure4_admissible_segments.pdf`.

Preserve the interpretation that the three singularity curves compare
mathematical configurations; they do not impose a chronological fracture
sequence.

## English work that must not be lost

The complete English translation and the publication-level language/style
sweep are preserved in the immutable archive branch above.

The English text must NOT be used as the source for reconstructing the
Ukrainian scientific structure. First reconstruct and verify the Ukrainian
master against the approved PDF plus the later corrections. Then realign the
English manuscript to that verified Ukrainian master, reusing the existing
English prose wherever it still corresponds one-to-one.

## Reconstruction rule

For every disputed passage, classify it into exactly one of these categories:

- **A — approved baseline text to restore**;
- **B — post-approval confirmed correction that overrides the PDF**;
- **C — post-approval editorial clarification that should be retained if it
  does not contradict the approved scientific logic**;
- **D — later restructuring/style change that should not be retained
  automatically**.

No content should be deleted merely because it is absent from the current
`main`, and no content should be retained merely because it is present
there.

## Next verification step

Build a section-by-section matrix:

`approved PDF <-> current main <-> reconstructed target`.

Only after that matrix is complete should the Ukrainian master files be
rewritten.
