# Author Queries

Final sweep status: **no open author queries**.

The register below records how the former working queries were resolved in
the manuscript. Query boxes have been removed from the publication source.

## Resolved scientific/editorial queries

### AQ-INTRO-03 — Introduction logic and novelty framing

Resolved by the approved stationary-crack framing. The Introduction now
presents the V-shaped interfacial shear crack as a prescribed stationary
configuration and defines the manuscript's scope narrowly as local branching
initiation at the corner. It does not claim a continuous post-critical
continuation through an instability point.

### AQ-PS-01 — bisector direction and local symmetry

Resolved in the problem statement. The bisector is an assumed consequence of
the symmetric geometry/loading model; the vanishing local Mode-II component
is used as a consistency argument, not as a separately optimized direction.

### AQ-PS-02 — closure condition at the process-zone tip

Resolved by the source methodology and the derivation. The condition
(k_i=0) removes the inverse-square-root singular term and is used to
determine the equilibrium process-zone length. It does not require the
bounded part of the tip stress to vanish. The manuscript now cites
`KaminskyDudykPolishchuk2024` at this step.

### AQ-NR-01 — deformation criterion

Resolved by defining the alternative deformation criterion explicitly as
(delta_i=delta_{i\mathrm c}), with (delta_{i\mathrm c}) an independently
specified critical opening. The energy criterion is
(J_i=J_{i\mathrm c}). For fixed geometry, both measures are proportional
to the equilibrium zone length; equivalence requires consistent calibration
of the two critical material parameters. The manuscript cites the analogous
process-zone criteria in `KaminskyEtAl2023`.

### AQ-NR-02 — interpretation of angular maxima

Resolved by the September-25 recalculation. The maxima of (d_i/l),
(delta_i'), and (J_i') are close but not coincident. The manuscript
no longer interprets a prescribed-load maximum as a universal critical-load
ranking.

### AQ-NR-03 — small-scale validity

Resolved by retaining the full mathematical curve while stating explicitly
that (d_i/l\approx0.18) is no longer unambiguously small and quantitative
interpretation near the largest maximum requires caution.

### AQ-NR-04 — rechecked numerical material

Resolved after M. V. Dudyk confirmed the analytical corrections on
25 September 2026 and Figures 2--3 were regenerated. Table 1 and Figure 4
are unaffected by those two formula corrections.

### AQ-REV-01 — “post-critical stage” wording

Resolved by removing the post-critical narrative. The abstract,
Introduction, problem statement, numerical discussion, and Conclusions now
consistently treat the V-shaped interfacial crack as a prescribed stationary
defect and the corner/outer-tip mechanisms as competing local mechanisms.

### AQ-REV-02 — energetic meaning of (J_i)

Resolved by restricting the claim to the adopted local model. The manuscript
defines (J_i=dW_i/dd_i) as a zone-related energy parameter and explicitly
states that it is not being identified with an independently established
global contour integral. The criterion (J_i=J_{i\mathrm c}) is used as a
model-specific local initiation condition, in analogy with the process-zone
criteria cited in `KaminskyEtAl2023`.

### AQ-REV-03 — why only (E_1/E_2<1)

Resolved by stating the material-interchange symmetry explicitly:

[
(E_1,
u_1)leftrightarrow(E_2,
u_2),qquad
alphaleftrightarrowpi-alpha,qquad
1leftrightarrow2.
]

For equal Poisson ratios this includes
(E_1/E_2leftrightarrow E_2/E_1), so the tabulated range
(E_1/E_2<1) is sufficient.

## Resolved analytical audit queries

### AQ-AN-01 — Mellin transform and analyticity strip

Resolved on 25 September 2026 by restoring the superposition step used in the
source methodology. (Phi_i^+) is the Mellin transform of the correction
stress
(widehat{sigma}_i=sigma_	heta-CQ_i r^lambda), not of the raw total
stress. The initial common Mellin strip is

[
max{-1-lambda,-1-lambda_i}<operatorname{Re}p<0.
]

The functional relation is then analytically/meromorphically continued to the
factorization contour. See `docs/AQ_AN_01_RESOLUTION_2026-09-25.md`.

### AQ-AN-02 — opening factor and energy coefficients

Resolved by independent author recheck on 25 September 2026. The opening
formula uses (G_i^+(-1)); the coefficients in (W_i) and (J_i) are
(8/pi) and (16/pi), respectively. Figures 2 and 3 and their numerical
discussion were regenerated accordingly.

## Earlier confirmed technical points

- (eta_1=pi), (eta_2=0);
- material meaning of the index (i);
- corrected material-2 plus-factor index;
- corrected two signs in (D_1(p));
- restored (sigma_i^2) in the energy expressions.
