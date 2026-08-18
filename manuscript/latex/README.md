# Modular TeX manuscript

This directory is the journal-neutral working source for the Dudyk manuscript.
It mirrors the scientific structure of the edited Word file but does not use
an automatic Word-to-TeX conversion. Equations and numerical statements must
be transferred from the verified repository documentation and CSV outputs.

## Compile

From `manuscript/latex`:

```bash
latexmk -lualatex -interaction=nonstopmode main.tex
```

If the local LuaLaTeX installation does not contain `luaotfload`, use
XeLaTeX instead:

```bash
latexmk -xelatex -interaction=nonstopmode main.tex
```

or, without `latexmk`:

```bash
lualatex -interaction=nonstopmode main.tex
bibtex main
lualatex -interaction=nonstopmode main.tex
lualatex -interaction=nonstopmode main.tex
```

The source prefers `TeX Gyre Termes`, `Heros`, and `Cursor` and falls back to
the DejaVu family when they are unavailable. Corrected plots are loaded
directly from the repository-level `figures/` directory.

## Working mode

Visible gray boxes are working notes controlled by `\workingdrafttrue` in
`preamble.tex`. Change it to `\workingdraftfalse` only after every section is
scientifically complete.

The bibliography is intentionally disabled while `references.bib` is empty.
After transferring and checking the references, change
`\bibliographyreadyfalse` to `\bibliographyreadytrue` in `preamble.tex`.

See `notes/WORKFLOW.md` for the filling order and `notes/CORRECTIONS.md` for
corrections that must not be lost during manuscript reconstruction.
