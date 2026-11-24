# WP3 — Manuscript revision

Branch: \`revision/ijf-r1-wp3-manuscript\`

## Scope

WP3 converts verified reviewer findings into manuscript changes and a
point-by-point response.

### Implemented now

- R1.1: boundary-condition logic;
- R1.2: mixed process-zone boundary conditions;
- R1.3: matching remainder, homogeneous tip asymptotics, free-boundary
  solvability, and signed face trace;
- R1.4: transformed elasticity elimination, factorization convention,
  gamma identity, and Liouville argument;
- R1.5: explicit \(p=0\) and \(p=1\) moments and verification of Eq. (9).

### Deliberately gated

R1.6 is not yet inserted into the manuscript because WP2 is not scientifically
closed. PR #18 presently contains the WP2 framework and preliminary
reductions, but not the required broad admissibility sweep or final verified
branch-tip coefficient mapping.

## Verification status

WP1 is merged into \`revision/ijf-round1\` and is the evidence base for
R1.3--R1.5. The first WP3 manuscript commit is \`62dcb0c\`.

The current environment could not clone GitHub directly for a local PDF build.
The repository's IJF workflow does not automatically run on this revision
branch. A package build remains required before WP3 can be declared complete.
