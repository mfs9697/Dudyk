# Independent audit of the process-zone Wiener–Hopf solution

## Inputs and sign convention

Submitted package `submission/ijf/package/main.tex` at `1a9d4f34bcf2cb7ef61cca9c75c1581eb448539f`, Sections 2–3 and Appendix A. The revision baseline is `e718991e7d89d9f70cf6fc514891b211333ed88f`. This section through the moment calculation was recorded before consulting implementation or audit notes.

## Elimination in a shear-free wedge

Use dimensionless radius and a Mellin component with stress proportional to $r^{-1-p}$ (the forward measure is $r^p dr$). Measure each local angle $x$ from its bisector into its sector. The widths are $w_1=\pi-\alpha,w_2=\alpha$. Positive face displacement is measured into the material, i.e. in opposite global angular directions on the two bisectors. This face convention matters for the sign of the opening at $\beta_1=\pi$.

The Airy function $r^{1-p} f(x)$ satisfies $(\partial_x^2+(1-p)^2)(\partial_x^2+(1+p)^2)f=0$. Suppressing the common radial power, the stresses are $S=p(p-1)f$, $R=(1-p)f+f''$, $T=p f'$. If the local radial and angular displacement amplitudes are $U,V$ (power $r^{-p}$), plane strain gives $-2\mu pU=(1-\nu)R-\nu S$, and $U'-(p+1)V=T/\mu$. At either shear-free end this gives normalized angular displacement gradient $H=E\partial_r u_x/[2(1-\nu^2)]=f'''/[2(p+1)]$, with the radial power suppressed. Degenerate Airy bases at special integer $p$ are handled by continuation.

Here is a direct elimination recipe. Write the row $b(x)=(\cos[(1-p)x],\sin[(1-p)x],\cos[(1+p)x],\sin[(1+p)x])$. For each width form the matrix with rows $b'(0),b'(w),p(p-1)b(0),p(p-1)b(w)$. Its inverse acting on $(0,0,s,h)^t$ gives the four interior coefficients when the bisector and interface tractions are $s,h$. Multiplying by $b'''(0)/[2(p+1)]$ gives $H(0)=L s+M h$. Reflection about mid-width reverses the third derivative, hence $H(w)=-M s-L h$. With $c_j=2(1-\nu_j^2)/E_j$, the inactive condition and contact continuity are
$$L_j s_j+M_j h=0,\qquad c_i(M_i s_i+L_i h)+c_j(M_j s_j+L_j h)=0.$$
Thus with $B=c_iL_iL_j+c_j(L_j^2-M_j^2)$,
$$h=-c_iM_i L_j s_i/B,\quad H_i(0)/s_i=(L_i B-c_i M_i^2 L_j)/B.$$
This scalar Schur complement eliminates the interface traction as well as the inactive bisector traction.

For explicit evaluation put $X_w=\sin^2(pw)-p^2\sin^2w$, $Y_w=\sin(2pw)+p\sin(2w)$, $Z_w=\cos(2pw)-\cos(2w)$. Substitution of the four trigonometric columns (or Cramer's rule for the last two columns of the inverse) reduces the traction/gradient ratio to
$$s_i/H_i=-\frac{2c_j Z_j X_i+c_i Y_iY_j}{c_i Z_iY_j+c_j Z_jY_i},$$
where subscripts denote widths. The $c$ weights are proportional to $(1+\kappa_1,e(1+\kappa_2))$. The denominator is therefore $D$ and the numerator $D_i$ up to the same scale. Their vanishing corresponds respectively to both bisectors closed and to zero active traction. The latter condition allows a displacement discontinuity. The full transformed active traction equals $\Phi^++F$, with $a=1+\lambda$, $P=CQ_i d_i^\lambda$, $F=\sigma_i/(p+1)-P/(p+a)$ by direct integration on $(0,1)$. The full gradient is $\Phi^-$ by support. This yields (5) since $D_i/D=\tan(\pi p)G_i$.

The prescribed inner matching remainder $o(1/r)$ gives locally uniform convergence of the tail and its logarithm-weighted derivatives for $\Re p<0$. Even $O(1/r)$ suffices there. The raw field instead requires $\Re p<-a$. At the origin the gradient behaves as $r^{\lambda_i}$, so $\Phi^-$ is analytic for $\Re p>-1-\lambda_i$. The initial common strip has lower edge $\max(-a,-1-\lambda_i)$ and upper edge zero. Continuation supplies contour values.

## Kernel and splitting

$D$ is odd and $D_i$ even. At zero they start at orders one and two respectively, giving $G_0=D_i''(0)/(2\pi D'(0))$. At generic nonstraight interior angles $D(\pm1)=0$ while $D_i(\pm1)\ne0$; the cotangent adds a second pole order for a simple determinant root. A simple $D(-a)=0$ gives a simple pole unless the numerator also vanishes. For all coincidences the exact zero order is $\mathrm{ord}\,D_i-\mathrm{ord}\,D+\mathrm{ord}\cos\pi p-\mathrm{ord}\sin\pi p$. This includes the reflected corner poles, the process-zone eigenvalue zeros and the half-integer cotangent zeros. Orders of zero mean removable or ordinary points. Real-axis singularities away from zero do not lie on the integration contour.

For the positive even symbol on the imaginary axis take the real logarithm. The increasing imaginary axis has the left half-plane on its left. The left minus right Cauchy boundary values differ by $\log G$, hence $G=G^+/G^-$. Both exponential factors tend to one and are nonzero in their own open domains. Evenness gives
$$\log G^+(-x)=-\log G^-(x)=\frac{x}{\pi}\int_0^\infty\frac{\log G(it)}{x^2+t^2}\,dt,\quad x>0.$$
The one-sided limits are $G^+(0)=\sqrt{G_0}$ and $G^-(0)=1/\sqrt{G_0}$. At $-1,-a$ the plus factors are ordinary integrals with $x=1,a$; at $1,a$ the minus factors are their reciprocals. Values of the opposite continuations can be singular. No stripping of off-contour determinant roots is needed. Euler reflection gives $K^+K^-=(\pi p/\sin\pi p)/(\pi/\cos\pi p)=p\cot\pi p$. The explicit elementary factor is thus $\tan\pi p=p/(K^+K^-)$.

Write $L=K^+/(pG^+)$ and $F=\sum_{b=1,a}f_b/(p+b)$ with $f_1=\sigma_i,f_a=-P$. Multiply (5) by $L$. Move differences to the left:
$$L\Phi^++\sum_b f_b\frac{L(p)-L(-b)}{p+b}=-\frac{\Phi^-}{K^-G^-}-\sum_b\frac{f_b L(-b)}{p+b}.$$
The apparent left poles at $-b$ cancel by subtraction. The right has its forcing poles outside its half-plane. At zero $L$ has a pole but $\Phi^++F=O(p)$ by (5) and the finite right moment. These continuations glue across the contour. With the usual Mellin endpoint estimates for the square-root tip (at worst inverse square root on either face) the transforms are $O(|p|^{-1/2})$ in their assigned half-planes; the gamma ratio grows as $|p|^{1/2}$. Thus both glued expressions decay, and Liouville gives zero. Solving the left identity gives $\Phi^+=-L^{-1}\sum_b f_b[L(p)-L(-b)]/(p+b)$; solving the right gives
$$\Phi^-=K^-G^-\left[\frac{A}{p+1}-\frac{B_a}{p+a}\right],\quad A=\sigma_i K^+(-1)/G^+(-1),\quad B_a=P K^+(-a)/(aG^+(-a)).$$
These are the two lines of (6).

## Free boundary and moments

At large positive $p$ the coefficient of $p^{-1/2}$ is $A-B_a$. The tip field gives $-k_i/\sqrt{2\pi d_i}$ times the beta integral $B(p+1,1/2)\sim\sqrt{\pi/p}$, so $k_i=-\sqrt{2d_i}(A-B_a)$. The tip lies within one homogeneous material. One unknown endpoint requires one regularity condition, eliminating its unbounded stress. Setting $A=B_a$ yields
$$d_i=[CQ_i K^+(-a)G^+(-1)/(\sigma_i a K^+(-1)G^+(-a))]^{-1/\lambda}.$$
All factors other than the load are positive for positive cohesive resistance. Hence $CQ_i>0$ is necessary and sufficient for this positive solution. Substitution of $Q_i=g_1q_i l^{\lambda_0-\lambda}$ and division by $l$ gives (8).

Now $\Phi^-=\lambda A K^-G^-/[(p+1)(p+a)]$. Since $K^-(0)=1/\sqrt\pi$ and $K^-(1)=K^+(-1)=2/\sqrt\pi$, the moments are
$$m_0=\frac{\lambda A}{a\sqrt{\pi G_0}},\qquad m_1=\frac{2\lambda\sigma_i}{\pi(1+a)[G^+(-1)]^2}.$$
Integrating the gradient backward from the closed tip and doubling the face displacement gives $\delta=-2c_i d_i m_0$. Integrating once more over the zone (exchange order of integration) gives $W=-2c_i\sigma_i d_i^2m_1$. Along the equilibrium family at fixed cohesive stress, $J=2W/d_i$. Hence (9) has the square root **in the denominator**, (10) has coefficient $-16\lambda(1-\nu_i^2)\sigma_i^2/[\pi(1+a)E_iG^+(-1)^2]$, and (11) has $J/(\sigma_i\delta)=4a\sqrt{\pi G_0}/[\pi(1+a)G^+(-1)K^+(-1)]$.
