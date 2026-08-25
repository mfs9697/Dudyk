# Dudyk update delta ledger

## Purpose

This file records the scientific/editorial reconciliation of the revised author manuscript `! Стаття (оновлена)` against the verified LaTeX master and the reproducibility results in this repository. The revised author manuscript is treated as a **source of additional author ideas**, not as a replacement master. Numerical authority remains with the independently verified MATLAB/Python results and the validation record in `docs/AUTHOR_VALIDATION_2026-08-18.md`.

Status labels:

- **ADOPT** — integrate the idea into the master manuscript.
- **ADAPT** — retain the idea but rewrite or qualify it.
- **AQ** — retain as an open Author Query before final wording.
- **ALREADY INTEGRATED** — the master already contains the corrected/stronger version.
- **DO NOT USE AS FINAL** — useful as author context or visual reference, but not as the publication source.

## Sweep 1 — Introduction and statement of purpose

### ADOPT

1. Add the explicit bridge from analytical small-scale process-zone models for homogeneous bodies and planar bimaterial interfaces to the present nonsmooth-interface problem.
2. Use the sharper research gap after the Nazarenko–Kipnis results: the previous works characterize the singular field, crack equilibrium/instability and limiting loading, whereas the post-instability branching mechanism from the corner is not treated.

### ADAPT

1. Keep wedge indentation only as an adjacent class of corner-driven fracture/contact problems. Do not present the present bimaterial interface-crack problem as a direct continuation of wedge-indentation research.
2. Reorganize the older corner/process-zone literature only after a citation-by-citation audit; do not silently drop earlier relevant references.

### AQ

**AQ-INTRO-01.** Clarify the intended scientific role of wedge-indentation literature: methodological/physical analogy or direct research lineage. Preferred editorial interpretation: analogy.

### No new author contribution to integrate

The stated purpose of the paper is essentially unchanged; the final purpose/contribution paragraph will be strengthened later using the verified numerical results.

## Sweep 2 — Problem statement and analytical derivation

### ADOPT

1. Add the explicit scaling, for fixed geometry, loading coefficient and elastic parameters,
   \[
   d_i\sim \sigma_i^{-1/|\lambda|}.
   \]
2. Add the corresponding opening scaling
   \[
   \delta_i\sim \sigma_i^{1-1/|\lambda|},
   \]
   noting that \(-1<\lambda<0\), so decreasing cohesive/cleavage resistance increases both the zone length and the opening.
3. State explicitly that \(\delta_i\propto d_i\) for a fixed configuration, so zone length and opening increase synchronously with loading.

### ADAPT + AQ

**AQ-PS-01.** The revised manuscript explains the bisector direction through the principle of local symmetry, i.e. vanishing local mode-II intensity. Because the present paper does not solve the problem for an arbitrarily oriented process zone, preferred wording is that the bisector direction follows from symmetry and is **consistent with** the local-symmetry condition, rather than being uniquely selected by it.

### ALREADY INTEGRATED

- Correct direction convention: \(\beta_1=\pi\), \(\beta_2=0\).
- Material meaning of the index \(i\) in \(D_i,G_i,Q_i,\beta_i\).
- Corrected two signs in \(D_1(p)\).
- Restored factors \(\sigma_i^2\) in \(W_i\) and \(J_i\).
- Simultaneous admissibility conditions \(Cg_2<0\) and \(CQ_i>0\).
- Matched-asymptotic scale separation and use of \(d_i/l\ll1\) as a self-consistency check.
- Distinction between \(\lambda\) (shear-cracked corner, used in \(d_i,\delta_i,J_i\)) and \(\lambda_1,\lambda_2\) (singularity after process-zone formation).
- Energy criterion \(J_i=J_{ic}\) for branching.

## Sweep 3 — Numerical analysis, Figures 2–4, Conclusions

### ADOPT

1. Start the numerical discussion from the physical-admissibility map based on \(Cg_2<0\) and \(CQ_i>0\), with claims explicitly limited to the investigated material family/baseline when appropriate.
2. Retain Table 1 after independent recalculation of all listed transition angles. For the baseline \(E_1/E_2=0.5\), \(\nu_1=\nu_2=0.3\), use the verified values
   \[
   \alpha_1=12.9141^\circ,\qquad \alpha_2=107.0842^\circ.
   \]
3. Use the corrected Figure-2 interpretation, but state comparisons conservatively (e.g. among the four plotted control cases, the largest values occur for \(\alpha=45^\circ\), \(C<0\)).
4. Retain the synchronous angular maxima of \(d_i/l\), \(\delta_i'\), and \(J_i'\) as a central physical result.
5. Retain the three-stage singularity interpretation
   \[
   \lambda_0\rightarrow\lambda\rightarrow\lambda_i,
   \]
   with process-zone formation partially shielding the corner singularity for the investigated baseline/admissible segments.
6. Retain the interpretation of \(J_i\) as the fracture driving force entering a branching criterion.

### ADAPT

1. Replace “least fracture toughness” by “most unfavorable geometry / lowest critical applied loading for a fixed material toughness \(J_{ic}\)”.
2. Treat \(\alpha=90^\circ\) as a degenerate analytical limit corresponding to a straight interface, not as an ordinary numerical point.
3. Replace deterministic wording that shear-crack singularity “causes” the process zone by wording that it creates conditions for local fracture together with the sign/admissibility and strength conditions.
4. Do not generalize the sign map or the inequality \(|\lambda_0|<|\lambda_i|<|\lambda|\) beyond the material family actually checked.

### AQ

**AQ-NR-01.** Should a deformation criterion \(\delta_i=\delta_{ic}\) be introduced alongside \(J_i=J_{ic}\)? If yes, define the physical/material meaning and source of \(\delta_{ic}\); otherwise retain only the energy criterion.

**AQ-NR-02.** Confirm that the phrase “least fracture toughness of the joint” is intended to mean the lowest critical external loading (for fixed \(J_{ic}\)) at the angular maxima of the fracture driving force.

**AQ-NR-03.** Figure 3 reaches approximately \(d_i/l\approx0.18\), while the local model assumes \(d_i/l\ll1\). Decide how to present this validity limit: retain the full mathematical curve but explicitly flag the region where the small-scale assumption is weak, and avoid unqualified quantitative conclusions there.

### DO NOT USE AS FINAL

- Revised author Figure 2 as the publication graphic: its historical axis window clips high values of the \(45^\circ\), \(C<0\) branch. Use the repository recalculation.
- Revised author Figure 3 as numerical authority: small-angle fixed-contour values are not fully converged. Use the adaptive-contour repository result.
- Revised author Figure 4 as the final graphic: the values are compatible after the corrected \(D_1\), but the repository version more clearly separates complete mathematical branches from physically admissible segments.

## Integration order

1. Add Author Query infrastructure to the working LaTeX manuscript.
2. Integrate AQ-PS-01 and the accepted analytical scaling comments into Sections 1–2.
3. Rewrite Section 3 (“Числовий аналіз і обговорення результатів”) from verified CSV data while incorporating the accepted author interpretations and AQ-NR-01–03.
4. Recalculate/verify the full transition-angle table.
5. Perform the Introduction citation audit and independent literature sweep before finalizing the Introduction.
6. Rewrite Conclusions only after the numerical discussion is stable.
7. Translate the stable Ukrainian scientific master into English; unresolved Author Queries remain in Ukrainian until closed.
