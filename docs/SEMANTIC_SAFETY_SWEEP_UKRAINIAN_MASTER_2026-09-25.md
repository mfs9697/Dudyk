# Semantic-safety sweep — Ukrainian master

Date: 2026-09-25

Branch:
`restore/author-approved-baseline-plus-corrections-2026-09-25`

Scope:
- Abstract;
- Sections 1–6;
- Appendix A;
- terminology, model ontology, chronology, first introduction of symbols,
  criterion language, applicability statements, and cross-reference semantics.

This sweep is intentionally **not** a new scientific revision. It protects the
already agreed scientific model from wording that could suggest a different
problem, a different chronology, or a stronger energetic claim than has been
established.

## 1. Model ontology and chronology

### Stationary V-shaped crack

The master now uses one consistent object throughout:
a **prescribed stationary V-shaped interfacial shear crack with two symmetric
branches of length (l) each**.

The local asymptotic approximation treats the **two branches of that one
V-shaped crack** as semi-infinite. Wording that could be read as “two
interfacial cracks” has been removed.

The singularity exponent (lambda) is now described as belonging to the
**configuration with the stationary V-shaped interfacial crack**, not as a
field “after formation of the crack.” This avoids importing an unmodeled time
sequence into a comparison of mathematical configurations.

Likewise, (lambda_i) is the exponent of the **configuration with a process
zone**, not an exponent “after the zone appears.”

Appendix A has been aligned with the same ontology:
- configuration without the interfacial crack;
- configuration with the prescribed stationary V-shaped interfacial crack;
- configuration with the local process zone.

### Process zone versus actual branch formation

A sentence that said the process zone subsequently transforms into a normal
opening crack was removed. The local model does not solve that finite
transformation or the later trajectory. The safer statement now says that the
zone characteristics are used to formulate the branching-initiation
conditions.

The mathematical statement that the ideal singular model gives (d_i>0) for
every nonzero admissible (C), with (d_i	o0) as (|C|	o0), is retained:
it is a statement about the equilibrium-zone family, not about a finite
material threshold for physical branch initiation.

## 2. Geometry, length scales, and outer-field amplitude

The meaning of (l) is consistent:
it is the length of **one branch** (the half-length of the V-shaped crack);
the total length of the two branches is (2l).

A potentially ambiguous phrase “fix the length of the interfacial crack” was
replaced by “fix the branch length (l).”

The scale hierarchy remains
[
d_ill lll L.
]

The main quantitative interpretation remains
[
d_i/l<0.1,
]
while portions of the numerical curves reaching approximately (0.18) are
explicitly treated as trend-level extrapolation of the local model.

The dependence of (Q_i) is now stated correctly at first use:
it depends on the angle, elastic properties, **and branch length (l)**,
consistent with
[
Q_i=g_1q_i l^{lambda_0-lambda}.
]

The correction field is now explicitly described as the result of subtracting
the known field of the **stationary V-shaped interfacial crack without the
process zone**, eliminating any possible confusion with the intact-corner
reference problem.

## 3. Mellin/Wiener–Hopf notation

The AQ-AN-01 resolution remains intact:
[
widehat{sigma}_i
=sigma_	heta-CQ_i r^lambda,
qquad
widehat{sigma}_i=o(r^{-1}),
]
with the initial common strip
[
max{-1-lambda,-1-lambda_i}<Re p<0
]
and subsequent analytic/meromorphic continuation to the factorization contour.

The starred Mellin-transform notation used in the opening formula is now
explicitly defined immediately before its first use.

The numerical statement about the kernel has been made unambiguous:
(G_i(it)) is real, positive, even in (t), and tends to unity as
(|t|	oinfty); then the real formula for (G_i^+(p)) is invoked for real
(p<0).

The prime notation is now explicitly defined for all normalized quantities:
[
sigma',qquad delta_i',qquad J_i',
]
so the prime cannot be read as differentiation.

Appendix A now explicitly distinguishes the **base factor**
(G^+(p)), used in the coefficient (q_i), from the process-zone factor
(G_i^+(p)), used in the local Wiener–Hopf problem.

## 4. Energy parameter and initiation criteria

The master consistently treats
[
J_i=rac{dW_i}{dd_i}
]
as a **zonal energy parameter along the adopted equilibrium family**.

It is explicitly **not** promoted to an independently proved global contour
integral.

The corrected analytical chain remains untouched:
- opening denominator (G_i^+(-1));
- (W_i) coefficient (8/pi);
- (J_i) coefficient (16/pi);
- normalized (J_i') coefficient (4/pi);
- corrected (chi_i).

The manuscript consistently states that the deformation and energy criteria
select the same critical state only under the calibrated relation
[
J_{imathrm c}=chi_isigma_idelta_{imathrm c}.
]

To avoid overclaiming universality, the Abstract and Conclusions now refer to
**consistent calibration of critical parameters**, rather than implying a
universal identity of two material constants.

The Discussion also now says “independently determined critical
characteristics” instead of “independently measured material
characteristics.” This is important because (chi_i) depends on geometry and
elastic contrast.

The small-contour elastic contribution remains carefully separated:
for the verified admissible baseline branches,
[
-rac12<lambda_i<0
quadLongrightarrowquad
J_i^{(mathrm{el})}(R)	o0quad(R	o0).
]
The Conclusions now say that no separate finite elastic term needs to be added
to the **zonal parameter (J_i) in the local initiation criterion**, rather
than calling (J_i) a global energy-release quantity.

## 5. Competing mechanisms

The semantic distinction is now consistent across Introduction, Problem
statement, Fig. 1, Fig. 4, Discussion, and Conclusions:

1. corner branching governed locally through (delta_i) or (J_i);
2. outer-tip interfacial propagation governed through (K_{mathrm{II}}).

They are **competing mechanisms in the same prescribed geometry**, not
preassigned consecutive stages.

The local process-zone solution is one-way at leading order: it uses the
stationary-crack field as input and does not solve feedback of the small corner
zone on the outer tips.

## 6. Applicability and scope of singularity statements

The statements
[
|lambda_0|<|lambda_i|<|lambda|,
qquad
-rac12<lambda_i<0
]
remain explicitly restricted to the investigated baseline material pair and
its physically admissible branches. The manuscript does not generalize these
numerical inequalities to arbitrary elastic contrast.

The comparison with the additive representation in
`KaminskyDudyk2026Criteria` has been narrowed to the crack configuration
actually considered in that work, rather than being phrased as a universal
claim about every existing crack.

## 7. High-confidence edits made in this sweep

No governing equation or numerical checkpoint was changed.

The sweep made wording/notation corrections in:
- Abstract — criterion calibration and configuration-safe zone wording;
- Section 2 — one V-shaped crack/two branches, (Q_i(l)), correction-field
  provenance, removal of an unmodeled transformation claim;
- Section 3 — configuration language for (lambda_i), starred-transform
  definition, kernel wording, branch-length meaning of (l), normalized-prime
  notation, “branch crack” terminology;
- Section 4 — exact V-shaped-crack terminology in admissibility discussion;
- Section 5 — geometry-dependent critical-characteristic wording, scoped
  prior-work comparison, no false process chronology;
- Section 6 — explicit zonal status of (J_i) and criterion-calibration
  wording;
- Appendix A — no implied crack-formation chronology and explicit distinction
  (G^+
eq G_i^+).

## 8. Automated semantic checkpoints

The branch was checked for the following invariants, all of which pass:

- no “secondary crack” terminology in place of “branch crack”;
- no plural “interfacial cracks” for the two branches of the V-shaped defect;
- (lambda) tied to the stationary-crack configuration;
- (Q_i) dependence on (l) stated at first use;
- starred Mellin notation defined before use;
- corrected (G_i^+(-1)), (8/pi), (16/pi), and (4/pi) coefficients
  present;
- (J_i) explicitly called zonal and explicitly not a global contour integral;
- (d_i/l<0.1) and (sim0.18) extrapolation caveat retained;
- non-sequential competing-mechanism framing retained;
- Appendix chronology removed;
- (G^+) and (G_i^+) explicitly distinguished.

## Semantic verdict

The Ukrainian master is now internally coherent at the level of model
ontology, notation, energetic interpretation, applicability, and narrative
logic. No unresolved semantic contradiction was found that would require a new
scientific decision from the authors.

The remaining work before freezing the Ukrainian master is mechanical:
successful compilation/reference checks and one final rendered-PDF inspection
for layout or accidental visual defects.
