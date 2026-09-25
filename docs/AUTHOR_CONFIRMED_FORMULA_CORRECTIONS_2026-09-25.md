# Author-confirmed process-zone formula corrections — September 25, 2026

## Author confirmation

M. V. Dudyk independently rechecked the two analytical discrepancies
identified during the English translation and confirmed both corrections.

1. The opening formula must use

   `G_i^+(-1)`

   instead of

   `G_i^+(-1-lambda)`.

2. The coefficients in the work and zone-related energy parameter must be

   `8/pi` and `16/pi`

   instead of

   `32/(9 pi)` and `64/(9 pi)`.

## Consequences

The process-zone length `d_i/l` is unaffected.

The corrected normalized quantities are

```text
delta_i' =
  -lambda K^+(-1)
  / [sqrt(pi G_i(0)) (1+lambda) G_i^+(-1)]
  * d_i/l

J_i' =
  -4 lambda
  / [pi (lambda+2) (G_i^+(-1))^2]
  * d_i/l
```

Therefore:

- Figure 2 must be regenerated;
- Figure 3 must be regenerated;
- Table 1 is unaffected;
- Figure 4 is unaffected;
- all numerical values and discussion involving `delta_i'` or `J_i'`
  must be rechecked;
- the old author/Mathcad values remain useful only as historical
  regression data for the superseded formulas.

At `alpha=45 deg`, `sigma'=-0.5`, material 1:

```text
d_1/l      = 0.1474343617   (unchanged)
delta_1'   = 0.1457870324   (corrected)
J_1'       = 0.0836203872   (corrected)
```

## Implementation status

Branch:

`fix/confirmed-process-zone-formulas-2026-09-25`

Completed in the first correction batch:

- Ukrainian analytical formulas corrected;
- English analytical formulas corrected;
- MATLAB opening and energy multipliers corrected;
- Figure-2 and Figure-3 regression tests updated so the old Mathcad table
  is retained only as historical regression after reverse mapping;
- Figure-2 and Figure-3 energy-axis limits prepared for corrected values;
- AQ-AN-02 marked resolved.

Completed after regeneration:

- regenerated Figure-2 and Figure-3 CSV/PDF/PNG files;
- recomputed the Figure-2 endpoint checkpoints;
- recomputed the Figure-3 extrema;
- revised the Ukrainian and English numerical discussion;
- synchronized the reproducibility and equation-inventory documentation.

Updated Figure-2 endpoints at `|sigma'|=0.5`:

| alpha | material | d_i/l | delta_i' | J_i' |
| ---: | ---: | ---: | ---: | ---: |
| 10 deg | 2 | 0.0313248064 | 0.0997342375 | 0.0488830979 |
| 45 deg | 1 | 0.1474343617 | 0.1457870324 | 0.0836203872 |
| 105 deg | 2 | 0.0370357093 | 0.0131058131 | 0.0088257892 |
| 135 deg | 1 | 0.0510105194 | 0.0552827687 | 0.0299416810 |

On the principal negative-load material-1 branch of Figure 3:

- `max(d_1/l)=0.1779333242` at 35 deg;
- `max(delta_1')=0.2077052861` at 32 deg;
- `max(J_1')=0.1139143967` at 33 deg.

Remaining before merge:

- final scientific/editorial sweep;
- confirm the manuscript builds cleanly with the regenerated figures.
