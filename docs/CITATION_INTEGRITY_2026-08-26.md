# Citation-integrity pass — 2026-08-26

## Scope

This pass removes legacy hard-coded reference numbers inherited from the pre-BibTeX manuscript and replaces them with stable BibTeX citation keys. No scientific equations, numerical values, admissibility conditions, or Author Queries were changed.

The legacy numbers in Sections 2–3 referred to the **older baseline bibliography**, not to the 48-item numbering in Dudyk's latest Word file. The mapping was therefore reconstructed from the baseline manuscript before replacement.

## Replacements in `02_problem_statement.tex`

| Legacy citation | Intended source in the old baseline | Stable citation |
|---|---|---|
| `[30]` | Nazarenko & Kipnis, stress field of interface shear cracks near the angular point | `\cite{NazarenkoKipnis2022Stress}` |
| `[4,18]` | Barenblatt & Cherepanov (1961); Goldstein & Salganik (1974), local-symmetry / crack-direction background | `\cite{BarenblattCherepanov1961,GoldsteinSalganik1974}` |
| `[29]` | Nayfeh, *Perturbation Methods* | `\cite{Nayfeh1973Perturbation}` |
| `[30]` (matching condition) | Nazarenko & Kipnis, cracked-corner outer field | `\cite{NazarenkoKipnis2022Stress}` |

The obsolete comment saying that source-reference numbers were being retained until bibliography transfer was removed.

## Replacements in `03_process_zone_parameters.tex`

| Legacy citation | Intended source in the old baseline | Stable citation |
|---|---|---|
| `[32]` | Noble, Wiener–Hopf method | `\cite{noble1958wienerhopf}` |
| `[21]` | Kaminsky, Dudyk & Polishchuk, broken-interface crack-initiation problem | `\cite{KaminskyDudykPolishchuk2024}` |
| `[32]` (Abelian theorem) | Noble, Wiener–Hopf / transform asymptotics | `\cite{noble1958wienerhopf}` |
| `[8]` | Cherepanov, general fracture theory | `\cite{Cherepanov1986}` |

The sentence introducing the factorization was also made bibliographically explicit: Noble supports the method itself, whereas Kaminsky–Dudyk–Polishchuk is cited as the related mechanical problem.

## Static integrity check

The manuscript-bearing TeX files were reviewed for legacy manually typed citation numbers:

- `sections/00_abstract.tex` — no literature citations;
- `sections/01_introduction.tex` — citations already use BibTeX keys;
- `sections/02_problem_statement.tex` — legacy numeric citations removed in this pass;
- `sections/03_process_zone_parameters.tex` — legacy numeric citations removed in this pass;
- `sections/04_numerical_results.tex` — no manually typed literature citations;
- `sections/05_conclusions.tex` — no literature citations in the current working skeleton;
- `appendices/appendix_a.tex` — no literature citations in the current working skeleton.

All keys introduced in this pass are present in `manuscript/latex/bibliography/references.bib`.

## Bibliographic-edition note

Dudyk's latest Word bibliography cites the 1988 Chelsea textually unaltered second edition/reprint of Noble's book, whereas the current BibTeX record cites the original 1958 Pergamon edition. Both refer to the same Wiener–Hopf monograph; this is an **edition-normalization** issue, not a citation-identity ambiguity. The final bibliography should use one edition consistently. No scientific statement depends on this choice.

## Result

The active manuscript no longer relies on old bibliography positions for the citations inherited by Sections 2–3. Subsequent additions or removals of references can therefore renumber the bibliography without breaking citation identity.