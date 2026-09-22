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

Next batch: Section 3 and Appendix A. The first-use and editorial audit
must be repeated in final reading order when the Introduction is translated.
