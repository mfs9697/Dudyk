# IJF submission package

This directory contains the journal-specific submission layer for **International Journal of Fracture**. The scientifically frozen bilingual manuscript remains in `manuscript/latex`; this directory adapts the English master to the current IJF/Springer Nature submission requirements without altering the scientific model.

## Files

- `manuscript.tex` — one-file Springer Nature `sn-jnl` manuscript, configured for `pdflatex`, `iicol`, and the math/physics author–year reference style.
- `references.bib` — bibliography copied from the frozen master.
- `COVER_LETTER.md` — cover-letter draft to the Editor-in-Chief.
- `NOVELTY_POSITIONING.md` — related-work/novelty check for editorial screening.
- `SUBMISSION_METADATA.md` — portal-ready title, abstract, keywords, scope statement, and declaration placeholders.
- `SUBMISSION_CHECKLIST.md` — current IJF preflight and unresolved author confirmations.

## Automated package build

The workflow `.github/workflows/ijf-submission-build.yml`:
1. downloads the **official December 2024 Springer Nature LaTeX template** from Springer Nature;
2. generates `Fig1.pdf` from the frozen TikZ source;
3. copies the corrected publication figures as `Fig2.pdf`–`Fig4.pdf`;
4. creates a flat upload directory with no source subfolders;
5. compiles with `pdflatex` + BibTeX under `sn-mathphys-ay`;
6. checks unresolved citations/references, missing glyphs, and overfull boxes;
7. uploads the compiled manuscript PDF and a source ZIP.

The upload ZIP is deliberately produced by CI rather than committed to the repository, so the publisher's current template files are always taken from the official source.

## Not yet final

Do **not** submit the generated package until the placeholders for corresponding author, funding, competing interests, and author contributions are confirmed and replaced. The proposed Data Availability wording should also be approved by the authors.
