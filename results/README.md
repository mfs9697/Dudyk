# Numerical results

- `baseline_roots_matlab_1deg.csv`: MATLAB R2023a calculation supplied after
  the regression suite passed on 5 August 2026.
- `baseline_roots_1deg.csv`: independently regenerated Python reference sweep.
- `baseline_example.json`: detailed Python diagnostic at 45 degrees, including
  all detected roots, residuals, the corrected-`D1` result, its independent
  symmetry check, and the exact printed-`D1` diagnostic.

Both CSV files cover integer half-angles from 1 to 179 degrees. The
90-degree row is intentionally empty/`NaN` because it is a degenerate limit,
not an ordinary root inside `(-1,0)`.

The checked physical columns are `lambda0`, `lambda`, `lambda1`, and
`lambda2`. `lambda1_D1_printed` is retained only to document the manuscript
equation inconsistency and must not be substituted for the Figure-4 branch.
