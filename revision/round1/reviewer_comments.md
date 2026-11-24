# Reviewer comments — Round 1

Status: reviews received; editor decision not yet recorded here.

## Reviewer 1

> This paper has established an analytical model to predict the conditions under which an existing interfacial shear crack, located at the corner of a kinked interface between two elastic materials, will initiate a branched crack from the corner into the interior of one of the materials. Overall, the derivations are rigorous and coherent, and this paper merits publication in IJF. My main concern, however, is that the logical flow of the reasoning is somewhat abrupt at several points, which makes the derivation difficult to follow. I therefore recommend that the authors revise the manuscript accordingly. My detailed comments are as follows:

### R1.1 — Eq. (1)

The first line already states that `tau_rtheta = 0` for `theta in {0,pi}`, and it is unclear why this same condition appears again in the second line. Secondly, I cannot see the distinction between `[[tau_rtheta]]=0` and `tau_rtheta=0` at `theta=alpha`: since the former appears to imply the latter directly, a clarification of the physical or mathematical difference between them would be appreciated. Moreover, as the authors attribute Eq. (1) to the symmetry, traction continuity, and frictionless contact conditions, a step-by-step explanation of how each of these conditions enters the derivation would help readers follow the analysis.

### R1.2 — Eq. (2)

Although I can roughly grasp the physical meaning of Eq. (2), its current version presentation reads rather awkwardly and should be rewritten for clarity.

### R1.3 — Eqs. (3) and (4)

The rationale behind the decay rate `o(r^-1)` in Eq. (3), as well as that behind the regularity condition `k_i=0`, deserves one explicit sentence each. Firstly, the decay rate appearing in the matching condition is not an intrinsic property of the outer field; rather, it is precisely the condition under which `Phi_i^+(p)` remains analytic in the half-plane `Re(p)<0`, which is what Section 3 requires. Stating this connection explicitly would render the approximation transparent rather than implicit. Likewise, in Section 2.3 the condition `k_i=0` is in fact the solvability condition of a free-boundary problem; making this counting argument explicit would considerably clarify why Eq. (7) follows. Finally, a sentence noting that Eq. (4) is the standard homogeneous-medium tip asymptotic would help readers who wonder where the bimaterial character of the problem has gone.

### R1.4 — Sections 3.1–3.2

Two connecting steps of the Wiener–Hopf construction are worth displaying explicitly, and the object being factorized should be clearly identified. Firstly, the clause “Eliminating the transforms of the interior field yields the functional equation” compresses the entire derivation of Eq. (5); a compact sketch of this step, or its relocation to an appendix, would allow the reader to follow the argument rather than reconstruct it, and would document how the determinants of Appendix A are generated. Secondly, a direct inspection of the determinants shows that the kernel `G_i(p)` has poles at `p=+-1` and at `p=-1-lambda`, together with a removable point at `p=0`; yet Eqs. (6)–(11) evaluate the factors precisely at these points. Presumably, the trivial singular factors are removed and carried explicitly in the solution, and it is the regularized kernel that is actually factorized; stating this explicitly would remove the only remaining ambiguity in the construction. In the same spirit, the gamma-factor identity and a three-line sketch of the Liouville argument would make Section 3.2 self-contained.

### R1.5 — Section 3.4

Displaying the evaluation of `Phi_i^-(p)` at `p=0` and `p=1` would allow the reader to verify Eqs. (9)–(11) directly. The passage from (6)–(7) to (9)–(10) involves several implicit steps that are worth writing out. When reconstructing these steps, I obtain an expression for `delta_i` in which `G_i(0)` appears in the numerator rather than the denominator of Eq. (9); I attribute this discrepancy to the convention for the factors at the removable points discussed in my previous comments, and an explicit intermediate step would settle this placement unambiguously.

### R1.6 — Section 4

The numerical analysis supports the claimed trends, but the two physical selection mechanisms and the single-zone admissibility statement remain unverified. Firstly, the statement that the admissibility conditions `Cg_2<0` and `CQ_i>0` “can hold simultaneously for only one of the two materials” is explicitly restricted to “the parameter sets examined below”; since the entire branching-direction prediction of the paper rests on this exclusivity, it should either be proven for the full admissible parameter space or explicitly downgraded to a numerical observation with its scope clearly stated. Secondly, the paper identifies a competing initiation mechanism but does not compare the critical load levels of the two mechanisms; a quantitative comparison is required.

## Reviewer 2

> The work is devoted to investigation the local process zone near the corner of a V-shaped interfacial shear crack and on using its characteristics to predict branching initiation into one of the materials. Under the small-scale approximation, the zone length in material is assumed to be much smaller than the crack-branch length. It is determined which material can contain a physically admissible zone. Mellin transformation, asymptotic matching, and the Wiener–Hopf method are used to determine closed analytical relations for the physical-admissibility conditions, equilibrium zone length and opening, work done against resistance to separation, zone-related energy parameter, and exponent of the residual corner singularity. The opening and energy parameter are used in deformation and energy criteria, respectively, for initiation of the branched crack.
>
> The manuscript is well written, presents new interesting results that may be useful to the scientific community, and can be recommended for publication.
