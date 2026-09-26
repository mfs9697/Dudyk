# Local compilation of the IJF manuscript

The canonical IJF working source is:

`submission/ijf/IJF_manuscript.tex`

The Springer class and bibliography style are stored beside it:

- `sn-jnl.cls`
- `sn-mathphys-ay.bst`

The journal-facing source uses flat figure names `Fig1.pdf`--`Fig4.pdf`.
Those files are deliberately generated only in the submission build directory,
rather than duplicated in the repository source folder.

## Recommended build

From the repository root run:

```bash
bash submission/ijf/build_submission.sh
```

This creates a clean flat package under `submission/ijf/build/` and final
artifacts under `submission/ijf/dist/`. Both directories are generated and
ignored by Git.

## Direct TeXstudio compilation

For a one-off direct compile of `IJF_manuscript.tex`, copy the generated
`Fig1.pdf`--`Fig4.pdf` from `submission/ijf/build/` into
`submission/ijf/`, then run:

1. pdfLaTeX
2. BibTeX
3. pdfLaTeX
4. pdfLaTeX

Do not commit those copied figure files.
