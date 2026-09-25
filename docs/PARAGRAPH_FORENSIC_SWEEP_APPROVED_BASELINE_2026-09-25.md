# Paragraph-level forensic sweep against the Dudyk-approved manuscript

Date: 2026-09-25

Baseline: `main_sent to Dudyk and approved.pdf` (22 pages)

Working branch:
`restore/author-approved-baseline-plus-corrections-2026-09-25`

Purpose: detect silent losses, semantic drift, and legitimate post-approval
overrides after restoring the six-section structure.

Classification:
- **A** — approved baseline content that should survive;
- **B** — confirmed scientific correction that overrides the approved PDF;
- **C** — later clarification that should survive;
- **D** — later stylistic/restructuring change; retain only if it does not
  weaken or distort the approved text.

## Executive finding

The large structural loss has been repaired: the Introduction roadmap,
standalone Discussion, and Section 6 Conclusions are back.

The paragraph-level sweep nevertheless found a second layer of version drift.
Most of it is small, but several changes are scientifically/editorially worth
repairing because they silently removed author-approved definitions,
qualifiers, or framing.

**Clear recovery targets remain in the Abstract, Introduction, Section 2, and
the symmetry paragraph of Section 4.**

Sections 3, 5, and 6 are in good shape: their differences from the approved PDF
are predominantly necessary B/C changes arising from the analytical
corrections, AQ-AN-01/AQ-AN-02, recalculated numerics, and stationary-crack
clarification.

---

# Front matter — Abstract

## A0-P1 — problem, stationary defect, process zone

Approved:
the defect has **two symmetric branches**.

Current:
“із симетричними гілками”.

Finding:
the number “двома” disappeared for no scientific reason.

Decision:
**A loss — restore “двома симетричними гілками”.**

## A0-P2 — effect of the process zone on the singularity

Approved:
“послаблює сингулярність **стаціонарної конфігурації** з V-подібною
міжфазною тріщиною”.

Current:
“послаблює сингулярність **вихідної конфігурації** ...”.

Finding:
“стаціонарної” is scientifically more precise and consistent with the central
framing later confirmed in the manuscript.

Decision:
**A/C — restore “стаціонарної конфігурації”.**

## A0-P3 — practical output of the model

Approved:
after independently specifying the relevant critical material characteristic,
the results allow determination of the **critical external load** for branching
initiation.

Current:
the final sentence was generalized to “прогнозувати ініціювання ...”.

Finding:
the current wording is less informative and drops the concrete output
(C_c), which is retained throughout Sections 3–5.

Decision:
**A loss — restore the explicit critical-load statement.**

Other Abstract differences are stylistic and do not alter the mechanics.

---

# 1. Introduction

## I-P1 — corner singularities and literature

No substantive loss.

Decision:
**A — retain current wording.**

## I-P2 — finite nonlinear/process zone and scale separation

No substantive loss.

Decision:
**A — retain current wording.**

## I-P3 — existing interface cracks and crack departure

Approved wording “Аналітичне моделювання ...” became “Аналітичні моделі ...”.

Finding:
pure stylistic recast.

Decision:
**D — current wording is acceptable.**

## I-P4 — related analytical corner problems

Two differences deserve separate treatment.

1. Approved:
“аналітичні моделі зон передруйнування та тріщин”.

   Current:
“аналітичні моделі локального руйнування”.

   This broadens the description slightly.

   Decision:
   **D — prefer the approved, more concrete formulation.**

2. Approved closing:
application of the apparatus to the specific **singular field** created by the
stationary contacting interface shear crack remains unresolved.

   Current:
“до конкретного поля ...” — “сингулярного” disappeared.

   Decision:
   **A loss — restore “конкретного сингулярного поля”.**

## I-P5 — Nazarenko–Kipnis outer field

The current recast is semantically equivalent. No loss requiring action.

Decision:
**D — retain current wording.**

## I-P6 — competing outer-tip mechanism

Current text explicitly says “за зсувною модою (модою II)” and keeps the
stationary-crack / competing-mechanism interpretation.

Decision:
**A+C — retain current wording.**

## I-P7 — subject of the paper

No substantive loss.

Decision:
**A — retain.**

## I-P8 — aim and method

Approved:
the process zone carries a constant normal separation-resistance stress
(sigma_i).

Current:
the sentence retains the physical quantity but drops the symbol (sigma_i).

Finding:
this is a small but real editorial regression: the approved text introduces the
symbol at first conceptual use.

Decision:
**A loss — restore (sigma_i) in this paragraph.**

## I-P9 — roadmap

This entire paragraph was lost in the five-section version and has now been
restored.

Decision:
**A — recovered successfully.**

---

# 2. Problem statement

## 2.1, P1 — geometry and half-angle

Approved:
- explicit reference to Fig. 1;
- “(alpha) — півкут зламу”.

Current:
- the first Fig. 1 reference disappeared;
- the sentence says “дорівнює (2alpha), де” and goes directly into the
  inequality, leaving the verbal definition of (alpha) unstated.

Finding:
the missing half-angle definition is a genuine editorial defect.

Decision:
**A loss — restore the Fig. 1 reference and explicitly define
(alpha) as the half-angle.**

## 2.1, P2 — coordinates and field components

No substantive loss.

Decision:
**A — retain.**

## 2.1, P3 — intact-corner outer field

Approved:
(C) is the **amplitude of the local singular field** and accounts for the
external load and global geometry.

Current:
(C) is called a “узагальнений коефіцієнт інтенсивності напружень”.

Finding:
this is a stronger terminological claim than the approved text and is not
needed for the derivation. Elsewhere the manuscript consistently uses
“амплітуда зовнішнього поля”.

Decision:
**D with semantic risk — restore the approved neutral term
“амплітуда (C) локального сингулярного поля”.**

## 2.1, P4–P5 — prescribed stationary V-crack

Approved text explicitly states:
- the V-crack is the **already existing prescribed configuration**;
- its two branches emerge from (O);
- (l) is the length of each branch and may be called the crack half-length;
- (l) is fixed;
- outer-tip propagation is outside the local problem;
- the mechanism studied here is the corner process zone / branching mechanism.

Current:
the same ingredients are present only in condensed form, introduced after
“If (Cg_2<0) ...”.

Finding:
no direct contradiction, but the approved logical order is sharper: the crack
is prescribed; (Cg_2<0) is the contact/admissibility condition, not the
ontological condition for the crack to exist.

Decision:
**A loss through compression — restore the approved prescribed/stationary
framing while keeping the later competing-mechanism clarification.**

## 2.1, P6 — bisector direction

Current text keeps the symmetry and local-symmetry explanation.

Decision:
**A — retain.**

## 2.1, P7 — (eta_i) and material index

Approved explicitly says (i=1,2) is the material number.

Current gives an even more explicit statement that the index on
(eta_i,d_i,sigma_i,Q_i) is the material number.

Decision:
**C — retain current wording.**

## 2.1, P8 — process-zone model

Approved ends this paragraph by stating that each admissible direction defines
a quasi-static equilibrium family whose opening and energy characteristic are
used for the initiation criteria.

Current:
that sentence disappeared here; the idea survives later in Sections 3 and 5.

Finding:
scientific content is not absent globally, but this is approved local framing
that was silently removed.

Decision:
**A loss — restore one concise sentence here.**

## Fig. 1 caption

Approved:
panel (b) explicitly gives the total branch length (2l).

Current:
“two branches of length (l) each” is retained, but the parenthetical
“сумарна довжина гілок (2l)” disappeared.

Decision:
**A minor loss — restore for consistency with the text.**

## 2.2, opening paragraph — scale separation and fixed geometry

Approved explicitly states in this subsection:
- (C) may vary quasi-statically;
- (l) and therefore (2l) remain fixed;
- changing load changes (d_i) and related local characteristics.

Current:
the subsection retains (d_ill lll L), but this explicit fixed-geometry
statement disappeared.

Decision:
**A loss — restore.**

## 2.2, local approximation paragraph

Approved explicitly calls the construction a **one-way local approximation**:
the known stationary-crack field loads the inner problem, while feedback of
the small zone on the outer tips is not determined.

Current:
the infinite-plane / semi-infinite-branch approximation is retained, but the
one-way qualification is omitted here.

Finding:
this qualification is scientifically useful and guards against
over-interpretation.

Decision:
**A loss — restore.**

## 2.2, boundary conditions

Approved introduces the other material as (j=3-i).

Current uses only (j
e i).

Decision:
**A minor loss — restore (j=3-i) for explicitness.**

## 2.2, matched field and AQ-AN-01

Approved PDF transformed the raw total stress and used an analytically
continued strip crossing the factorization split.

Current:
- introduces the correction stress
  [
  widehat{sigma}_i=sigma_	heta-CQ_i r^lambda;
  ]
- states (widehat{sigma}_i=o(r^{-1}));
- keeps the explicit known power term on the active segment.

Decision:
**C/B — current text must override the approved PDF. No reversion.**

## 2.2, admissibility close

Approved:
for the parameter sets studied below, the simultaneous conditions can hold
only for one of the two materials.

Current:
the two inequalities are retained, but this preview sentence disappeared.

Decision:
**A minor loss — restore.**

## 2.3 — zone-tip asymptotics and (k_i=0)

Current improves the approved explanation:
- (k_i=0) removes the inverse-square-root singular coefficient;
- it determines the equilibrium (d_i);
- it does not require the bounded part of the end stress to vanish.

The approved distinction between this regularity condition and the later
material initiation criterion is also preserved by the surrounding manuscript.

Decision:
**C — retain current clarification.**

---

# 3. Determination of equilibrium process-zone parameters

## 3.1 — Mellin transform and functional equation

This subsection is intentionally not text-identical to the approved PDF.

Approved:
used the transform of the raw total stress and a loose analytic-continuation
statement.

Current:
defines the plus transform for the correction stress, explicitly relates it to
the total-stress transform where both converge, establishes
[
max{-1-lambda,-1-lambda_i}<Re p<0,
]
and only then analytically/meromorphically continues the functional equation to
the factorization contour.

Decision:
**C — retain current AQ-AN-01 resolution in full.**

No approved scientific content needs restoration here.

## 3.2 — Wiener–Hopf factorization

The factorization, factors (G_i^pm), gamma factors (K^pm), and numerical
plus-factor formula preserve the approved derivation.

Minor wording changes are editorial only.

Decision:
**A/D — retain current text.**

## 3.3 — equilibrium zone length

The approved structure and physical interpretation are preserved:
- Abelian limit;
- local (k_i);
- (k_i=0);
- (d_i(C));
- no finite threshold for the mathematical appearance of the zone;
- dependence on (sigma_i);
- normalized (d_i/l).

Decision:
**A — retained.**

## 3.4 — opening and energy parameter

Three approved formulas are superseded and must **not** be restored:
- opening denominator: use (G_i^+(-1));
- (W_i): use coefficient (8/pi);
- (J_i): use coefficient (16/pi).

The current normalized formulas and the resulting (chi_i) are internally
consistent with these corrections.

Current also correctly replaces the approved “energy-release-rate” style
wording by the more limited statement that
(J_i=dW_i/dd_i) is a **zone-related energy parameter** along the adopted
equilibrium family, not an independently established global contour integral.

Decision:
**B+C — current text is authoritative.**

---

# 4. Numerical analysis of results

## 4-P1 — admissibility and baseline materials

No loss. Current text uses the recalculated transition angles
(12.9202^circ) and (107.0897^circ).

Decision:
**B — retain current values.**

## 4-P2 — elastic-contrast symmetry

Approved gives the symmetry consequences explicitly:
[
d_1leftrightarrow d_2,qquad
lambda_1leftrightarrowlambda_2,
]
together with material exchange, reciprocal modulus ratio,
(alphaleftrightarrow180^circ-alpha), and the transition-angle
consequence
[
alpha_1leftrightarrow180^circ-alpha_2.
]

Current replaces this by the compact mapping
[
(E_1,
u_1)leftrightarrow(E_2,
u_2),quad
alphaleftrightarrowpi-alpha,quad
1leftrightarrow2,
]
plus the reciprocal (E_1/E_2) statement for equal Poisson ratios.

Finding:
the compact form is correct, but two useful explicit consequences from the
approved text disappeared: (d_1leftrightarrow d_2),
(lambda_1leftrightarrowlambda_2), and the corresponding
(alpha_1/alpha_2) relation.

Decision:
**A+C — keep the compact mapping and restore its explicit consequences.**

## 4.1 — load dependence

Approved numerical checkpoint was based on the old formulas.

Current correctly overrides it:
[
d_1/l=0.14743436,quad
delta_1'=0.14578703,quad
J_1'=0.08362039.
]

Current also keeps the procedure for obtaining (C_c) from independently
specified (delta_{ic}) or (J_{ic}).

Decision:
**B+C — retain current text.**

## 4.2 — angle dependence

Approved curves and old statements were tied to the superseded analytical
coefficients.

Current correctly reports the regenerated maxima:
- (d_1/l=0.17793332) at (35^circ);
- (delta_1'=0.20770529) at (32^circ);
- (J_1'=0.11391440) at (33^circ).

The current explanation that the maxima are close but need not occur at the
same angle is an important consequence of the corrected formulas.

Decision:
**B — retain current text.**

The (d_i/l<0.1) quantitative range and (sim0.18) extrapolation warning are
preserved.

## 4.3 — singularity exponents

The approved scientific content is preserved:
[
|lambda_0|<|lambda_i|<|lambda|,qquad
-rac12<lambda_i<0
]
for the verified baseline admissible branches.

Current wording strengthens the no-chronology clarification for Fig. 4.

Decision:
**A+C — retain current text.**

---

# 5. Discussion

The standalone section itself was the largest structural casualty of the
five-section version and is now restored.

## 5.1 — quasi-static family

Approved family
[
C	o d_i(C)	o{delta_i(C),W_i(C),J_i(C)}
]
is preserved.

Current adds “zone-related” before the critical energy parameter.

Decision:
**A+C — retain.**

## 5.2 — competing mechanisms

Approved wording included “подальше” and “який ... реалізується першим”.

Current deliberately avoids a temporal reading and instead compares which
criterion is reached at a lower external load.

Decision:
**C — current wording is preferable and must remain.**

## 5.3 — energy and deformation criteria

Approved calibrated equivalence is preserved.

Current makes explicit that the two critical parameters are independently
specified and coincide in critical-state selection only under consistent
calibration.

Decision:
**C — retain.**

## 5.4 — residual corner field

Approved scaling and vanishing local elastic flux are preserved.

Current adds the crucial AQ-AN-02 caveat:
using (J_i=dW_i/dd_i) without a finite additive elastic term does not make
(J_i) a separately proven global contour integral.

Decision:
**C — retain.**

## 5.5 — applicability/generalization

Approved content is preserved essentially intact:
(d_i/l<0.1), (sim0.18) extrapolation, developed V-crack generalization,
and sharp-wedge splitting application.

Decision:
**A — recovered successfully.**

---

# 6. Conclusions

## C1

Current expands the approved item by explicitly naming
(d_i,delta_i,W_i,J_i).

Decision:
**A+C — retain.**

## C2

Current explicitly writes (Cg_2<0) and (CQ_i>0).

Decision:
**A+C — retain.**

## C3

Current makes the scope of
(-1/2<lambda_i<0) explicit: verified admissible intervals of the baseline
material pair.

Decision:
**C — retain.**

## C4

Current is scientifically more precise than the approved PDF:
the criteria select the same critical state only under consistent calibration
of independently specified critical parameters.

Decision:
**C — retain.**

## C5

Current preserves the approved applicability/generalization conclusion and adds
the useful (sim0.18) extrapolation warning and explicit “not sequential
stages” statement.

Decision:
**A+C — retain.**

---

# Recovery list produced by the sweep

The following are **high-confidence restorations** that do not conflict with
any later confirmed correction:

1. Abstract: restore “двома симетричними гілками”.
2. Abstract: restore “стаціонарної конфігурації”.
3. Abstract: restore explicit “визначити критичне зовнішнє навантаження ...”.
4. Introduction: restore “конкретного сингулярного поля”.
5. Introduction: restore symbol (sigma_i) at its approved conceptual
   introduction.
6. Section 2.1: restore first Fig. 1 reference.
7. Section 2.1: restore the verbal definition “(alpha) — півкут зламу”.
8. Section 2.1: replace the unsupported stronger label “узагальнений
   коефіцієнт інтенсивності напружень” for (C) by the approved
   “амплітуда локального сингулярного поля”.
9. Section 2.1: restore the explicit prescribed/stationary V-crack framing and
   the fixed meaning of (l), without reintroducing sequential-fracture
   language.
10. Section 2.1: restore the concise quasi-static-family sentence after the zone
    definition.
11. Fig. 1 caption: restore “сумарна довжина гілок (2l)”.
12. Section 2.2: restore the explicit (C)-varies / (l)-fixed statement.
13. Section 2.2: restore the one-way-local-approximation qualification.
14. Section 2.2: restore (j=3-i).
15. Section 2.2: restore the preview that the two admissibility inequalities
    select only one material for the parameter sets studied.
16. Section 4: retain the compact elastic-symmetry statement but restore the
    explicit consequences
    (d_1leftrightarrow d_2),
    (lambda_1leftrightarrowlambda_2), and
    (alpha_1leftrightarrow180^circ-alpha_2).

No formula, numerical value, AQ resolution, or Discussion/Conclusion content
should be reverted to the approved PDF where a B/C override exists.

# Verdict

The manuscript is **scientifically recoverable without rollback**. The
remaining drift is local and tractable. There is no evidence of another lost
major section or a second hidden scientific branch.

The safest next commit is a narrow **approved-detail restoration patch** that
implements only items 1–16 above, followed by a build and a semantic diff
against both:
1. the Dudyk-approved PDF; and
2. the immutable post-approval archive.


# Implementation checkpoint

The high-confidence recovery patch from this sweep has now been applied to the
working branch in four narrow manuscript edits:

- `bd2ba439` — approved Abstract details;
- `dff62671` — approved Introduction details;
- `f37bcfa3` — approved Problem-statement framing and definitions;
- `2f9be4fa` — explicit symmetry consequences in Section 4.

The patch deliberately leaves all B/C overrides untouched: corrected
(G_i^+(-1)), (8/\pi) and (16/\pi) coefficients, AQ-AN-01 transform
interpretation, AQ-AN-02 energy-parameter interpretation, recalculated figures
and checkpoints, and the non-sequential competing-mechanism framing.
