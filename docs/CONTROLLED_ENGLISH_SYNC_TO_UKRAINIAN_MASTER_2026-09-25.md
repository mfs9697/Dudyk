# Controlled synchronization — English manuscript to Ukrainian master

Date: 2026-09-25

Source of truth:
`manuscript/latex/sections/*.tex` and
`manuscript/latex/appendices/appendix_a.tex`
on branch
`restore/author-approved-baseline-plus-corrections-2026-09-25`.

Target:
`manuscript/latex/english/sections/*.tex` and
`manuscript/latex/english/appendices/appendix_a.tex`.

## Synchronization rule

The English manuscript is not retranslated wholesale. Existing polished English
prose is retained wherever it is scientifically equivalent. Only differences
that affect model ontology, chronology, notation, criterion interpretation,
applicability, or restored approved content are synchronized.

## Changes synchronized

### Abstract
- restored the explicit two-branch description;
- replaced generic “consistent choice” wording by consistent calibration of
  critical parameters;
- restored the explicit outcome: determination of the critical external load
  for branching initiation.

### Introduction
- restored the more specific description “models of process zones and cracks”;
- restored “specific singular field”;
- restored the symbol sigma_i at its conceptual first use;
- aligned the critical-characteristic wording with the Ukrainian master.

### Problem formulation
- restored the figure reference at first geometry introduction;
- aligned C with “amplitude of the local singular field,” not a generalized
  stress-intensity-factor label;
- made the already-existing V-shaped interfacial crack the prescribed
  stationary initial configuration, with two branches of length l and total
  branch length 2l;
- removed the unsupported statement that the process zone subsequently
  develops into an opening-mode branch;
- restored the quasi-static family-of-states framing after the process-zone
  definition;
- restored the explicit fixed-l / varying-C statement;
- restored the one-way-local-approximation qualification;
- restored j = 3 - i;
- tied lambda to the stationary V-shaped crack configuration rather than to a
  temporal “after crack formation” reading;
- made the correction-field provenance explicit;
- restored the statement that the two admissibility inequalities select only
  one material for the parameter sets considered.

### Analytical derivation
- aligned the section heading with “equilibrium process-zone parameters”;
- tied D(p) and lambda to the prescribed stationary V-shaped crack;
- made the numerical kernel statement explicitly real/positive/even;
- clarified that l is the V-shaped crack-branch length;
- replaced “secondary-crack initiation” by “branching initiation”;
- aligned critical-parameter calibration wording with the Ukrainian master.

### Numerical analysis
- restored exact V-shaped-crack terminology in the admissibility statement;
- restored the explicit symmetry consequences:
  d1 <-> d2,
  lambda1 <-> lambda2,
  alpha1 <-> pi - alpha2.

### Discussion
- replaced “independently measured material characteristics” by
  “independently determined critical characteristics”;
- removed residual “after zone formation” chronology;
- narrowed the comparison with the prior additive-energy formulation to the
  crack configuration considered in that work;
- kept the finite elastic term explicitly distinguished from the zone-related
  parameter.

### Conclusions
- replaced process-zone “formation” chronology by configuration-based wording;
- made the zonal status of J_i explicit in the local branching criterion;
- aligned the criterion-calibration wording with independently specified
  critical parameters.

### Appendix A
- aligned the cracked configuration with the prescribed stationary V-shaped
  interfacial crack;
- replaced the generalized-stress-intensity label for C by local
  singular-field amplitude;
- removed implied crack-formation chronology;
- made the distinction between the base plus factor G^+ and the process-zone
  factor G_i^+ explicit.

## Lockstep checks

The Ukrainian and English manuscripts now have the same section/subsection
label structure.

All numbered governing equations match exactly, after whitespace
normalization, for:
- boundary conditions and matched field;
- Wiener–Hopf functional equation and solution;
- process-zone length;
- normalized process-zone length;
- process-zone opening;
- process-zone energy parameter;
- energy-opening relation;
- residual elastic-flux scaling;
- all Appendix-A characteristic equations and determinants.

The following scientific invariants were rechecked in the English source:
- corrected opening factor G_i^+(-1);
- W_i coefficient 8/pi;
- J_i coefficient 16/pi;
- normalized J_i' coefficient 4/pi;
- AQ-AN-01 correction-stress formulation and convergence strip;
- J_i treated as a zone-related parameter, not as an independently
  established global contour integral;
- d_i/l < 0.1 as the primary quantitative range;
- approximately 0.18 treated as extrapolation;
- competing corner and outer-tip mechanisms treated as non-sequential.

## Result

The English manuscript is now synchronized semantically with the frozen
Ukrainian scientific master while preserving the publication-level English
style already established in the English sweep.

No governing equation or numerical checkpoint was changed during this
synchronization.
