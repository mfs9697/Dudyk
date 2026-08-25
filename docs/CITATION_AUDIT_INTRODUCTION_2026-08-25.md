# Citation-by-citation audit of the Introduction — 25 August 2026

## Scope and editorial rule

This audit checks every reference currently cited in the Introduction of the revised author manuscript `! Стаття (оновлена)` against the claim for which it is used. The author Word file is treated as a donor of ideas and references; it does not override the verified scientific master.

For each citation we ask:

1. Does the cited work actually support the sentence in which it appears?
2. Is it a primary or otherwise appropriate source for that claim?
3. Is its bibliographic record sufficiently verified for the final BibTeX database?
4. Should it be kept in place, moved to a different claim, qualified, replaced, or dropped?

Status vocabulary:

- **KEEP** — scientifically and bibliographically appropriate in the intended role.
- **KEEP / QUALIFY** — relevant, but the manuscript must narrow the wording.
- **MOVE** — relevant to the Introduction, but currently attached to the wrong claim.
- **WEAK / REPLACE** — only indirect support; seek a more direct source.
- **FIX METADATA** — bibliographic record needs correction/normalization.
- **AQ** — scientific intent should be confirmed with the author before final wording.

This audit is not yet the independent literature sweep. Nevertheless, highly relevant omitted papers encountered during verification are flagged at the end because they may change the literature architecture and novelty wording.

---

## 1. Practical motivation: engineering geometries with corners or broken interfaces

Current citation cluster: **[3, 7, 16, 28, 44]**.

### [3] Barbosa et al. (2018), *Comparison of different adhesively-bonded joint types for mechanical structures*

- **Support:** strong for stepped-lap and scarf joints and for the practical importance of joint geometry; the paper also explicitly notes the ability of adhesive bonding to join dissimilar materials.
- **Decision:** **KEEP**.
- **Editorial use:** good general engineering motivation, but not a primary source on corner singularity.

### [7] Chandra Kishen (2005), *Recent developments in safety assessment of concrete gravity dams*

- **Support:** strong for fracture-mechanics-based safety assessment of gravity dams, but weak for the specific statement that a gravity-dam component is an example of a broken *bimaterial* interface with a corner.
- **Decision:** **WEAK / REPLACE** for the present citation cluster.
- **Editorial use:** retain only if the sentence is broadened to “engineering structures in which fracture is governed by geometric stress concentrators”; otherwise seek a direct paper on a concrete–rock or dam-interface corner.

### [16] Gacoin et al. (2009), double scarf joint

- **Support:** exceptionally strong. The paper explicitly studies an **internal singularity created by the geometry of the double scarf joint** and its effect on damage and microcrack initiation.
- **Decision:** **KEEP (key source)**.
- **Editorial use:** this should probably be one of the principal practical-motivation citations rather than one citation in a long undifferentiated list.

### [28] Kimiaeifar et al. (2012), *Reliability analysis of adhesive bonded scarf joints*

- **Support:** strong for scarf-joint engineering relevance and for the influence of scarf angle / geometry on failure probability; not a source on the local asymptotic singular field itself.
- **Decision:** **KEEP / QUALIFY**.

### [44] Tannert, Lam & Vallée (2011), rounded dovetail connections

- **Support:** verifies the engineering relevance of dovetail-type cornered connections, but the studied system is explicitly a **wood-to-wood connection**, not a dissimilar-material bimaterial interface.
- **Decision:** **KEEP / QUALIFY**, or drop if the sentence remains specifically about dissimilar materials.

### Editorial consequence for this paragraph

Do not make one sentence imply that all five examples are the same class of broken bimaterial interface. A safer architecture is:

- scarf / stepped adhesive joints as direct dissimilar-material or adhesive-interface examples: **[3,16,28]**;
- related cornered structural geometries, if retained: **[44]**;
- gravity dams only after a more direct interface-corner source is found, or with a much broader motivation sentence: **[7]**.

---

## 2. Wedge contact / wedge indentation: historical block

Current author logic: the subject “starts with Galin [17]” and is developed in **[2,6,18,48]**.

### [17] Galin (1947), *Давление штампа с плоским основанием в виде бесконечного клина на упругое полупространство*

- **Bibliographic verification:** the original 1947 Soviet journal index confirms the record: *Doklady Akademii Nauk SSSR*, new series, **58(2), 205–208**.
- **Important geometry point:** this is a three-dimensional half-space contact problem for a stamp whose **planform/contact domain is wedge-shaped**.
- **Decision:** **KEEP**, but remove the author’s parenthetical “(або Galin, Contact Problems, 2008...)”. A final bibliography cannot contain alternative sources in one entry. The 1947 primary source is preferable for a historical-priority statement; the 2008 Springer book may be cited separately only if needed.

### [2] Aleksandrov & Babeshko (1972), wedge-shaped stamp

- **Support:** direct continuation of the Galin/Rvachev wedge-*planform* stamp problem.
- **Decision:** **KEEP** in the Galin line.
- **FIX METADATA:** the Russian PMM pagination is 88–93, while the English *Journal of Applied Mathematics and Mechanics* translation is **36, 78–83 (1972)**. Do not combine an English journal title with the Russian pagination.

### [6] Brock (1979), frictionless indentation by a rigid wedge

- **Support:** direct analytical work on a **two-dimensional wedge indenter/profile** acting on an elastic half-plane; specifically addresses tangential-displacement effects and apex/contact singularities.
- **Decision:** **KEEP**, but it belongs to a different geometric lineage than [17,2].

### [18] Georgiadis (1998), wedge indentation of an elastic half-space

- **Support:** strong for the two-dimensional rigid-wedge indentation/contact problem and tangential-displacement effects.
- **Decision:** **KEEP**, with [6] rather than as a direct continuation of the wedge-planform Galin problem.

### [48] Zisis et al. (2014), couple-stress contact problems

- **Support:** relevant modern extension: flat, cylindrical and shallow wedge indenters in couple-stress elasticity.
- **Decision:** **KEEP / OPTIONAL**. Useful only if the purpose is to show modern extensions of wedge indentation; it is not needed for the central fracture argument.

### Major audit finding: two geometries are currently conflated

The present Introduction treats [17,2,6,18,48] as one uninterrupted wedge-indentation line, but they comprise at least two different contact geometries:

1. **wedge-shaped planform/contact domain on a 3D half-space:** [17,2];
2. **2D wedge indenter/profile pressed into a half-plane:** [6,18,48].

This distinction is scientifically important and has been added as **AQ-INTRO-02**.

---

## 3. Interface-corner singularity literature

Current author cluster: **[5,8,11,12,32,35,43,45,46,47]**.

### [5] Bogy & Wang (1971)

- **Support:** foundational and exact for bonded dissimilar isotropic elastic wedges/interface corners; directly studies the singularity order versus material constants and corner angle.
- **Decision:** **KEEP (foundational)**.

### [8] Chen & Labuz (2006), *Indentation of rock by wedge-shaped tools*

- **Support:** experimental wedge indentation, damage-zone size and tensile-fracture initiation in rock.
- **Problem:** it is **not** a paper on a bimaterial interface-corner singular field.
- **Decision:** **MOVE** to the wedge damage/fracture paragraph. This is the clearest citation-placement error in the current Introduction.

### [11] Chue, Chen & Lee (2002)

- **Support:** strong analytical singularity work for a junction of two **anisotropic** materials.
- **Decision:** **KEEP / QUALIFY** as an anisotropic extension, not as an exact match to the present isotropic plane problem.

### [12] Dempsey & Sinclair (1981)

- **Support:** foundational general analysis of singular behavior at a bi-material wedge vertex.
- **Decision:** **KEEP (foundational)**.

### [32] Liu, Xu & Ding (1999)

- **Support:** axisymmetric three-dimensional isotropic interface-corner singularity; the singularity order is related to the corresponding plane-strain problem.
- **Decision:** **KEEP / QUALIFY** as a 3D axisymmetric extension.

### [35] Mohammed & Liechti (2001), *The effect of corner angles in bimaterial structures*

- **Support:** very strong. Studies elastic/plastic bimaterial corners and joints, including lap and scarf joints, singularity and stress-intensity variation with corner angle.
- **Decision:** **KEEP (key source)**.

### [43] Shin, Kim & Lee (2007)

- **Support:** strong for anisotropic/isotropic bimaterial interface corners; computes asymptotic singular fields and stress intensities and connects them to failure design.
- **Decision:** **KEEP / QUALIFY** as an anisotropic/isotropic extension.

### [45] van Vroonhoven (1992)

- **Support:** strong for stress singularities in bimaterial wedges with adhesion/delamination and the relation to cracking.
- **Decision:** **KEEP**.
- **FIX METADATA:** surname should be **van Vroonhoven, J. C. W.**, not simply “Vroonhoven” if the current entry omits the prefix; year is 1992, vol. 15(2), 159–171.

### [46] Wang (2005)

- **Support:** strong methodological paper on singular behavior of bimaterial wedges and junctions under in-plane loading.
- **Decision:** **KEEP**.

### [47] Yang & Munz (1995)

- **Support:** strong for dissimilar-material joints with an internal interface corner under mechanical and thermal loading, including stress exponents and stress-intensity factors.
- **Decision:** **KEEP**.
- **FIX METADATA:** normalize DOI as `10.1016/0045-7949(94)00622-A` (ASCII hyphens).

### Recommended architecture for the singularity paragraph

Do not cite all nine valid papers as though they solve one identical problem. Split them conceptually:

- **foundational 2D isotropic / general bimaterial wedge-corner singularity:** [5,12,35,45,46,47];
- **anisotropic and 3D extensions:** [11,32,43].

Remove [8] from this cluster.

---

## 4. General process-zone bridge

Current author logic: process-zone methods are reviewed in [26] and have been successfully applied to homogeneous bodies and planar-interface cracks in **[22,23,33,34,41,42]**.

### [26] Kaminsky & Dudyk, review

- **Support:** appropriate review source for analytical process/prefracture-zone modeling at interface cracks.
- **Decision:** **KEEP**.
- **Metadata:** DOI verified. The English translation is *International Applied Mechanics* 59, 505–539 (2023); source records disagree on issue 4 vs 5, while the original *Applied Mechanics* issue is 59(5). Final BibTeX should use the publisher/Crossref record rather than ResearchGate metadata.

### [22] Kaminsky et al. (2023), IJSS 267, 112117

- **Support:** very strong; process zone associated with kinking from an interface crack, with length/orientation, dissipation and opening derived analytically.
- **Decision:** **KEEP**.

### [23] Kaminsky, Dudyk & Chornoivan (2025)

- **Support:** very strong for a small-scale process zone at an interface crack in a quasi-brittle bonding material.
- **Decision:** **KEEP**.

### [33] Loboda & Sheveleva (2003)

- **Support:** strong independent literature; exact analytical prefracture-zone model for a crack between two orthotropic materials.
- **Decision:** **KEEP (important non-self citation)**.

### [34] Loboda et al. (2019)

- **Support:** strong for an interface crack between orthotropic materials with a shear-yield zone at the crack tip.
- **Decision:** **KEEP**.
- **Metadata note:** final transliteration of the third author (`Khodanen`) should be checked against the article record.

### [41] Selivanov (2019)

- **Support:** strong for cohesive/failure-zone modeling of a Mode-I crack in a homogeneous infinite plate; not an interface crack.
- **Decision:** **KEEP**, but attach it specifically to the **homogeneous-crack** part of the sentence.

### [42] Selivanov & Chornoivan (2018)

- **Support:** strong for a semi-analytical cohesive-fracture methodology in a homogeneous Mode-I infinite plane.
- **Decision:** **KEEP**, again as a homogeneous cohesive-zone example.

### Editorial consequence

The current sentence should be split. It presently makes [41,42] look like planar-interface studies and [22–34] like homogeneous studies. A more accurate structure is:

- homogeneous cohesive/failure-zone formulations: **[41,42]**;
- process/prefracture zones at or near planar bimaterial interfaces: **[22,23,33,34]**;
- then transition to the harder nonsmooth-interface/corner setting.

---

## 5. Process zones and crack development at a corner

### [13] Dudyk & Dikhtyarenko (2015), “Trident” model

- **Support:** strong for a small-scale plastic/process zone at a nonsmooth interface corner in the presence of a Mode-I crack originating from the corner.
- **Decision:** **KEEP**.

### [21] Kaminsky et al. (2010)

- **Support:** strong for a prefracture zone at the tip of a Mode-I crack reaching a nonsmooth interface.
- **Decision:** **KEEP**.

### [14] Dudyk & Dikhtyarenko (2012)

- **Support:** very strong for initial kinking/process-zone development from an interface crack whose origin is an angular interface point; orientation, length, opening and a deformation criterion are considered.
- **Decision:** **KEEP**.

### [15] Dudyk, Dikhtyarenko & Dyakon (2014)

- **Support:** very strong for a process zone developing from the tip of an interface crack coinciding with the corner point and for the role of joining-material plasticity.
- **Decision:** **KEEP**.

### [24] Kaminsky, Kipnis & Polishchuk (2012)

- **Support:** very strong for direct formation of an initial fracture process zone at a V-shaped interface corner.
- **Decision:** **KEEP**.

### [25] Kaminsky, Kipnis & Polishchuk (2018)

- **Support:** relevant for the stress state near a small-scale Mode-I crack at the interface corner.
- **Decision:** **KEEP / QUALIFY**. It is a crack-at-corner stress-state paper, not identical to a direct process-zone nucleation model.
- **Metadata:** use 54(5), 506–518; institutional publication lists support issue 5.

### [37] Nazarenko & Kipnis (2022), interface shear cracks near the angular point

- **Support:** exact problem family immediately preceding the present work; analytical solution and corner stress behavior for small-scale interface shear cracks.
- **Decision:** **KEEP (essential predecessor)**.
- **FIX METADATA:** the paper itself is **Journal of Mathematical Sciences 261(1), 151–161 (2022)**. Some secondary databases incorrectly display issue 6.

### [38] Nazarenko & Kipnis, limiting equilibrium

- **Support:** essential predecessor. Establishes stress concentration, crack-growth condition and equilibrium stability for shear cracks at the corner.
- **Decision:** **KEEP (essential predecessor)**.
- **FIX METADATA:** *International Applied Mechanics* **58(5), 497–509 (2022)**; the DOI was assigned/published online in 2023, which can produce an incorrect year in secondary databases.

---

## 6. Wedge indentation: damage, plasticity and fracture

Current author cluster: **[1,8,20,29,30,31,40]**.

This cluster is relevant as an *analogy*, but the individual papers do not all make the same scientific contribution.

### [1] Alehossein, Detournay & Huang (2000)

- **Support:** analytical model for indentation by blunt tools, including blunt wedges/cones and a damaged/plastic region.
- **Decision:** **KEEP / MOVE** to a contact-and-damage sentence; do not cite it as a crack-initiation model by itself.

### [8] Chen & Labuz (2006)

- **Support:** excellent bridge from wedge indentation to fracture: measures damage-zone size and investigates initiation of tensile fracture at the intact-rock/damaged-rock boundary.
- **Decision:** **KEEP (strong)** here; **MOVE OUT** of the interface-corner singularity cluster.

### [20] Huang, Damjanac & Detournay (1998)

- **Support:** strong for wedge indentation, plastic-zone development and initiation of tensile fractures under lateral confinement.
- **Decision:** **KEEP (strong)**.

### [29] Lawn & Evans (1977)

- **Support:** foundational crack-initiation model under sharp elastic/plastic indentation fields.
- **Decision:** **KEEP (foundational fracture source)**.

### [30] Lawn & Wilshaw (1975)

- **Support:** foundational review of indentation fracture principles and applications.
- **Decision:** **KEEP**.

### [31] Liu et al. (2007)

- **Support:** wedge-indentation-driven interface delamination/buckling in thin-film systems with a traction–separation law.
- **Decision:** **KEEP / QUALIFY** as an adjacent example of wedge-induced *interface fracture*, not as the same mechanical geometry as the present paper.

### [40] Papanastasiou, Durban & Lenoach (2003)

- **Support:** singular plastic fields under wedge indentation in pressure-sensitive solids.
- **Decision:** **KEEP / MOVE** to the plastic/contact-field sentence; it does not itself establish a crack-initiation criterion.
- **FIX METADATA:** `40(10), 2521–2534`, not the malformed `40(10.` currently present in the Word bibliography.

### Recommended architecture for this paragraph

Split the literature into three levels:

1. elastic/plastic wedge-contact and damage-zone mechanics: **[1,20,40]** (plus [6,18,48] if the earlier contact paragraph is retained);
2. fracture initiation under indentation: **[8,29,30]**;
3. wedge-induced interface delamination in another geometry: **[31]**.

Then make explicit that this is an **adjacent physical/methodological analogy**, not the direct research lineage of the present bimaterial-corner/shear-crack problem.

---

## 7. Research gap and immediate predecessors [37,38]

The revised manuscript’s narrower gap statement is supportable:

- [37] analyzes the singular stress behavior produced by interface shear cracks near the angular point;
- [38] derives the crack-growth condition and analyzes equilibrium stability;
- neither abstract or stated scope treats the **post-instability branching mechanism into one of the materials** developed in the present work.

### Decision

**KEEP the narrow gap.**

Avoid the old broad wording that branching from such corners is “practically unexplored” until the independent literature sweep is completed. The safe formulation is tied specifically to what [37,38] do and do not address.

---

## 8. Reference-by-reference action matrix

| Ref. | Short description | Current support | Action |
|---:|---|---|---|
| 1 | Alehossein et al. 2000 | wedge contact/damage | KEEP, MOVE within wedge block |
| 2 | Aleksandrov & Babeshko 1972 | wedge-planform stamp | KEEP; FIX English pagination |
| 3 | Barbosa et al. 2018 | stepped/scarf adhesive joints | KEEP |
| 5 | Bogy & Wang 1971 | isotropic bimaterial corner singularity | KEEP, foundational |
| 6 | Brock 1979 | 2D rigid-wedge indentation | KEEP, separate geometry from [17,2] |
| 7 | Chandra Kishen 2005 | gravity-dam fracture mechanics | WEAK for broken bimaterial interface; REPLACE/QUALIFY |
| 8 | Chen & Labuz 2006 | wedge indentation + tensile fracture | MOVE from singularity cluster; KEEP in fracture block |
| 11 | Chue et al. 2002 | anisotropic bimaterial junction | KEEP/QUALIFY |
| 12 | Dempsey & Sinclair 1981 | bimaterial wedge singularity | KEEP, foundational |
| 13 | Dudyk & Dikhtyarenko 2015 | process zone at nonsmooth corner with Mode-I crack | KEEP |
| 14 | Dudyk & Dikhtyarenko 2012 | initial kinking at angular interface point | KEEP |
| 15 | Dudyk et al. 2014 | plasticity and interface-crack kink | KEEP |
| 16 | Gacoin et al. 2009 | geometry-created singularity/damage in double scarf joint | KEEP, key practical source |
| 17 | Galin 1947 | wedge-planform stamp on half-space | KEEP; remove “or book” alternative |
| 18 | Georgiadis 1998 | 2D wedge indentation | KEEP |
| 20 | Huang et al. 1998 | plastic zone + tensile-fracture initiation under wedge | KEEP |
| 21 | Kaminsky et al. 2010 | prefracture zone at crack reaching nonsmooth interface | KEEP |
| 22 | Kaminsky et al. 2023 | interface-crack kinking process zone | KEEP |
| 23 | Kaminsky et al. 2025 | process zone at interface crack | KEEP |
| 24 | Kaminsky et al. 2012 | initial process zone at V-interface corner | KEEP |
| 25 | Kaminsky et al. 2018 | small-scale crack at interface corner | KEEP/QUALIFY |
| 26 | Kaminsky & Dudyk review | analytical process-zone methods | KEEP; normalize issue metadata |
| 28 | Kimiaeifar et al. 2012 | scarf joint / geometric reliability | KEEP/QUALIFY |
| 29 | Lawn & Evans 1977 | indentation crack initiation | KEEP, foundational |
| 30 | Lawn & Wilshaw 1975 | indentation fracture review | KEEP |
| 31 | Liu et al. 2007 | wedge-induced thin-film interface delamination | KEEP/QUALIFY |
| 32 | Liu et al. 1999 | 3D axisymmetric interface corner | KEEP/QUALIFY |
| 33 | Loboda & Sheveleva 2003 | interface prefracture zone, orthotropic | KEEP |
| 34 | Loboda et al. 2019 | interface crack + shear-yield zone | KEEP; verify transliteration |
| 35 | Mohammed & Liechti 2001 | corner-angle effects in bimaterial joints | KEEP, key source |
| 37 | Nazarenko & Kipnis 2022 | shear cracks / corner stress field | KEEP, essential; FIX issue 261(1) |
| 38 | Nazarenko & Kipnis 2022 | limiting equilibrium / stability | KEEP, essential; FIX year 2022 |
| 40 | Papanastasiou et al. 2003 | singular plastic wedge-indentation field | KEEP/MOVE; FIX `40(10)` |
| 41 | Selivanov 2019 | homogeneous cohesive/failure-zone crack | KEEP, homogeneous-method block |
| 42 | Selivanov & Chornoivan 2018 | homogeneous cohesive fracture | KEEP, homogeneous-method block |
| 43 | Shin et al. 2007 | anisotropic/isotropic interface corner | KEEP/QUALIFY |
| 44 | Tannert et al. 2011 | wood-to-wood dovetail connection | KEEP only as related corner geometry |
| 45 | van Vroonhoven 1992 | bimaterial wedge singularity / delamination | KEEP; FIX surname/year metadata |
| 46 | Wang 2005 | bimaterial wedge/junction singularity method | KEEP |
| 47 | Yang & Munz 1995 | interface-corner singular fields/SIF | KEEP; normalize DOI |
| 48 | Zisis et al. 2014 | couple-stress wedge contact | KEEP OPTIONAL |

---

## 9. Two new Author Queries generated by the audit

### AQ-INTRO-01 — already open

Clarify whether wedge indentation is intended as a physical/methodological analogy or as the direct lineage of the present work. Editorial preference remains **analogy**.

### AQ-INTRO-02 — geometry of the wedge-contact literature

The new Introduction currently combines Galin/Aleksandrov [17,2], where the stamp/contact region is wedge-shaped **in plan on a three-dimensional half-space**, with Brock/Georgiadis/Zisis [6,18,48], which treat a **two-dimensional wedge indenter/profile**. These are not the same contact geometry. Ask whether the author intentionally wants both lines; editorial preference is either to separate them explicitly or retain only the sub-line needed for the analogy.

---

## 10. High-priority omitted literature found during verification

These papers are **not silently inserted yet**; they are candidates for the independent literature sweep. They are important because they bear directly on the claim that fracture initiation at bimaterial corners is much less studied than the singular field.

1. **Mohammed, I.; Liechti, K. M. (2000). “Cohesive zone modeling of crack nucleation at bimaterial corners.” Journal of the Mechanics and Physics of Solids 48(4), 735–764. DOI 10.1016/S0022-5096(99)00052-6.**
   - Directly studies crack nucleation from bimaterial corners over a range of corner angles with a cohesive-zone model and experiments.
   - This is a **must-assess / likely must-cite** paper for our Introduction.

2. **Akisanya, A. R.; Meng, C. S. (2003). “Initiation of fracture at the interface corner of bi-material joints.” Journal of the Mechanics and Physics of Solids 51(1), 27–46. DOI 10.1016/S0022-5096(02)00076-5.**
   - Directly addresses fracture initiation criteria at a bimaterial interface corner and limitations of an interface-corner intensity parameter in an elastic–plastic joint.
   - Also a high-priority candidate for the sweep.

These two papers mean that the final gap statement must distinguish **crack nucleation from an intact bimaterial corner** from the much more specific mechanism studied here: **post-instability branching of an already existing contacting interface shear crack through a small-scale Mode-I process zone at a broken interface corner**.

---

## 11. Proposed citation architecture before rewriting the Introduction

A scientifically cleaner Introduction can be built in five steps:

1. **Engineering motivation:** broken/cornered adhesive joints — [3,16,28]; add other applications only if directly supported.
2. **Elastic singular-field foundation:** [5,12,35,45,46,47], followed by anisotropic/3D extensions [11,32,43].
3. **From singularity to fracture/process-zone modeling:** homogeneous methods [41,42], planar/interface zones [22,23,33,34], then corner/crack configurations [13–15,21,24,25].
4. **Adjacent wedge-indentation analogy:** split wedge-planform contact [17,2], 2D wedge indentation [6,18,48], and indentation damage/fracture [1,8,20,29–31,40]; keep this block short unless the author gives it a specific methodological role.
5. **Exact research gap:** immediate shear-crack predecessors [37,38] → they stop at stress field / growth / stability → present paper models the initial post-instability branching process zone and its fracture-driving parameters.

The final Introduction should be rewritten only after the independent literature sweep, because at least two major omitted papers already emerged during this audit.
