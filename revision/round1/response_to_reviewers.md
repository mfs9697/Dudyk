# Response to the Editor and Reviewers — Round 1

Status: WP3 draft complete for Reviewer 1 comments R1.1--R1.6. All scientific
changes are implemented; final package verification is in progress.

## Response conventions

For every point:
- quote the reviewer comment;
- answer directly and courteously;
- state exactly what was changed;
- identify the section/equation/figure/table affected;
- give numerical or analytical verification where relevant;
- if no change is made, explain why with evidence.

## Editor

### E1

**Comment**

_To be added from the editorial decision letter._

**Response**

_To be drafted after the editor's wording is recorded._

**Change in manuscript**

_None attributed to the editor yet._

## Reviewer 1

We thank Reviewer 1 for the careful reading and for identifying places where
the derivation was too compressed. We have retained the analytical results but
expanded the logical transitions and factorization conventions so that the
calculation can be followed without reconstructing omitted intermediate steps.

### R1.1 — Eq. (1)

**Comment**

> Eq. (1): The first line already states that the shear traction vanishes on
> the sector bisectors, and it is unclear why a zero-shear condition appears
> again on the interface. The distinction between traction continuity and
> zero shear traction at the interface should be clarified, and the roles of
> symmetry, traction continuity, and frictionless contact should be explained
> step by step.

**Response**

We agree that the original presentation compressed three physically distinct
conditions into one line. The revised Eq. (1) now separates:

1. symmetry on \(\theta=0,\pi\), which gives
   \(\tau_{r\theta}=0\);
2. traction continuity across \(\theta=\alpha\), which gives
   \(\llbracket\sigma_\theta\rrbracket=0\) and
   \(\llbracket\tau_{r\theta}\rrbracket=0\);
3. frictionless closed contact on the existing interfacial crack, which gives
   the common tangential traction \(\tau_{r\theta}=0\) and
   \(\llbracket u_\theta\rrbracket=0\).

We also added an explicit explanation that
\(\llbracket\tau_{r\theta}\rrbracket=0\) only states equality of the two
limiting shear tractions; it does not make their common value zero. The latter
follows separately from frictionless contact.

**Change in manuscript**

Section 2.2, Eq. (1) and the paragraph immediately following it.

### R1.2 — Eq. (2)

**Comment**

> Eq. (2): Although the physical meaning can be inferred, the present
> formulation is awkward and should be rewritten for clarity.

**Response**

We agree. Equation (2) has been rewritten as a piecewise condition on the
active bisector. The revised text now states explicitly that the process-zone
segment \(0<r<d_i\) is traction controlled, that the continuation
\(r>d_i\) remains closed by symmetry, and that the opposite material
bisector remains a symmetry line for all \(r>0\).

**Change in manuscript**

Section 2.2, Eq. (2) and its introductory/explanatory text.

### R1.3 — Eqs. (3) and (4)

**Comment**

> The rationale for the \(o(r^{-1})\) decay in Eq. (3), the origin of the
> homogeneous-medium tip asymptotics in Eq. (4), and the role of
> \(k_i=0\) as the solvability condition for the unknown process-zone length
> should be stated explicitly.

**Response**

We agree and have made all three points explicit.

First, the revised text states that the \(o(r^{-1})\) remainder is an adopted
decay condition on the correction field after the leading outer singular term
has been retained. Its role is to ensure that the exterior Mellin transform is
analytic for \(\operatorname{Re}p<0\). We also note that this condition is
sufficient rather than mathematically minimal: \(O(r^{-1})\) would already
suffice in the open left half-plane.

Second, we now explain why Eq. (4) has the standard homogeneous Mode-I
square-root form: the process-zone tip \(r=d_i>0\) lies locally inside one
material and away from the bimaterial corner.

Third, the revised manuscript identifies \(d_i\) explicitly as the unknown
endpoint of a one-parameter free-boundary problem. For a prescribed endpoint,
the transformed solution generally gives a nonzero local stress-intensity
factor \(k_i\). The regularity condition \(k_i=0\) supplies the single scalar
solvability condition that determines the equilibrium \(d_i\).

During the independent WP1 audit we also clarified the signed face trace:
the displacement-gradient transform is evaluated in the opening-positive
direction. With the representative upper-half-plane trace this is
\(u_\theta\) at \(\beta_2=0\) and \(-u_\theta\) at \(\beta_1=\pi\).

**Change in manuscript**

Sections 2.1, 2.2, 2.3, and the definition of \(\Phi_i^-\) in Section 3.1.

### R1.4 — Sections 3.1–3.2

**Comment**

> Two connecting steps of the Wiener--Hopf construction should be shown:
> the elimination leading to Eq. (5), and the factorization/Liouville step
> leading to Eq. (6). The object being factorized, the treatment of the
> apparent poles/removable point, and the gamma-factor identity should also
> be stated explicitly.

**Response**

We agree. We independently reconstructed this part of the derivation before
editing the manuscript.

The revised Section 3.1 now gives a compact derivation of Eq. (5). For a
Mellin component, the Airy function is written as \(r^{1-p}f(\theta)\),
with angular modes of frequencies \(1-p\) and \(1+p\). Applying zero shear at
the sector bisectors and the interface traction/displacement conditions, then
eliminating the interface amplitudes, gives

\[
T_i(p)=-\frac{D_i(p)}{D(p)}\Phi_i^-(p).
\]

Together with \(D_i/D=\tan(\pi p)G_i\) and the transformed prescribed
traction on the active segment, this gives Eq. (5).

Section 3.2 now states explicitly that the Cauchy factorization is applied to
the positive zero-index boundary symbol \(G_i(it)\) on the imaginary axis.
For the upward contour the Plemelj relation gives the ratio convention

\[
G_i(it)=\frac{G_i^+(it)}{G_i^-(it)}.
\]

Evenness implies \(G_i^-(p)=1/G_i^+(-p)\) at corresponding points of the two
half-planes. The off-contour poles of the meromorphic continuation therefore
do not make the assigned Cauchy plus factor singular at \(-1\) or
\(-1-\lambda\).

We also added the gamma-function identity

\[
K^+(p)K^-(p)=p\cot(\pi p)
\]

and an explicit Liouville split using
\(L(p)=K^+(p)/(pG_i^+(p))\). The pole-subtracted left and right expressions
are shown before invoking Liouville's theorem, after which Eq. (6) follows.

**Verification**

The WP1 independent audit reconstructed the two-sector Airy elimination
without using the previous internal formula audit, reproduced the determinant
ratio by direct complex-valued endpoint solves, and independently checked the
factorization numerically. No correction to Eqs. (5) or (6) was required.

**Change in manuscript**

Sections 3.1 and 3.2, immediately before Eqs. (5) and (6).

### R1.5 — Section 3.4

**Comment**

> The evaluations of \(\Phi_i^-\) at \(p=0\) and \(p=1\) should be displayed.
> In the reviewer's reconstruction, \(G_i(0)\) appeared on the opposite side
> of Eq. (9), possibly because of the factorization convention.

**Response**

We thank the reviewer for identifying this ambiguity. We independently
rederived the two moments. Equation (9) is correct as submitted, but the
factorization convention was not sufficiently explicit.

After imposing \(k_i=0\), define

\[
A_i=\frac{\sigma_iK^+(-1)}{G_i^+(-1)}.
\]

Equation (6) then reduces to

\[
\Phi_i^-(p)=
\frac{\lambda A_iK^-(p)G_i^-(p)}
{(p+1)(p+1+\lambda)}.
\]

With the ratio convention established in Section 3.2,

\[
G_i^-(0)=\frac{1}{\sqrt{G_i(0)}},
\]

and \(K^-(0)=1/\sqrt{\pi}\). Hence

\[
\Phi_i^-(0)=
\frac{\sigma_i\lambda K^+(-1)}
{(1+\lambda)G_i^+(-1)\sqrt{\pi G_i(0)}}.
\]

Thus \(\sqrt{G_i(0)}\) belongs in the denominator of Eq. (9).

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
{\pi(\lambda+2)[G_i^+(-1)]^2},
\]

and directly recovers the submitted work and energy coefficients in Eq. (10).

**Verification**

For the baseline \(E_1/E_2=0.5\), \(\nu_1=\nu_2=0.3\),
\(\alpha=45^\circ\), \(\sigma'=-0.5\), the independent calculation gave

\[
G_1(0)=1.049443226928,\quad
G_1^+(-1)=0.996302154171,\quad
G_1^+(-1-\lambda)=0.998663862615,
\]

and

\[
d_1/l=0.147434361719,\quad
\delta'_1=0.145787032394,\quad
J'_1=0.083620387223.
\]

These values agree with the existing MATLAB regression values within
\(2\times10^{-11}\). The WP1 audit therefore classified Eqs. (9) and (10) as
correct but insufficiently explained.

**Change in manuscript**

Section 3.4, before Eqs. (9) and (10). No coefficient in Eqs. (9)--(11) was
changed.

### R1.6 — Section 4 and competing fracture mechanisms

**Comment**

> The numerical analysis supports the claimed trends, but the two physical
> selection mechanisms and the single-zone admissibility statement remain
> unverified. The assertion that the conditions \(Cg_2<0\) and \(CQ_i>0\)
> can hold simultaneously for only one material should either be proved over
> the admissible parameter space or explicitly limited to a numerical
> observation. In addition, the critical loads of corner branching and
> branch-tip propagation should be compared quantitatively.

**Response**

We agree with both points and have revised the manuscript accordingly.

For the first point, we have not promoted the single-material result to a
general analytical theorem. Instead, we made its numerical status and scope
explicit and performed a substantially broader verification than in the
submitted version.

From the Appendix-A expression for \(q_i\), the multiplicative factor outside
the numerator function \(S_i\) is common to both candidate materials. Hence

\[
\operatorname{sgn}(Q_1Q_2)
=
\operatorname{sgn}(S_1S_2).
\]

Simultaneous admissibility for a fixed loading sign would require
\(Q_1Q_2>0\), and therefore \(S_1S_2>0\). We then evaluated this sign over a
broad parameter domain. A deterministic scan comprised 92,800 nondegenerate
cases with

\[
10^{-3}\le E_1/E_2\le10^3,
\]

25 logarithmic modulus-ratio values, eight independently varied Poisson-ratio
values from \(-0.95\) to \(0.49\) for each material, and
\(\alpha=3^\circ,6^\circ,\ldots,177^\circ\), excluding the degenerate
straight-interface limit. No case with \(S_1S_2>0\) was found.

A second seeded random scan of 20,000 cases, with the modulus ratio sampled
log-uniformly over the same range and the Poisson ratios and angle sampled
continuously over
\(-0.99<\nu_i<0.499\) and
\(0.2^\circ<\alpha<179.8^\circ\), likewise found no
simultaneous-admissibility candidate. The two sampled cases closest to \(S_1S_2=0\) were recomputed at
50-digit precision and retained the negative sign. Material-interchange
relations were checked independently on 1,000 additional random cases.

Accordingly, the revised manuscript states only that single-material
admissibility is **numerically supported over the investigated domain**; it
explicitly avoids claiming a global uniqueness theorem and continues to apply
the two admissibility conditions independently to both candidate materials.

For the second point, we added a quantitative critical-load comparison. In
the notation of the present paper, the Nazarenko--Kipnis solution for the
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

Thus the interfacial branch-tip threshold is

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

Defining

\[
\mathcal R_{\mathrm{II}}
=
\frac{K_{\mathrm{IIc}}}{\sigma_i\sqrt l},
\]

gives the dimensionless comparison

\[
\boxed{
\frac{|C_{\mathrm{corner}}|}{|C_{\mathrm{tip}}|}
=
\frac{|g_1k|\,|\sigma'_c|}
{\mathcal R_{\mathrm{II}}}
}.
\]

Corner branching therefore occurs first when
\(|g_1k|\,|\sigma'_c|<\mathcal R_{\mathrm{II}}\), while branch-tip
interfacial propagation occurs first when the inequality is reversed.

For the reference case
\(E_1/E_2=0.5\), \(\nu_1=\nu_2=0.3\), and
\(\alpha=45^\circ\), the independently evaluated coefficient is

\[
g_1k=-0.6794157816.
\]

Using the normalized critical opening

\[
\Delta_1=
\frac{E_1\delta_{1\mathrm{c}}}
{4(1-\nu_1^2)\sigma_1l},
\]

the mechanism boundary is

\[
\mathcal R_{\mathrm{II}}^*
=
1.1064\,\Delta_1^{0.6132}.
\]

The equivalent energy representation is

\[
\mathcal R_{\mathrm{II}}^*
=
1.5558\,\mathcal J_1^{0.6132},
\]

with
\(\mathcal J_1=
E_1J_{1\mathrm{c}}/[4(1-\nu_1^2)\sigma_1^2l]\).
The two boundaries coincide when
\(J_{1\mathrm{c}}=\chi_1\sigma_1\delta_{1\mathrm{c}}\).

This comparison does not require arbitrary numerical fracture constants.
A unique ordering for a particular material system requires the independently
specified resistances \(K_{\mathrm{IIc}}\) and either
\(\delta_{i\mathrm{c}}\) or \(J_{i\mathrm{c}}\).

**Verification**

The R1.6 analysis was performed in WP2 before manuscript editing. The final
verification passed the existing Python regression suite, the 92,800-case
deterministic scan, the 20,000-case continuous scan, 1,000 material-swap
checks, 50-digit edge checks, and the independent \(45^\circ\) mechanism
calculation.

**Change in manuscript**

Introduction and Section 2.1: the prescribed-stationary-crack assumption is
now tied explicitly to the a posteriori critical-load comparison, rather than
being stated as an untested loading assumption.

Section 2.2: the exclusivity statement is explicitly scoped as numerical.

Section 4: a broad admissibility audit and its parameter domain have been
added.

Section 5.2 (Competing fracture mechanisms): the branch-tip
\(K_{\mathrm{II}}\) formula, the two critical loads, the dimensionless
competition ratio, and the \(45^\circ\) mechanism boundary have been added.

Conclusions: the admissibility and competing-mechanism conclusions have been
revised to reflect these verified results.

## Reviewer 2

### R2.1

**Comment**

> The manuscript is well written, presents new interesting results that may
> be useful to the scientific community, and can be recommended for
> publication.

**Response**

We thank Reviewer 2 for the positive assessment and careful reading of the
manuscript. No specific correction was requested in this report.

**Change in manuscript**

No change was made solely in response to Reviewer 2.
