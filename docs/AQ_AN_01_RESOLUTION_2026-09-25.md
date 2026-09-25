# Resolution of AQ-AN-01: Mellin transform and analyticity

Date: 25 September 2026

## Issue

The manuscript originally defined

[
Phi_i^+(p)=int_1^infty
sigma_	heta(ho d_i,eta_i)ho^p,dho
]

using the total stress while simultaneously stating that the functional
equation holds in a strip crossing (operatorname{Re}p=0).

With the matching condition

[
sigma_	heta(r,eta_i)
=CQ_i r^lambda+o(r^{-1}),
qquad -1<lambda<0,
]

the raw integral of the total stress converges at infinity only for

[
operatorname{Re}p<-1-lambda.
]

Thus the printed definition and the claimed strip were not mutually
consistent.

## Source-method reconstruction

The 2024 predecessor paper, *Crack Initiation Model in Elastic Piecewise
Homogeneous Body with Broken Interface*, explicitly uses superposition:
the full field is split into the known field without the process zone and
a correction problem whose stresses decay as (o(r^{-1})) at infinity.
The same strategy is already present in the 2006 Wiener--Hopf treatment of
a thin process zone at an interface crack tip.

For the present scalar problem define

[
A_i=CQ_i d_i^lambda
]

and the correction stress

[
widehat{sigma}_i(r)
=sigma_	heta(r,eta_i)-CQ_i r^lambda.
]

Then

[
widehat{sigma}_i(r)=o(r^{-1}),
qquad r	oinfty,
]

and on the active process-zone segment (0<r<d_i),

[
widehat{sigma}_i(r)
=sigma_i-CQ_i r^lambda.
]

The correct plus transform is therefore

[
oxed{
Phi_i^+(p)=
int_1^infty
widehat{sigma}_i(ho d_i)ho^p,dho
}
]

rather than the transform of the total stress. The no-zone eigenfield
satisfies the bisector symmetry condition (u_	heta=0), so the
displacement-gradient transform used for (Phi_i^-) is unchanged by this
subtraction.

In the narrower domain (operatorname{Re}p<-1-lambda), where the raw
total-stress transform

[
widetilde{Phi}_i^+(p)=
int_1^infty
sigma_	heta(ho d_i,eta_i)ho^p,dho
]

also converges,

[
oxed{
Phi_i^+(p)
=
widetilde{Phi}_i^+(p)
+rac{CQ_i d_i^lambda}{p+lambda+1}.
}
]

This identity makes the pole removal and its sign explicit.

## Recovery of the functional equation

On (0<ho<1),

[
int_0^1
left(sigma_i-CQ_i d_i^lambdaho^lambdaight)
ho^p,dho
=
rac{sigma_i}{p+1}
-rac{CQ_i d_i^lambda}{p+lambda+1}.
]

Hence the existing functional equation

[
Phi_i^+(p)
+rac{sigma_i}{p+1}
-rac{CQ_i d_i^lambda}{p+lambda+1}
=
-	an(pi p)G_i(p)Phi_i^-(p)
]

is recovered exactly. No sign, forcing term, Wiener--Hopf factor, or
downstream numerical formula changes.

## Initial Mellin strip

Because
(widehat{sigma}_i(r)=o(r^{-1})),
the plus transform is analytic for

[
operatorname{Re}p<0.
]

Near the corner, the post-zone eigenfield gives

[
rac{partial u_	heta}{partial r}
=O(r^{lambda_i}),
qquad -1<lambda_i<0,
]

so

[
Phi_i^-(p)
]

is analytic for

[
operatorname{Re}p>-1-lambda_i.
]

The power-law term on the active segment additionally requires

[
operatorname{Re}p>-1-lambda.
]

Therefore the transformed functional equation is initially valid in

[
oxed{
max{-1-lambda,-1-lambda_i}
<
operatorname{Re}p
<
0.
}
]

This is the actual common convergence strip implied by the stated
asymptotics.

## Factorization contour

The condition
(widehat{sigma}_i=o(r^{-1}))
does **not** by itself imply convergence of the defining integral for
(Phi_i^+) on (operatorname{Re}p=0). The manuscript therefore no
longer claims such convergence.

Instead, the functional equation is established in the nonempty overlap
strip above. The identity then provides analytic/meromorphic continuation
of the separated combinations to the factorization contour
(operatorname{Re}p=0), where the standard Wiener--Hopf factorization is
performed.

## Consequences

AQ-AN-01 is resolved by restoring the omitted superposition step and
correcting the meaning of (Phi_i^+).

No numerical recalculation is required.

Unaffected items include:

- the functional equation itself;
- the Wiener--Hopf solution;
- the process-zone length (d_i);
- the corrected opening (delta_i);
- the corrected work (W_i) and energy parameter (J_i);
- Figures 2--4 and all regenerated CSV data.
