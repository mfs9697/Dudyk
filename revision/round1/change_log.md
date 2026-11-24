# Revision change log — Round 1

Status: Reviewer 1 comments R1.1--R1.6 implemented; final package verification in progress.

| ID | Reviewer point | Manuscript location | Change | Verification | Commit |
|---|---|---|---|---|---|
| R1.1 | Distinguish symmetry, traction continuity, and frictionless contact | Sec. 2.2, Eq. (1) | Split boundary conditions by physical origin; explained why \(\llbracket\tau_{r\theta}\rrbracket=0\) and \(\tau_{r\theta}=0\) are distinct | Direct mechanics check | \`62dcb0c\` |
| R1.2 | Rewrite Eq. (2) | Sec. 2.2, Eq. (2) | Recast as piecewise active-bisector condition and separate inactive symmetry line | Direct boundary-condition check | \`62dcb0c\` |
| R1.3 | Explain matching decay, homogeneous tip field, and \(k_i=0\) | Secs. 2.1--2.3, Sec. 3.1 | Added correction-field analyticity rationale, homogeneous local-tip explanation, free-boundary solvability count, and opening-positive face trace | WP1 independent derivation audit | \`62dcb0c\` |
| R1.4 | Show elimination and Wiener--Hopf split | Secs. 3.1--3.2 | Added Airy/Mellin elimination, ratio factorization convention, reflection identity, gamma identity, and Liouville split | WP1 independent Airy solve and factorization audit | \`62dcb0c\` |
| R1.5 | Evaluate \(\Phi_i^-(0)\), \(\Phi_i^-(1)\); settle \(G_i(0)\) placement | Sec. 3.4 | Added regularized transform, explicit zeroth/first moments, and proof that \(\sqrt{G_i(0)}\) is in denominator | WP1: independent 45-deg calculation agrees with MATLAB within \(2\times10^{-11}\) | \`62dcb0c\` |
| R1.6 | Admissibility scope and competing critical loads | Introduction, Secs. 2.1--2.2, Sec. 4, Sec. 5.2, Conclusions | Tied stationary-crack assumption to a posteriori threshold comparison; scoped exclusivity as numerical; added 92,800-case + 20,000-case audit, high-precision edge checks, branch-tip KII formula, critical-load ratio, and 45-deg mechanism boundary | WP2 run 45407525585: existing tests + all WP2 assertions passed | `258a271`, `a5f3079` |
| R2.1 | Positive recommendation; no specific changes | — | No reviewer-specific change | — | — |

## Verification checklist

- [x] All reviewer comments recorded in \`reviewer_comments.md\`.
- [x] R1.1--R1.5 have explicit draft responses.
- [x] Every R1.1--R1.5 claimed manuscript change exists in the source.
- [x] Equation changes/clarifications checked independently through WP1.
- [x] R1.5 numerical values independently reproduced.
- [x] R1.6 scientific work completed through WP2 and merged as PR #18.
- [x] No existing figure requires regeneration; R1.6 adds parameter-domain verification and analytical mechanism boundaries without altering Figures 2--4.
- [x] R1.6 uses the existing `NazarenkoKipnis2022Equilibrium` reference already present in the bibliography.
- [ ] Full manuscript language/style sweep completed.
- [x] R1.1--R1.5 IJF package builds and passes PDF/font preflight (workflow run #84).
- [x] Final post-WP2 IJF package builds and passes PDF/font preflight (workflow run #86, run ID 45414299720).
- [ ] Final generated PDF inspected before resubmission.
