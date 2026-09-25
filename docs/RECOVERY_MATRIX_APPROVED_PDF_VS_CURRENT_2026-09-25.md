# Recovery matrix: approved PDF ↔ current master ↔ reconstructed target

Date: 2026-09-25

This matrix implements the reconstruction rule in
`RECOVERY_LEDGER_APPROVED_BASELINE_PLUS_CORRECTIONS_2026-09-25.md`.

## Authority hierarchy

1. **A — author-approved baseline:** the 22-page PDF
   `main_sent to Dudyk and approved.pdf`.
2. **B — post-approval confirmed correction:** Dudyk-confirmed formula
   corrections, recalculated numerical results, and the resolved analytical
   queries.
3. **C — post-approval editorial clarification:** retain only when it does not
   change the approved scientific logic.
4. **D — later restructuring/style drift:** do not retain automatically.

Target = A + B + compatible C; D is removed or reconsidered explicitly.

## Structural overview

| Part | Approved PDF | Current `main` | Reconstructed target | Class / action |
|---|---|---|---|---|
| Abstract | Present; stationary V-crack, local PZ, critical-load interpretation | Present; mostly equivalent, with later terminology polishing | Keep current wording where semantically equivalent; retain stationary-defect framing and independent critical material parameter | A+C |
| 1. Introduction | Eight literature/objective blocks **plus final roadmap paragraph for Sections 2–6** | Eight blocks; roadmap missing | Restore roadmap with six-section structure; keep later stationary/competing-mechanism clarification | A + C |
| 2. Problem statement | 2.1 Geometry and initial configuration; 2.2 Local problem and BCs; 2.3 tip asymptotics | 2.1 retitled “local fracture configurations”; superposition clarification added | Restore approved subsection title/structural intent; retain superposition correction-stress formulation and stationary-crack wording | A + B/C |
| 3. Equilibrium PZ parameters | Four subsections; explicit one-parameter equilibrium family; formulas for `d_i,δ_i,W_i,J_i`; proportionality `J_i=χ_iσ_iδ_i` | Corrected formulas and AQ-AN-01 are present; explicit `χ_i` relation and part of equilibrium-family interpretation were lost | Preserve corrected formulas and AQ-AN-01; restore equilibrium-family paragraph and corrected `χ_i` relation | A + B |
| 4. Numerical analysis of results | Separate numerical section; critical-load procedure; explicit `d_i/l<0.1` working range; `-1/2<λ_i<0` | Retitled “Numerical analysis and discussion”; corrected values present; some approved interpretation removed | Restore title and missing approved interpretation; keep recalculated values/Figs. 2–4 and elastic-contrast symmetry | A + B |
| 5. Discussion | Standalone section with five subsections | Missing entirely | Restore all five subsections, updated to corrected `J_i` interpretation and no chronological-fracture narrative | A + B/C |
| 6. Conclusions | Five numbered conclusions | Collapsed into unnumbered current Section 5 | Restore five-item structure and coverage, using corrected scientific statements | A + B |
| Appendix A | Three subsections; asymptotic definitions | Present | Keep current corrected/cleaned version unless a direct contradiction with the approved PDF is found | A + compatible C |
| References | 28 items in approved PDF, including Kaminsky–Dudyk 2026 criteria paper as [28] | Discussion-dependent criteria paper absent; one extra 2025 citation appears in current Introduction | Restore the 2026 criteria-paper reference; remove/hold the extra 2025 citation unless separately justified | A; D for unapproved addition |
| English manuscript | Not the reconstruction source | Complete translation + final style sweep exists | Freeze until Ukrainian master is reconstructed; then realign one-to-one, reusing existing polished English | preserve snapshot |

## Detailed decisions

### Abstract

The approved and current abstracts have the same scientific backbone. No
structural reconstruction is required. Retain:

- prescribed stationary V-shaped interfacial shear crack;
- small tensile process zone;
- physical-admissibility conditions;
- equilibrium length, opening, work, and zone-related energy parameter;
- equivalence of deformation and energy criteria only under consistent
  calibration of independently specified critical material parameters;
- prediction of a critical external load only after a material critical
  characteristic is specified.

Do not reintroduce language that identifies `J_i` with a separately
established global contour integral.

### Section 1 — Introduction

**Restore from approved PDF (A):**

The final roadmap paragraph beginning

> “Подальший виклад організовано так.”

It must describe:

- Section 2 — local boundary-value problem;
- Section 3 — equilibrium PZ parameters;
- Section 4 — numerical analysis;
- Section 5 — Discussion;
- Section 6 — Conclusions.

**Retain from current master (C):**

- stationary-crack framing;
- corner branching and outer-tip propagation as competing mechanisms;
- first-use clarification “зсувна мода (мода II)” where editorially useful.

**Do not retain automatically (D):**

The extra citation `KaminskyDudykChornoivan2025` is present in the current
Introduction but absent from the author-approved PDF. It is not part of the
recorded post-approval corrections. The reconstructed Ukrainian baseline
should therefore return to the approved citation sequence unless a separate
author decision is later recorded.

### Section 2 — Problem statement

**Restore/align (A):**

- subsection title 2.1: “Геометрія та вихідна конфігурація”;
- Fig. 1 interpretation as comparison of local configurations, not a temporal
  fracture sequence.

**Retain (B/C):**

- prescribed stationary V-shaped crack;
- explicit statement that loading is below the outer-tip local-instability
  threshold;
- correction-stress superposition
  `σ̂_i=σ_θ-CQ_i r^λ`;
- `σ̂_i=o(r^{-1})` at infinity;
- active-zone correction stress
  `σ̂_i=σ_i-CQ_i r^λ`;
- physical-admissibility conditions `Cg_2<0` and `CQ_i>0`;
- `k_i=0` as removal of the inverse-square-root zone-tip term, not a claim
  that the bounded stress part vanishes.

### Section 3 — Equilibrium PZ parameters

Retitle to the approved form:

> “Визначення параметрів рівноважної зони передруйнування”.

**Preserve confirmed corrections (B):**

1. Opening:
   `G_i^+(-1-λ) → G_i^+(-1)` in the denominator.
2. Work:
   coefficient `8/π`, replacing `32/(9π)`.
3. Energy parameter:
   coefficient `16/π`, replacing `64/(9π)`.
4. Normalized energy parameter:
   `J_i'=-4λ/[π(λ+2)(G_i^+(-1))^2] · d_i/l`.
5. AQ-AN-01 correction-stress Mellin formulation and initial strip
   `max(-1-λ,-1-λ_i)<Re p<0`, followed by analytic/meromorphic
   continuation to the factorization contour.

**Restore approved equilibrium-family interpretation (A):**

At fixed geometry and branch length `l`,

`d_i ∝ |C|^{-1/λ}`.

For every nonzero physically admissible `C`, the idealized singular model has
`d_i>0`, with `d_i→0` as `|C|→0`; the finite material threshold enters
only when the branching-initiation criterion is imposed.

**Restore the proportionality relation, but with corrected coefficients
(A+B):**

From the corrected opening and energy formulas,

`J_i = χ_i σ_i δ_i`,

with

`χ_i =
4(1+λ) sqrt[π G_i(0)] /
{π(λ+2) G_i^+(-1) K^+(-1)}`.

Consequently, the two local criteria

`J_i=J_ic`, `δ_i=δ_ic`

select the same state only when the independently specified material
thresholds are calibrated consistently:

`J_ic=χ_iσ_iδ_ic`.

`J_i` remains a **zone-related energy parameter along the one-parameter
equilibrium family**, not a separately established global contour integral.

### Section 4 — Numerical analysis of results

Restore the approved title:

> “Числовий аналіз результатів”.

**Preserve recalculated results (B), not the values printed in the approved
PDF:**

- `α_1=12.9202°`, `α_2=107.0897°`;
- at `α=45°`, material 1, `σ'=-0.5`:
  `d_1/l=0.14743436`,
  `δ_1'=0.14578703`,
  `J_1'=0.08362039`;
- principal negative-load material-1 branch:
  `max(d_1/l)=0.17793332` at `35°`,
  `max δ_1'=0.20770529` at `32°`,
  `max J_1'=0.11391440` at `33°`;
- regenerated Figures 2 and 3;
- publication Figure 4 asset;
- elastic-contrast symmetry
  `(E_1,ν_1)↔(E_2,ν_2)`,
  `α↔π-α`,
  material `1↔2`.

**Restore approved interpretation (A):**

1. In §4.1, the loading curves define the critical load once
   `δ_ic` or `J_ic` is specified, with
   `C_c=σ'_c σ_i l^{-λ_0}`.
2. In §4.2, use `d_i/l<0.1` as the main quantitative applicability range.
   Portions reaching about 0.18 are useful trend extrapolations, not equally
   accurate quantitative predictions.
3. In §4.3, restore the explicitly verified inequality
   `-1/2<λ_i<0` for all physically admissible open intervals of the base
   material pair.
4. State explicitly that the three exponent curves compare mathematical
   configurations and **do not prescribe a chronological fracture sequence**.

Remove the current phrase that interprets
`λ_0→λ→λ_i` as a “sequence” in the mechanical development.

### Section 5 — Discussion

Restore as a standalone section with five subsections.

#### 5.1 Quasi-static family of states and branching initiation

Restore

`C → d_i(C) → {δ_i(C), W_i(C), J_i(C)}`.

Quasi-static means a family of equilibrium zone configurations without
inertia. A finite branching threshold is obtained only after specifying
`δ_ic` or `J_ic`.

#### 5.2 Competing fracture mechanisms

Restore the explicit comparator at the outer tips:

`K_II=K_IIc`.

Corner branching and outer-tip interfacial propagation are competing local
mechanisms of the same stationary geometry. Do not describe them as required
successive stages.

#### 5.3 Energy and deformation criteria

Restore the corrected proportionality relation and the calibration condition

`J_ic=χ_iσ_iδ_ic`.

State that the equivalence is model- and geometry-specific, not a universal
identity between independently measured material characteristics.

#### 5.4 Residual corner field and local energy flux

Restore

`J_i^(el)(R) ~ (H_i^2/E_i) R^(2λ_i+1)`.

Because `-1/2<λ_i<0` on the verified admissible branches,

`lim_{R→0} J_i^(el)(R)=0`.

Therefore no separate finite elastic additive term is required in the local
branching-initiation criterion for this corner problem. Keep the distinction
from an already existing crack with real singularity exponent `-1/2`.

Restore the citation to the 2026 Kaminsky–Dudyk criteria paper.

#### 5.5 Scope and generalization

Restore:

- scale separation `d_i≪l≪L`;
- principal quantitative range `d_i/l<0.1`;
- values up to about 0.18 as extrapolation;
- generalization to developed symmetric V-shaped interfacial cracks by
  replacing `CQ_i` with the amplitude/generalized intensity coefficient of
  the corresponding outer corner field;
- related sharp-wedge splitting application.

### Section 6 — Conclusions

Restore the approved **five-item numbered structure**, with later corrections
incorporated:

1. model and closed-form equilibrium PZ characteristics;
2. dual physical-admissibility conditions and material selection;
3. singularity weakening, `-1/2<λ_i<0`, and vanishing local elastic flux;
4. deformation/energy criteria with independently specified but consistently
   calibrated critical parameters;
5. `d_i/l<0.1` quantitative range, competing corner/outer-tip mechanisms,
   and local-field generalization.

Do not restore any obsolete coefficients or superseded numerical values.

### Appendix A

Keep the current appendix as the working target because it already carries the
current determinant/factor notation used by the corrected Section 3. During the
final Ukrainian verification, check:

- `λ_0`, `λ`, `λ_i` root conventions;
- `Q_i=g_1q_i l^{λ_0-λ}`;
- base kernel `G` and local kernels `G_i`;
- plus-factor normalization and real-axis integration formula.

No structural change is required by the approved PDF.

## Bibliography action

Add the approved Discussion reference:

- A. O. Kaminsky and M. V. Dudyk,
  “On crack initiation criteria for an interfacial crack in a quasi-brittle
  material,” *Reports of the National Academy of Sciences of Ukraine*,
  no. 3, pp. 55–65, 2026,
  DOI: 10.15407/dopovidi2026.03.055.

The current extra Introduction citation
`KaminskyDudykChornoivan2025` is not in the approved PDF and is not part of
the recorded post-approval correction set. Hold/remove it in the Ukrainian
reconstruction; realign English citations later.

## Rewrite order

1. Restore Introduction roadmap and approved citation sequence.
2. Restore Section 2 approved structural wording while retaining AQ-AN-01
   superposition clarification.
3. Restore Section 3 equilibrium-family interpretation and corrected
   `χ_i` relation.
4. Restore missing approved interpretation in Section 4.
5. Add standalone Section 5 Discussion.
6. Replace current unnumbered conclusions with reconstructed Section 6
   five-item Conclusions.
7. Restore the missing bibliography item.
8. Build and inspect the Ukrainian manuscript.
9. Only after the Ukrainian master passes verification, realign the preserved
   English manuscript and rerun the bilingual structural/math/citation audit.
