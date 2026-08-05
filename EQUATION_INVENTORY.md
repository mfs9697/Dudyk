# Equation inventory: characteristic roots

This inventory records the four characteristic-exponent calculations needed
to reproduce the singularity curves in Figure 4 of the supplied manuscript.
It distinguishes equations explicitly printed in the paper from relations
that must currently be inferred.

## 1. Geometry, parameters, and transform convention

The paper uses the half-angle

\[
0<\alpha<\pi
\]

for the broken interface, with plane-strain elastic constants
\(E_i,\nu_i\). The dimensionless mismatch parameters are

\[
e=\frac{1+\nu_2}{1+\nu_1}\frac{E_1}{E_2},
\qquad
\kappa_i=3-4\nu_i.
\]

For every stress singularity exponent, the Mellin variable is

\[
p=-1-\lambda,\qquad -1<\lambda<0.
\]

Consequently, a determinant equation written in the Mellin variable as
\(D_j(p)=0\) becomes

\[
D_j(-1-\lambda_j)=0.
\]

All angles passed to the code are in radians. User-facing tables and command
line arguments use degrees.

## 2. Root inventory

| Exponent | Physical stage | Characteristic relation | Source/status | Implementation |
| --- | --- | --- | --- | --- |
| \(\lambda_0\) | Intact broken bimaterial interface | \(D_0(-1-\lambda_0)=0\) | Printed as Eq. (A.2), PDF p. 9 | `D0` |
| \(\lambda\) | Corner after formation of the symmetric interfacial shear crack | \(D(-1-\lambda)=0\) | Printed below Eq. (A.3), with \(D\) in Eq. (A.4), PDF pp. 9-10 | `D` |
| \(\lambda_2\) | Process zone in material 2 | \(D_2(-1-\lambda_2)=0\) | Root relation omitted; inferred from the kernel in Eq. (5). The resulting curve reproduces Figure 4 | `D2_printed` |
| \(\lambda_1\) | Process zone in material 1 | Material-swap image of the \(D_2\) problem: \(D_2^{\mathrm{swap}}(-1-\lambda_1;\pi-\alpha)=0\) | This is the transformation explicitly stated below Figure 3 and it reproduces Figure 4. Direct use of printed \(D_1\) does not | `D2_printed after material swap` |

For \(\lambda_0\) and \(\lambda\), the manuscript says to select the smallest
root on \((-1,0)\), i.e. the most negative real exponent. The same selector is
used consistently for the two post-zone calculations. All detected real roots
are retained by the code so that the selector can be changed without repeating
the search.

The excluded cases \(\alpha=0,\pi/2,\pi\) are treated as degenerate limits.
The code returns no interior root at exactly \(\alpha=\pi/2\), rather than
silently replacing the limiting value by zero.

## 3. Determinant \(D_0(p)\): intact corner

Equation (A.2) defines

\[
D_0(p)=b_0(p)+e b_1(p)+e^2b_2(p),
\]

where

\[
\begin{aligned}
b_0(p)={}&[\sin(2p\alpha)+p\sin(2\alpha)]
[\kappa_1\sin(2p(\pi-\alpha))+p\sin(2\alpha)],\\
b_1(p)={}&(1+\kappa_1)(1+\kappa_2)\sin^2(p\pi)\\
&-[\sin(2p\alpha)+p\sin(2\alpha)]
[\kappa_1\sin(2p(\pi-\alpha))+p\sin(2\alpha)]\\
&-[\sin(2p(\pi-\alpha))-p\sin(2\alpha)]
[\kappa_2\sin(2p\alpha)-p\sin(2\alpha)],\\
b_2(p)={}&[\sin(2p(\pi-\alpha))-p\sin(2\alpha)]
[\kappa_2\sin(2p\alpha)-p\sin(2\alpha)].
\end{aligned}
\]

The root calculation is

\[
\boxed{D_0(-1-\lambda_0)=0,\qquad -1<\lambda_0<0.}
\]

## 4. Determinant \(D(p)\): shear-cracked corner

Equation (A.4) defines

\[
D(p)=a_0(p)+e a_1(p),
\]

with

\[
\begin{aligned}
a_0(p)={}&(1+\kappa_1)
[\cos(2p(\pi-\alpha))-\cos(2\alpha)]
[\sin(2p\alpha)+p\sin(2\alpha)],\\
a_1(p)={}&(1+\kappa_2)
[\cos(2p\alpha)-\cos(2\alpha)]
[\sin(2p(\pi-\alpha))-p\sin(2\alpha)].
\end{aligned}
\]

The root calculation is

\[
\boxed{D(-1-\lambda)=0,\qquad -1<\lambda<0.}
\]

## 5. Printed post-zone determinants

Equation (5), PDF p. 4, prints

\[
G_i(p)=\frac{D_i(p)\cos(p\pi)}{D(p)\sin(p\pi)}.
\]

Care is needed here: the factors in the first products contain squared sine
functions, not double-angle sine functions.

\[
\begin{aligned}
D_1(p)={}&2e(1+\kappa_2)
[\cos(2p\alpha)-\cos(2\alpha)]
[\sin^2(p(\pi-\alpha))-p^2\sin^2\alpha]\\
&+(1+\kappa_1)
[\sin(2p\alpha)-p\sin(2\alpha)]
[\sin(2p(\pi-\alpha))+p\sin(2\alpha)],\\[3pt]
D_2(p)={}&2(1+\kappa_1)
[\cos(2p(\pi-\alpha))-\cos(2\alpha)]
[\sin^2(p\alpha)-p^2\sin^2\alpha]\\
&+e(1+\kappa_2)
[\sin(2p(\pi-\alpha))-p\sin(2\alpha)]
[\sin(2p\alpha)+p\sin(2\alpha)].
\end{aligned}
\]

The current manuscript does not explicitly state the characteristic equations
for \(\lambda_1\) and \(\lambda_2\). The natural inference from the kernel and
the corresponding earlier Wiener-Hopf derivation is

\[
D_i(-1-\lambda_i)=0.
\]

However, the direct printed-\(D_1\) calculation is not the curve labelled
\(\lambda_1\) in Figure 4.

## 6. Material-swap calculation of \(\lambda_1\)

The manuscript states below Figure 3 that results for the reversed stiffness
ratio follow from

\[
E_1/E_2\leftrightarrow E_2/E_1,
\qquad
\alpha\leftrightarrow\pi-\alpha,
\qquad
\lambda_1\leftrightarrow\lambda_2.
\]

For general unequal Poisson ratios, the complete swap is

\[
(E_1,\nu_1)\leftrightarrow(E_2,\nu_2).
\]

Accordingly, the implemented material-1 branch is

\[
\boxed{
D_2\!\left(-1-\lambda_1;
\pi-\alpha,E_2,E_1,\nu_2,\nu_1\right)=0.
}
\]

This calculation matches the blue/green \(\lambda_1\) branches in Figure 4.
The direct root of the printed \(D_1\) is still returned as
`lambda1_D1_printed` for diagnosis.

## 7. Baseline numerical checkpoints

For

\[
E_1/E_2=0.5,\qquad \nu_1=\nu_2=0.3,
\]

the tested values are:

| \(\alpha\) | \(\lambda_0\) | \(\lambda\) | \(\lambda_1\), swap branch | \(\lambda_2\) | Direct printed \(D_1\) root |
| ---: | ---: | ---: | ---: | ---: | ---: |
| \(45^\circ\) | -0.0890898075 | -0.6131972266 | -0.3938308090 | -0.4675384157 | no interior sign-changing root |
| \(135^\circ\) | -0.1115381682 | -0.5467577000 | -0.4585914004 | -0.3001639298 | -0.1658199669 |

All selected determinant residuals at these checkpoints are below
\(10^{-9}\) with the default scan.

In the complete integer-angle sweep from \(1^\circ\) to \(179^\circ\), all
four physical calculations return an interior root at every angle except the
excluded flat-interface value \(90^\circ\); the maximum residual is below
\(10^{-10}\). In contrast, the direct printed-\(D_1\) calculation produces a
sign-changing interior root at only 59 of the 179 sampled angles.

## 8. Audit findings that must be corrected in the paper

1. **Missing equations.** The paper must explicitly state how
   \(\lambda_1,\lambda_2\) are calculated and how the relevant root is chosen.
2. **Conflicting material-direction labels.** Section 1 uses
   \(\beta_1=\pi,\beta_2=0\), whereas Appendix A.3 uses
   \(\beta_1=0,\beta_2=\pi\).
3. **Printed \(D_1\) versus Figure 4.** Direct use of the printed \(D_1\) does
   not reproduce the plotted material-1 exponent or the stated material-swap
   symmetry. The transformed \(D_2\) calculation does. This may be a sign or
   indexing error in \(D_1\), but it should be checked against the authors'
   original algebra or calculation files before the paper is revised.
4. **Degenerate flat-interface case.** At \(\alpha=90^\circ\), the model is
   excluded and the determinants possess endpoint/degenerate behavior. Values
   shown as zero in a plot should be described as limits, not as ordinary
   interior roots.
5. **Root terminology.** “Smallest root” should be replaced by an unambiguous
   definition such as “the most negative real root in \((-1,0)\), continuously
   connected to the reported branch.”

## 9. Equation-to-code map

| Mathematical object | Python | MATLAB |
| --- | --- | --- |
| Material normalization | `MaterialPair` | `normalize_material.m` |
| \(D_0(p)\) | `determinant_D0` | `characteristic_determinant('D0',...)` |
| \(D(p)\) | `determinant_D` | `characteristic_determinant('D',...)` |
| Printed \(D_1(p)\) | `determinant_D1_printed` | `characteristic_determinant('D1_printed',...)` |
| Printed \(D_2(p)\) | `determinant_D2_printed` | `characteristic_determinant('D2_printed',...)` |
| All real roots and selector | `find_real_characteristic_roots` | `find_characteristic_roots.m` |
| Four physical exponents | `calculate_four_characteristic_roots` | `calculate_characteristic_roots.m` |
| Material exchange | `MaterialPair.swapped` | `swap_materials.m` |
