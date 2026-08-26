# Manuscript build and bibliography-flow check — 2026-08-26

## Purpose

This note records the first complete repository-side compilation of the integrated Ukrainian manuscript after the Introduction rewrite and the citation-integrity pass.

## Reproducible build

A GitHub Actions workflow, `.github/workflows/manuscript-build.yml`, now performs the full sequence from `manuscript/latex`:

```text
xelatex -interaction=nonstopmode -halt-on-error main.tex
bibtex main
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

It then checks the final logs for unresolved citations, unresolved cross-references, and missing BibTeX database entries, and uploads `main.pdf`, `main.log`, and `bibtex.log` as a build artifact.

## Result

Successful workflow run:

- workflow: `Manuscript build`;
- run number: 2;
- run id: `32941368865`;
- tested commit: `a9e86f1ecb1df8d2dcb61ff4fb4284f4d30b9b42`;
- result: **success**;
- compiled PDF: **18 pages**;
- citation/reference integrity check: **PASS**;
- final message: `No unresolved citation/reference warnings detected.`

The first CI attempt exposed a missing PostScript font metric (`pzdr`) required by the XeLaTeX/hyperref stack on the Ubuntu runner. Adding `texlive-fonts-recommended` to the workflow resolved that environment issue. This was not a manuscript-source error.

## Bibliography result

All active `\\cite{...}` keys resolve after the BibTeX pass. No missing database entry was reported. Legacy manually typed bibliography numbers in Sections 2--3 had already been removed by the citation-integrity pass.

BibTeX still emits two **formatting warnings**, not missing-reference errors:

```text
Warning--there's a number but no volume in KaminskyDudykReshitnyk2020
Warning--there's a number but no volume in BogdanovaEtAl2024
```

Both records are articles in *Reports of the National Academy of Sciences of Ukraine* for which the source metadata are naturally expressed by year + issue number rather than by a conventional volume + issue pair. The current records preserve that metadata accurately. These warnings are therefore retained for later journal-specific bibliography normalization rather than suppressed by inventing a volume.

## Non-bibliographic layout warnings observed

The successful final build still reports a small number of layout warnings that do not affect citation integrity:

- Table 1 is about `33.18 pt` wider than the text block (`Overfull \\hbox`);
- several `Underfull \\hbox` warnings occur in the keyword line, one analytical paragraph, and long bibliography/DOI lines.

These should be cleaned during the next presentation/layout pass. They do not invalidate the bibliography flow.

## Current content caveat

The successful build demonstrates technical integrity of the current TeX/BibTeX flow, not scientific completion of the manuscript. `05_conclusions.tex` and `appendices/appendix_a.tex` are still working skeletons and must be completed before a clean submission build.
