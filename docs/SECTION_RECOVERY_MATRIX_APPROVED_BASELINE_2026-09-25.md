# Section-by-section recovery matrix

Date: 2026-09-25

Reference baseline: `main_sent to Dudyk and approved.pdf`

Working branch: `restore/author-approved-baseline-plus-corrections-2026-09-25`

Reconstruction rule:
**author-approved structural/textual baseline + all later confirmed scientific corrections and clarifications**.

Classification:
- **A** — approved baseline text/structure to restore;
- **B** — confirmed post-approval scientific correction overriding the PDF;
- **C** — post-approval clarification retained because it is consistent with the approved scientific logic;
- **D** — later restructuring/style change not retained automatically.

## Global structure

| Element | Approved PDF | Post-approval/current state before recovery | Reconstructed target | Class/status |
|---|---|---|---|---|
| Numbered sections | Six: Introduction; Problem statement; Process-zone parameters; Numerical analysis; Discussion; Conclusions | The merged `main` had collapsed the manuscript to five numbered sections and omitted the standalone Discussion | Restore six-section structure | **A — restored** |
| Introduction roadmap | Explicit paragraph beginning “Подальший виклад організовано так.” describing Sections 2–6 | Lost in the collapsed structure | Restore with numbering matching the six-section manuscript | **A — restored in branch** |
| Discussion | Standalone Section 5 with five subsections | Removed during later restructuring | Restore as standalone Section 5, while applying later scientific clarifications | **A+B+C — restored in branch** |
| Conclusions | Section 6, five numbered items | Renumbered/collapsed after Discussion was removed | Restore Section 6 and preserve five-item scientific coverage | **A+B+C — restored in branch** |

## Abstract

The approved abstract already reflects the stationary-defect formulation, the
small tensile process zone, the admissibility conditions, the equilibrium-zone
parameters, the weakening of the corner singularity, and the calibrated
equivalence of the deformation and energy criteria.

Target treatment:
- preserve the approved scientific logic;
- retain later terminology that (J_i=dW_i/dd_i) is a **zone-related energy
  parameter**, not a separately established global contour integral;
- retain corrected formulas/results indirectly reflected in the manuscript;
- do not introduce any chronology in which interfacial propagation must precede
  corner branching.

**Classification: A+C.**

## 1. Introduction

### Approved baseline
The approved Introduction contains the full literature sequence and ends with:
“Подальший виклад організовано так.” It then maps:
- Section 2 — local boundary-value problem, geometry, boundary conditions and
  asymptotic fields;
- Section 3 — Mellin transform, asymptotic matching, Wiener–Hopf solution, zone
  length/opening/energy characteristics;
- Section 4 — admissible regimes, geometry/load dependence and singularity
  exponents;
- Section 5 — initiation criteria, competing mechanisms, residual singularity,
  applicability limits and generalization;
- Section 6 — conclusions.

### Current reconstructed branch
The Introduction has been restored as the scientific entry point for the
stationary contacting V-shaped interfacial shear crack and is again followed by
the six-section roadmap.

### Target
Preserve the approved eight-paragraph logic and roadmap. Retain the later
editorial clarification that the V-shaped crack is a prescribed stationary
defect and that the work concerns initiation of a finite branch, not its
subsequent trajectory.

**Classification: A+C — recovered.**

## 2. Problem statement

### Approved baseline structure
- 2.1 Geometry and initial configuration
- 2.2 Local problem and boundary conditions
- 2.3 Asymptotics near the zone tip

The approved manuscript fixes the branch length (l), uses the contacting
V-shaped interfacial shear crack as the prescribed configuration, introduces
the small process zone (d_i), and closes the local zone problem with
(k_i=0).

### Confirmed post-approval additions/clarifications to retain
1. The V-shaped interfacial crack remains stationary while the loading
   parameter (C) varies.
2. The three panels of Fig. 1 compare mathematical configurations and do **not**
   prescribe a temporal sequence.
3. The local process zone is admissible only when both (Cg_2<0) and
   (CQ_i>0) hold.
4. For AQ-AN-01, the Wiener–Hopf correction field is explicitly
   [
   widehat{sigma}_i(r)=sigma_	heta(r,eta_i)-CQ_i r^lambda,
   ]
   with (widehat{sigma}_i(r)=o(r^{-1})) as (r	oinfty).
5. (k_i=0) is the regularity/closure condition determining the equilibrium
   zone length; it is not the material initiation criterion.

### Target
Keep the approved section organization and all later clarifications above.

**Classification: A+C — recovered.**

## 3. Determination of equilibrium process-zone parameters

### Approved baseline structure
- 3.1 Mellin transform and functional equation
- 3.2 Wiener–Hopf factorization
- 3.3 Process-zone length
- subsequent opening/energy-parameter derivation in the same section

### Scientific overrides that must replace the approved PDF
1. **Opening formula:** the denominator factor is (G_i^+(-1)), not
   (G_i^+(-1-lambda)).
2. **Work coefficient:** (8/pi), replacing (32/(9pi)).
3. **Energy-parameter coefficient:** (16/pi), replacing (64/(9pi)).
4. Correct normalized forms already verified in the repository must remain.
5. AQ-AN-01: initial common Mellin strip
   [
   max(-1-lambda,-1-lambda_i)<Re p<0,
   ]
   followed by analytic/meromorphic continuation to the factorization contour;
   no claim is made that the raw total-stress transform converges on
   (Re p=0).
6. AQ-AN-02: (J_i=dW_i/dd_i) is the zone-related energy parameter along the
   adopted one-parameter equilibrium family.

### Target
Use the approved derivation structure but the corrected formulas and the
resolved transform interpretation.

**Classification: A+B+C — recovered.**

## 4. Numerical analysis of results

### Approved baseline
The approved section contains:
- physical-admissibility intervals;
- transition-angle table;
- 4.1 dependence on normalized load;
- 4.2 dependence on interface angle;
- singularity-exponent comparison and interpretation.

### Confirmed numerical overrides
Do not restore obsolete numerical values from the approved PDF. Preserve the
recalculated results:
- (alpha_1=12.9202^circ);
- (alpha_2=107.0897^circ);
- at (alpha=45^circ), material 1, (sigma'=-0.5):
  (d_1/l=0.14743436),
  (delta_1'=0.14578703),
  (J_1'=0.08362039);
- principal negative-load material-1 maxima:
  (0.17793332) at (35^circ),
  (0.20770529) at (32^circ),
  (0.11391440) at (33^circ).

Also preserve:
- regenerated Figs. 2–3;
- final Fig. 4 asset;
- elastic-contrast symmetry
  ((E_1,
u_1)leftrightarrow(E_2,
u_2)),
  (alphaleftrightarrowpi-alpha), material (1leftrightarrow2);
- interpretation (d_i/l<0.1) as the principal quantitative range and values
  up to about (0.18) as trend-level extrapolation;
- Fig. 4 as comparison of mathematical configurations, not a chronology.

**Classification: A+B+C — recovered.**

## 5. Discussion

The entire standalone Discussion is part of the approved baseline and must
remain. It contains five subsections.

### 5.1 Quasi-static family of states and branching initiation
Preserve
[
Clongrightarrow d_i(C)longrightarrow
{delta_i(C),W_i(C),J_i(C)}.
]
Clarify that quasi-static means a sequence of equilibrium process-zone states
with fixed V-crack geometry and no inertia.

**Classification: A+C.**

### 5.2 Competing fracture mechanisms
Preserve the comparison between:
- corner branching governed by critical (delta_i) or (J_i);
- outer-tip interfacial propagation governed by (K_{II}=K_{IIc}).

Later clarification overrides any wording implying a mandatory sequence:
these are competing local mechanisms in the same prescribed geometry.

**Classification: A+C.**

### 5.3 Energy and deformation criteria
Preserve
[
J_i=chi_isigma_idelta_i.
]
The two criteria select the same state only when independently specified
critical parameters are consistently calibrated:
[
J_{ic}=chi_isigma_idelta_{ic}.
]
Do not turn this into a universal identity of material properties.

**Classification: A+C.**

### 5.4 Residual corner field and local energy flux
Preserve
[
J_i^{(el)}(R)simrac{H_i^2}{E_i}R^{2lambda_i+1}.
]
For the physically admissible baseline regimes,
(-1/2<lambda_i<0), hence
[
lim_{R	o0}J_i^{(el)}(R)=0.
]
Therefore no separate finite elastic additive term is required in the local
corner-initiation criterion. Retain the later explicit caveat that the
zone-related (J_i) is not thereby promoted to an independently established
global contour integral.

**Classification: A+C.**

### 5.5 Applicability and generalization
Preserve:
- (d_ill lll L);
- quantitative range (d_i/l<0.1);
- values up to (sim0.18) as extrapolation useful for trends;
- generalization to developed V-shaped interfacial cracks by replacing the
  local outer-field amplitude;
- related sharp-wedge splitting application.

**Classification: A — recovered.**

## 6. Conclusions

The approved PDF contains five numbered conclusions. The reconstructed target
keeps that five-item structure while incorporating the later confirmed
clarifications:
1. stationary V-shaped crack + small tensile process zone + closed-form zone
   quantities;
2. simultaneous admissibility conditions (Cg_2<0) and (CQ_i>0);
3. residual singularity weaker than (r^{-1/2}) on the verified admissible
   branches and vanishing local elastic flux;
4. deformation and energy criteria coincide only under consistent calibration
   of independently specified critical parameters;
5. (d_i/l<0.1) as the main quantitative range; corner branching and outer-tip
   propagation as competing mechanisms; generalization to developed V-shaped
   cracks.

**Classification: A+B+C — recovered.**

## Recovery decision

The six-section Ukrainian structure now matches the author-approved manuscript
at the level of section organization and substantive scientific coverage.
The post-approval analytical corrections, recalculated numerical values,
AQ-AN-01/AQ-AN-02 resolutions, stationary-crack framing, elastic-contrast
symmetry, and applicability caveat all override or refine the approved PDF
where appropriate.

### Next action

Perform a **paragraph-level diff for Sections 1–6**, marking each substantive
difference A/B/C/D. Only after this pass should any remaining wording be
rewritten. Then realign the English manuscript with the verified Ukrainian
master, reusing the already polished English text wherever it remains
one-to-one.
