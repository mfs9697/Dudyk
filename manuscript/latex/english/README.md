# English translation

Source baseline: `0522cdae9e86300b73b1c220f3fa41faeb9dcf8f` on `main`,
the September 12, 2026 merge of Dudyk's response. On September 22, 2026,
Mikhailo Selivanov reported Dudyk's agreement with the latest manuscript
and authorized translation and editorial checks.

The Ukrainian source is preserved. This directory contains the English
working version, assembled in batches. The complete English manuscript
has not yet been assembled.

## Batch 1

`sections/02_problem_statement.tex` translates Section 2, including Figure 1's
caption. It retains every displayed equation, label, and citation key.
Editorial changes are recorded in `EDITORIAL_LOG.md`.

Compile from `manuscript/latex`:

```sh
xelatex -interaction=nonstopmode -halt-on-error -jobname=Dudyk_English_Batch01 english/batch01.tex
bibtex Dudyk_English_Batch01
xelatex -interaction=nonstopmode -halt-on-error -jobname=Dudyk_English_Batch01 english/batch01.tex
xelatex -interaction=nonstopmode -halt-on-error -jobname=Dudyk_English_Batch01 english/batch01.tex
```

Figure 1 and the bibliography are shared with the approved source.
The batch wrapper prints references to Appendix A as plain text because
that appendix is outside this extract. In an integrated manuscript,
the section defaults to the existing `app:asymptotics` cross-reference.
Citation numbering is local to this extract and will be generated anew
when the complete English manuscript is assembled.

## Batch 2 (combined with Batch 1)

The analytical derivation and Appendix A are translated in
`sections/03_process_zone_parameters.tex` and `appendices/appendix_a.tex`.
All 48 displayed source equations are preserved. Two analytical queries
are documented in `AUTHOR_QUERIES_BATCH02.md`; these remain open.

Compile from `manuscript/latex` using XeLaTeX:

```sh
xelatex -interaction=nonstopmode -halt-on-error -jobname=Dudyk_English_Batch02 english/batch02.tex
bibtex Dudyk_English_Batch02
xelatex -interaction=nonstopmode -halt-on-error -jobname=Dudyk_English_Batch02 english/batch02.tex
xelatex -interaction=nonstopmode -halt-on-error -jobname=Dudyk_English_Batch02 english/batch02.tex
```

Output: `Dudyk_English_Batch02.pdf`. Download or check out the full
repository for the shared figure and bibliography. In MiKTeX, select
XeLaTeX and allow installation of missing packages. Run the commands from
`manuscript/latex`, not from its `english` subdirectory.

The combined extract provides live cross-references to Appendix A.
The reference to Figure 2 explicitly points to the source manuscript,
since the numerical-results section is outside this extract. In the full
manuscript the appendix defaults to the existing live figure reference.
The wrapper explicitly identifies the unresolved analytical queries.

Next translation batch: numerical results, figure captions, and discussion.
Check the opening-formula query against the numerical implementation
before endorsing the opening curves. Repeat the first-use audit in final
reading order when the Introduction is translated.
