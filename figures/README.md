# Figure outputs

`figure4_recalculated` contains the four complete mathematical
singularity-exponent branches recalculated from the independently verified
MATLAB CSV. These full curves are useful for checking the characteristic
equations, but not every `lambda1` or `lambda2` point represents a physically
admissible process zone. The missing 90-degree values break the curves at the
degenerate flat-interface limit.

`figure4_admissible_segments` reconstructs the physical content of the
original Figure 4. Thin gray lines retain the complete `lambda1` and `lambda2`
solutions for context and are explicitly identified as complete mathematical
branches in the legend. Saturated green and blue segments enforce both model
conditions, `C*g2 < 0` and `C*Qi > 0`, for the baseline material pair. The
solid/dashed style identifies material 1/material 2, while green/blue
identifies `C>0`/`C<0`. Following the original manuscript, the legend retains
the representative values `sigma'=+0.5` and `sigma'=-0.5`. Their magnitude
does not affect the characteristic exponents; their sign identifies the
corresponding admissible branch. The transition angles calculated from the
printed `g2` equation are approximately 12.9 and 107.1 degrees, in agreement
with Table 1.

Suggested manuscript caption: "Dependence of the stress-singularity
exponents on the interface half-angle. Thin gray dotted curves show the
complete mathematical `lambda1` and `lambda2` branches. Colored segments
satisfy `C*g2<0` and `C*Qi>0`; the magnitude `|sigma'|=0.5` is representative,
whereas its sign selects the admissible material and angular interval. The
value `alpha=90 degrees` is excluded, and the colored curves are extended only
to the limiting value `lambda_i -> 0`."

`figure4_D1_audit` compares the physical `lambda1` branch with roots obtained
by applying the characteristic-root inference directly to the determinant
printed as `D1` in Eq. (5). The printed determinant returns a sign-changing
interior root at only 59 of the 179 sampled angles and does not reproduce
Figure 4.

All PDF files are vector outputs suitable for manuscript preparation. PNG
copies are exported at 600 dpi for review and presentation.

`figure2_45deg_calibration` is the first controlled reconstruction of the
solid blue curve in the original Figure 2. Its three panels show `d1/l`,
`delta1'`, and `J1'` against `sigma'` for `alpha=45 degrees`, `C<0`, and a
process zone in material 1. It is generated entirely by the MATLAB
Wiener-Hopf implementation and should be compared with the original curve
before the remaining Figure-2 and Figure-3 cases are enabled.
