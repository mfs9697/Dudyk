# WP2B source evidence — branch-tip Mode-II threshold

## Source

The submitted manuscript cites Nazarenko and Kipnis for the Mode-II
stress-intensity factor and limiting equilibrium of the two V-shaped
interfacial crack branches.

The explicit formula is given in:

V. M. Nazarenko and O. L. Kipnis,
"Гранична рівновага кусково-однорідного пружного тіла з міжфазними зсувними
тріщинами у кутовій точці межі поділу середовищ",
*Reports of the National Academy of Sciences of Ukraine*, 2018, No. 3,
pp. 36--41, DOI 10.15407/dopovidi2018.03.036.

The same analytical result appears in the later conference chapter:

V. M. Nazarenko and A. L. Kipnis,
"Limiting Equilibrium of Interfacial Shear Cracks at the Corner Point of the
Media-Separating Boundary of the Piece-Homogeneous Isotropic Plane",
Proceedings of ICTAEM 2019,
DOI 10.1007/978-3-030-21894-2_21.

The submitted manuscript cites the later International Applied Mechanics
treatment, DOI 10.1007/s10778-023-01175-4.

## Exact published relation

The 2018 source gives

$$
K_{II}
=
g_1(\alpha,e,\nu_1,\nu_2)\,
k(\alpha,e,\nu_1,\nu_2)\,
C\,l^{\lambda_0+1/2},
$$

with

$$
k=
\frac{
2\sqrt{2}(1+\kappa_2e)\Gamma(\lambda_0+3/2)
}{
[1+\kappa_1+(1+\kappa_2)e]
\Gamma(\lambda_0+2)G^+(-1-\lambda_0)
}.
$$

It then obtains the breaking load by imposing \(K_{II}=K_{IIc}\).

## Mapping to the submitted manuscript

The mapping is exact:

- source \(e\) is the present
  \[
  e=\frac{1+\nu_2}{1+\nu_1}\frac{E_1}{E_2};
  \]
- source \(\kappa_i=3-4\nu_i\);
- source \(\lambda_0\) is the intact-corner exponent;
- source \(g_1\) is the present intact-corner shear angular coefficient;
- source \(G^+\) is the plus factor of the present Appendix-A **base kernel**
  \(G\), not the process-zone kernel \(G_i\).

The source base-kernel prefactor is algebraically the same as the current
one because

$$
\kappa_1+(1+\kappa_1\kappa_2)e+\kappa_2e^2
=
(e+\kappa_1)(1+e\kappa_2),
$$

while

$$
1+\kappa_1+(1+\kappa_2)e
=
e+\kappa_1+1+e\kappa_2.
$$

Therefore no renormalization of \(C\), \(g_1\), or \(G^+\) is required.

Define

$$
\boxed{
\mathcal K_{II}=g_1k
}.
$$

Then

$$
K_{II}=\mathcal K_{II}Cl^{\lambda_0+1/2},
\qquad
|C_{\rm tip}|=
\frac{K_{IIc}}
{|\mathcal K_{II}|l^{\lambda_0+1/2}}.
$$

## Baseline sign check

At the submitted baseline
\(E_1/E_2=0.5\), \(\nu_1=\nu_2=0.3\), \(\alpha=45^\circ\),

$$
g_1=-0.58386949748,\qquad
k=1.16364321914,
$$

hence

$$
\mathcal K_{II}=-0.67941578160.
$$

The physically admissible branch has \(C<0\), so \(K_{II}>0\), consistent
with the sign convention stated in the source.

## Status

**Closed.** The source formula, kernel normalization, notation mapping, sign
convention, and baseline numerical coefficient have all been verified.
