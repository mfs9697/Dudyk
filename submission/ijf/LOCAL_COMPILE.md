# Local compilation of the IJF manuscript

The file `IJF_manuscript.tex` is intended to compile directly from this folder.

## TeXstudio / MiKTeX

Open:

`submission/ijf/IJF_manuscript.tex`

and make sure the working directory is the document directory (`submission/ijf`).

Run the standard sequence:

1. pdfLaTeX
2. BibTeX
3. pdfLaTeX
4. pdfLaTeX

The required Springer class and bibliography style are stored beside the manuscript:

- `sn-jnl.cls`
- `sn-mathphys-ay.bst`

The manuscript also has fallbacks to the repository figure sources, so no generated `Fig1.pdf`--`Fig4.pdf` files are required for a normal local checkout.

## Submission artifact

The GitHub Actions workflow still creates a flat self-contained submission ZIP with `main.tex`, the Springer class/style, bibliography, and Fig1--Fig4.
