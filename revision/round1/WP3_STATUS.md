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
- R1.5: explicit \(p=0\) and \(p=1\) moments and verification of Eq. (9);
- R1.6: scoped numerical admissibility claim, broad parameter audit,
  branch-tip Mode-II threshold, critical-load competition ratio, and
  baseline dimensionless mechanism boundary.

### R1.6 evidence base

WP2 was completed and merged into `revision/ijf-round1` as PR #18
(merge commit `64cef1a9c6c1410ec9ef84703288968bc95d4a02`).
Verification run `45407525585` passed the existing Python regression suite
and the full WP2 audit.

## Verification status

WP1 is merged into \`revision/ijf-round1\` and is the evidence base for
R1.3--R1.5. The first WP3 manuscript commit is \`62dcb0c\`.

A disposable verification branch `verification/ijf-r1-wp3-build` was created
from the exact WP3 manuscript head and changed only the workflow trigger.
GitHub Actions run #84 (run ID 45398938466) completed successfully: checkout,
TeX installation, flat IJF package build with pdflatex, PDF preflight/font
check, and artifact upload all passed. Thus the R1.1--R1.5 manuscript tranche
is build-verified.

The scientific content for Reviewer 1 comments R1.1--R1.6 is complete.

A disposable branch `verification/ijf-r1-wp3-final-build-v2` was created
from the exact latest WP3 manuscript head and changed only the workflow
trigger. GitHub Actions run #86 (run ID `45414299720`) completed
successfully: checkout, TeX installation, flat IJF package build with
pdflatex, PDF/font preflight, and artifact upload all passed.

WP3 is therefore build-verified.

A final language/style sweep was completed, including removal of internal
work-package terminology from the reviewer response and several publication-
style improvements in the manuscript. The polished manuscript was rebuilt in
GitHub Actions run #87 (run ID `45417996400`), which passed the flat
pdflatex build, PDF/font preflight, and artifact upload.

The resulting 32-page PDF was visually inspected page by page. No clipping,
overlap, broken glyphs, figure-scaling problems, or equation-layout defects
were found. WP3 is now complete from the scientific, language/style, build,
and visual-preflight perspectives.
