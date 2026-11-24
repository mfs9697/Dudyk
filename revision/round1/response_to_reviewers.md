# Response to the Reviewers

We thank both reviewers for their careful reading of the manuscript and for
their constructive comments. Reviewer 1 identified several places where the
analytical reasoning was too compressed. Independent reconstruction confirmed
the submitted analytical expressions. We have therefore expanded the intermediate steps,
clarified the Wiener--Hopf factorization convention, strengthened the
discussion of physical admissibility, and added a quantitative comparison of
the two competing fracture mechanisms. Reviewer 2 recommended publication
without requesting specific changes.

**Equation numbering.** Numbers in the quoted comments refer to the original
submission. The new intermediate equations shift the numbering in the revised
manuscript: original Eqs. (1)–(5) retain their numbers; original Eqs. (6)–(11)
correspond, respectively, to revised Eqs. (9), (10), (11), (15), (16), and (17).
The responses below identify the revised equation numbers where appropriate.

## Reviewer 1

> This paper has established an analytical model to predict the conditions
> under which an existing interfacial shear crack, located at the corner of a
> kinked interface between two elastic materials, will initiate a branched
> crack from the corner into the interior of one of the materials. Overall,
> the derivations are rigorous and coherent, and this paper merits publication
> in IJF. My main concern, however, is that the logical flow of the reasoning
> is somewhat abrupt at several points, which makes the derivation difficult
> to follow. I therefore recommend that the authors revise the manuscript
> accordingly.

We thank the reviewer for this positive assessment and for identifying the
places where additional intermediate steps would make the derivation easier
to follow. The manuscript has been revised throughout Sections 2--5 in
response to the detailed comments below.

### Comment 1 — Eq. (1)

> The first line already states that \(\tau_{r\theta}=0\) for
> \(\theta\in\{0,\pi\}\), and it is unclear why this same condition appears
> again in the second line. Secondly, I cannot see the distinction between
> \(\llbracket\tau_{r\theta}\rrbracket=0\) and
> \(\tau_{r\theta}=0\) at \(\theta=\alpha\): since the former appears to imply
> the latter directly, a clarification of the physical or mathematical
> difference between them would be appreciated. Moreover, as the authors
> attribute Eq. (1) to the symmetry, traction continuity, and frictionless
> contact conditions, a step-by-step explanation of how each of these
> conditions enters the derivation would help readers follow the analysis.

**Response.** We agree that the original presentation compressed three
physically distinct conditions into one line. Revised Eq. (1) now separates

1. symmetry on \(\theta=0,\pi\), which gives
   \(\tau_{r\theta}=0\);
2. traction continuity across \(\theta=\alpha\), which gives
   \(\llbracket\sigma_\theta\rrbracket=0\) and
   \(\llbracket\tau_{r\theta}\rrbracket=0\);
3. frictionless closed contact on the existing interfacial crack, which gives
   the common tangential traction \(\tau_{r\theta}=0\) and
   \(\llbracket u_\theta\rrbracket=0\).

We have also stated explicitly that
\(\llbracket\tau_{r\theta}\rrbracket=0\) expresses equality of the two
limiting tangential tractions; it does not set their common value to zero.
The latter follows separately from the frictionless-contact condition.

**Revision.** Section 2.2, Eq. (1), and the paragraph immediately following
it.

### Comment 2 — Eq. (2)

> Although I can roughly grasp the physical meaning of Eq. (2), its current
> version presentation reads rather awkwardly and should be rewritten for
> clarity.

**Response.** We agree. Equation (2) has been rewritten as a piecewise
condition on the active bisector. The revised text now states explicitly that
the process-zone segment \(0<r<d_i\) is traction-controlled, that the
continuation \(r>d_i\) remains closed by symmetry, and that the opposite
material bisector remains a symmetry line for all \(r>0\).

**Revision.** Section 2.2, Eq. (2), and its introductory and explanatory text.

### Comment 3 — Eqs. (3) and (4)

> The rationale behind the decay rate \(o(r^{-1})\) in Eq. (3), as well as
> that behind the regularity condition \(k_i=0\), deserves one explicit
> sentence each. Firstly, the decay rate appearing in the matching condition
> is not an intrinsic property of the outer field; rather, it is precisely
> the condition under which \(\Phi_i^+(p)\) remains analytic in the half-plane
> \(\operatorname{Re}p<0\), which is what Section 3 requires. Stating this
> connection explicitly would render the approximation transparent rather
> than implicit. Likewise, in Section 2.3 the condition \(k_i=0\) is in fact
> the solvability condition of a free-boundary problem; making this counting
> argument explicit would considerably clarify why Eq. (7) follows. Finally,
> a sentence noting that Eq. (4) is the standard homogeneous-medium tip
> asymptotic would help readers who wonder where the bimaterial character of
> the problem has gone.

**Response.** We agree and have made all three points explicit.

First, the revised text states that the \(o(r^{-1})\) remainder is an adopted
decay condition on the correction field after the leading outer singular term
has been retained. Its role is to ensure analyticity of the exterior Mellin
transform for \(\operatorname{Re}p<0\). We also note that this condition is
sufficient rather than mathematically minimal: the weaker bound
\(O(r^{-1})\) would already suffice in the open left half-plane.

Second, we now explain why Eq. (4) has the standard homogeneous Mode-I
square-root form. The process-zone tip \(r=d_i>0\) lies locally inside
material \(i\) and away from the bimaterial corner, so its leading asymptotic
field is that of a homogeneous material.

Third, the revised manuscript identifies \(d_i\) explicitly as the unknown
endpoint of a one-parameter free-boundary problem. For a prescribed endpoint,
the transformed solution generally yields a nonzero local stress-intensity
factor \(k_i\). The regularity condition \(k_i=0\) supplies the scalar
solvability condition that determines the equilibrium value of \(d_i\).

We have also clarified the signed displacement trace used in the transform:
the displacement-gradient transform is evaluated in the opening-positive
direction.

**Revision.** Sections 2.1--2.3 and the definition of \(\Phi_i^-\) in
Section 3.1.

### Comment 4 — Sections 3.1–3.2

> Two connecting steps of the Wiener–Hopf construction are worth displaying
> explicitly, and the object being factorized should be clearly identified.
> Firstly, the clause “Eliminating the transforms of the interior field yields
> the functional equation” compresses the entire derivation of Eq. (5); a
> compact sketch of this step, or its relocation to an appendix, would allow
> the reader to follow the argument rather than reconstruct it, and would
> document how the determinants of Appendix A are generated. Secondly, a
> direct inspection of the determinants shows that the kernel \(G_i(p)\) has
> poles at \(p=\pm1\) and at \(p=-1-\lambda\), together with a removable point
> at \(p=0\); yet Eqs. (6)–(11) evaluate the factors precisely at these
> points. Presumably, the trivial singular factors are removed and carried
> explicitly in the solution, and it is the regularized kernel that is
> actually factorized; stating this explicitly would remove the only
> remaining ambiguity in the construction. In the same spirit, the
> gamma-factor identity and a three-line sketch of the Liouville argument
> would make Section 3.2 self-contained.

**Response.** We agree that these intermediate steps should be visible.

The revised Section 3.1 now gives a compact derivation of Eq. (5). For a
Mellin component, the Airy stress function is written in the form
\(r^{1-p}f(\theta)\), with angular modes of frequencies \(1-p\) and \(1+p\).
Applying zero shear traction at the sector bisectors, together with the
interface displacement and traction conditions, and eliminating the
interface amplitudes gives

\[
T_i(p)=-\frac{D_i(p)}{D(p)}\Phi_i^-(p).
\]

Combining this relation with
\(D_i/D=\tan(\pi p)G_i\) and the transformed prescribed traction on the
active segment gives Eq. (5).

Section 3.2 now states explicitly that the Cauchy factorization is applied to
the positive zero-index boundary symbol \(G_i(it)\) on the imaginary axis.
For the upward contour, the Plemelj relation gives the ratio convention

\[
G_i(it)=\frac{G_i^+(it)}{G_i^-(it)}.
\]

For the even kernel,
\(G_i^-(p)=1/G_i^+(-p)\) at corresponding points of the two half-planes.
The off-contour poles of the meromorphic continuation therefore do not make
the assigned Cauchy plus factor singular at \(-1\) or \(-1-\lambda\).

We have also added the gamma-function identity

\[
K^+(p)K^-(p)=p\cot(\pi p)
\]

and displayed the pole-subtracted left/right split used before applying
Liouville's theorem. These additions make the passage from Eq. (5) to revised Eq. (9)
(original Eq. (6)) explicit.

An independent reconstruction of the transformed two-sector problem and the
factorization confirmed that original Eqs. (5) and (6) are correct as
submitted; the revision therefore adds the missing derivational steps without
changing those equations (now Eqs. (5) and (9)).

**Revision.** Sections 3.1 and 3.2, including revised Eqs. (5)–(9).

### Comment 5 — Section 3.4

> Displaying the evaluation of \(\Phi_i^-(p)\) at \(p=0\) and \(p=1\) would
> allow the reader to verify Eqs. (9)–(11) directly. The passage from (6)–(7)
> to (9)–(10) involves several implicit steps that are worth writing out.
> When reconstructing these steps, I obtain an expression for \(\delta_i\) in
> which \(G_i(0)\) appears in the numerator rather than the denominator of
> Eq. (9); I attribute this discrepancy to the convention for the factors at
> the removable points discussed in my previous comments, and an explicit
> intermediate step would settle this placement unambiguously.

**Response.** We thank the reviewer for identifying this ambiguity. We
independently rederived the two transform moments. Original Eq. (9), now Eq. (15), is correct as
submitted, but the factorization convention was not stated explicitly enough
to make the placement of \(G_i(0)\) transparent.

After imposing \(k_i=0\), define

\[
A_i=\frac{\sigma_iK^+(-1)}{G_i^+(-1)}.
\]

Revised Eq. (9) (original Eq. (6)) then reduces to

\[
\Phi_i^-(p)=
\frac{\lambda A_iK^-(p)G_i^-(p)}
{(p+1)(p+1+\lambda)}.
\]

With the ratio convention established in revised Section 3.2,

\[
G_i^-(0)=\frac{1}{\sqrt{G_i(0)}},
\qquad
K^-(0)=\frac{1}{\sqrt{\pi}},
\]

and therefore

\[
\Phi_i^-(0)=
\frac{\sigma_i\lambda K^+(-1)}
{(1+\lambda)G_i^+(-1)\sqrt{\pi G_i(0)}}.
\]

Thus \(\sqrt{G_i(0)}\) belongs in the denominator of revised Eq. (15) (original Eq. (9)).

Similarly,

\[
K^-(1)=K^+(-1)=\frac{2}{\sqrt{\pi}},
\qquad
G_i^-(1)=\frac{1}{G_i^+(-1)},
\]

which gives

\[
\Phi_i^-(1)=
\frac{2\lambda\sigma_i}
{\pi(\lambda+2)[G_i^+(-1)]^2}.
\]

This directly recovers the work and energy coefficients in revised Eq. (16)
(original Eq. (10)).

As an independent numerical check for
\(E_1/E_2=0.5\), \(\nu_1=\nu_2=0.3\),
\(\alpha=45^\circ\), and \(\sigma'=-0.5\), we obtained

\[
d_1/l=0.147434361719,\qquad
\delta'_1=0.145787032394,\qquad
J'_1=0.083620387223,
\]

in agreement with the existing MATLAB regression results.

**Revision.** Section 3.4, revised Eqs. (12)–(16), and Section 3.5,
revised Eq. (17). No coefficient in original Eqs. (9)–(11) has been changed.

### Comment 6 — Section 4

> The numerical analysis supports the claimed trends, but the two physical
> selection mechanisms and the single-zone admissibility statement remain
> unverified. Firstly, the statement that the admissibility conditions
> \(Cg_2<0\) and \(CQ_i>0\) “can hold simultaneously for only one of the two
> materials” is explicitly restricted to “the parameter sets examined
> below”; since the entire branching-direction prediction of the paper rests
> on this exclusivity, it should either be proven for the full admissible
> parameter space or explicitly downgraded to a numerical observation with
> its scope clearly stated. Secondly, the paper identifies a competing
> initiation mechanism but does not compare the critical load levels of the
> two mechanisms; a quantitative comparison is required.

**Response.** We agree with both points and have revised the manuscript
accordingly.

For the first point, we have not promoted the single-material result to a
general analytical theorem. Instead, we have made its numerical status and
scope explicit and performed a substantially broader verification than in the
submitted version.

From the Appendix-A expression for \(q_i\), the multiplicative factor outside
the numerator function \(S_i\) is common to both candidate materials. Hence

\[
\operatorname{sgn}(Q_1Q_2)
=
\operatorname{sgn}(S_1S_2).
\]

Simultaneous admissibility for a fixed loading sign would require
\(Q_1Q_2>0\), and therefore \(S_1S_2>0\). A deterministic scan of 92,800
nondegenerate cases was then performed over

\[
10^{-3}\le E_1/E_2\le10^3,
\]

using 25 logarithmic modulus-ratio values, eight independently varied
Poisson-ratio values from \(-0.95\) to \(0.49\) for each material, and
\(\alpha=3^\circ,6^\circ,\ldots,177^\circ\), excluding the degenerate
straight-interface limit. No case with \(S_1S_2>0\) was found.

A second seeded random scan of 20,000 additional cases sampled the modulus
ratio log-uniformly over the same range and sampled the Poisson ratios and
angle continuously over

\[
-0.99<\nu_i<0.499,
\qquad
0.2^\circ<\alpha<179.8^\circ.
\]

Again, no simultaneous-admissibility candidate was found. The two sampled
cases closest to \(S_1S_2=0\) were recomputed at 50-digit precision and
retained the negative sign. Material-interchange relations were also checked
independently on 1,000 additional random cases.

Accordingly, the revised manuscript states only that single-material
admissibility is numerically supported over the investigated domain. It does
not claim a global uniqueness theorem, and the two admissibility conditions
continue to be applied independently to both candidate materials.

For the second point, we have added a quantitative critical-load comparison.
In the notation of the present paper, the Nazarenko--Kipnis solution for the
branch-tip Mode-II intensity is

\[
K_{\mathrm{II}}
=
g_1k\,C\,l^{\lambda_0+1/2},
\]

where

\[
k=
\frac{
2\sqrt{2}(1+\kappa_2e)\Gamma(\lambda_0+3/2)
}{
[1+\kappa_1+(1+\kappa_2)e]\,
\Gamma(\lambda_0+2)G^+(-1-\lambda_0)
}.
\]

The corresponding branch-tip threshold is

\[
|C_{\mathrm{tip}}|
=
\frac{K_{\mathrm{IIc}}}
{|g_1k|\,l^{\lambda_0+1/2}}.
\]

The corner-branching threshold obtained from either
\(\delta_i=\delta_{i\mathrm{c}}\) or
\(J_i=J_{i\mathrm{c}}\) is

\[
|C_{\mathrm{corner}}|
=
\sigma_i l^{-\lambda_0}|\sigma'_c|.
\]

Defining the normalized Mode-II resistance

\[
\mathcal R_{\mathrm{II}}
=
\frac{K_{\mathrm{IIc}}}{\sigma_i\sqrt l},
\]

gives

\[
\boxed{
\frac{|C_{\mathrm{corner}}|}{|C_{\mathrm{tip}}|}
=
\frac{|g_1k|\,|\sigma'_c|}
{\mathcal R_{\mathrm{II}}}
}.
\]

Corner branching therefore reaches its threshold first when

\[
|g_1k|\,|\sigma'_c|<\mathcal R_{\mathrm{II}},
\]

whereas interfacial propagation from the branch tips reaches its threshold
first when the inequality is reversed.

For the reference case
\(E_1/E_2=0.5\), \(\nu_1=\nu_2=0.3\), and
\(\alpha=45^\circ\), we obtain

\[
g_1k=-0.6794157816.
\]

With the normalized critical opening

\[
\Delta_1=
\frac{E_1\delta_{1\mathrm{c}}}
{4(1-\nu_1^2)\sigma_1l},
\]

the competition boundary becomes

\[
\mathcal R_{\mathrm{II}}^*
=
1.1064\,\Delta_1^{0.6132}.
\]

Equivalently, defining

\[
\mathcal J_1=
\frac{E_1J_{1\mathrm{c}}}
{4(1-\nu_1^2)\sigma_1^2l},
\]

gives

\[
\mathcal R_{\mathrm{II}}^*
=
1.5558\,\mathcal J_1^{0.6132}.
\]

The two representations identify the same boundary when
\(J_{1\mathrm{c}}=\chi_1\sigma_1\delta_{1\mathrm{c}}\).

No arbitrary fracture-resistance values are required for this comparison.
A unique ordering for a particular material system requires independently
specified values of \(K_{\mathrm{IIc}}\) and either
\(\delta_{i\mathrm{c}}\) or \(J_{i\mathrm{c}}\).

**Revision.** The Introduction and Section 2.1 now relate the
prescribed-stationary-crack assumption explicitly to the a posteriori
critical-load comparison. Section 2.2 scopes the exclusivity statement as a
numerical observation. Section 4 reports the broad admissibility analysis and
its parameter domain. Section 5.2 adds the branch-tip \(K_{\mathrm{II}}\)
formula (revised Eq. (18)), the two critical loads, the dimensionless
competition ratio (revised Eq. (19)), and the
\(45^\circ\) mechanism boundary. The corresponding conclusions have also
been revised.

## Reviewer 2

> The work is devoted to investigation the local process zone near the corner
> of a V-shaped interfacial shear crack and on using its characteristics to
> predict branching initiation into one of the materials. Under the
> small-scale approximation, the zone length in material is assumed to be
> much smaller than the crack-branch length. It is determined which material
> can contain a physically admissible zone. Mellin transformation, asymptotic
> matching, and the Wiener–Hopf method are used to determine closed analytical
> relations for the physical-admissibility conditions, equilibrium zone
> length and opening, work done against resistance to separation,
> zone-related energy parameter, and exponent of the residual corner
> singularity. The opening and energy parameter are used in deformation and
> energy criteria, respectively, for initiation of the branched crack.
>
> The manuscript is well written, presents new interesting results that may be
> useful to the scientific community, and can be recommended for publication.

**Response.** We thank Reviewer 2 for the positive assessment and careful
reading of the manuscript. No specific correction was requested.

