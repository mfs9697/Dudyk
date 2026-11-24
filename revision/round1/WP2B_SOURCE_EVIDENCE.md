# WP2B source evidence — branch-tip Mode-II threshold

## Source chain

The submitted manuscript cites Nazarenko and Kipnis for the Mode-II
stress-intensity factor and limiting equilibrium of the two interfacial crack
branches.

An accessible antecedent/source in the same analytical line gives the explicit
formula:

V. M. Nazarenko and A. L. Kipnis,
"Limiting Equilibrium of Interfacial Shear Cracks at the Corner Point of the
Media-Separating Boundary of the Piece-Homogeneous Isotropic Plane",
Proceedings of ICTAEM 2019, DOI 10.1007/978-3-030-21894-2_21.

The same formula structure appears in the 2018 Reports of the NAS of Ukraine
paper, DOI 10.15407/dopovidi2018.03.036. The submitted manuscript cites the
later International Applied Mechanics treatment,
DOI 10.1007/s10778-023-01175-4.

## Published formula

In the source notation,

$$
K_{II}
=
\frac{
2\sqrt{2}(1+\kappa_2 e)\,g\,
\Gamma(\lambda_0+3/2)
}{
[1+\kappa_1+(1+\kappa_2)e]\,
\Gamma(\lambda_0+2)\,
G^+(-\lambda_0-1)
}
\,C\,l^{\lambda_0+1/2}.
$$

The source then obtains the breaking load by imposing

$$
K_{II}=K_{IIc}.
$$

Thus, defining

$$
\mathcal K_{II}
=
\frac{
2\sqrt{2}(1+\kappa_2 e)\,g\,
\Gamma(\lambda_0+3/2)
}{
[1+\kappa_1+(1+\kappa_2)e]\,
\Gamma(\lambda_0+2)\,
G^+(-\lambda_0-1)
},
$$

gives

$$
C_{\rm tip}
=
\frac{K_{IIc}}
{\mathcal K_{II}l^{\lambda_0+1/2}}.
$$

## Preliminary mapping to the submitted manuscript

The current manuscript uses

$$
e=\frac{1+\nu_2}{1+\nu_1}\frac{E_1}{E_2},
\qquad
\kappa_i=3-4\nu_i,
$$

and the intact-corner shear amplitude

$$
\tau_{r\theta}\sim Cg_1r^{\lambda_0}.
$$

Therefore the source symbol \(g\) is expected to map to the current \(g_1\).
The source \(G^+\) is expected to map to the base plus factor used in Appendix
A for the transition from the intact corner field to the stationary V-shaped
crack field.

These mappings are **not yet declared final**. WP2B must verify them
algebraically against the exact determinant/kernel normalization used in the
submitted Appendix A and against material interchange.

## Consequence for the competition problem

The corner threshold has the form

$$
C_{\rm corner}
=
\sigma_i l^{-\lambda_0}\sigma'_c.
$$

Hence, on a common loading ray,

$$
\frac{|C_{\rm corner}|}{|C_{\rm tip}|}
=
|\mathcal K_{II}|\,|\sigma'_c|\,
\frac{\sigma_i\sqrt l}{K_{IIc}}.
$$

This shows that Reviewer 1's requested quantitative comparison can be made
without choosing arbitrary fracture constants: the result can be stated as a
dimensionless mechanism-selection inequality in terms of
\(K_{IIc}/(\sigma_i\sqrt l)\) and the normalized corner resistance.

## Status

Source formula identified and scaling verified. Exact notation/kernel mapping,
sign convention, and numerical implementation remain WP2B work.
