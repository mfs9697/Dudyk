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
All 48 displayed source equations are preserved. The analytical queries are
documented in `AUTHOR_QUERIES_BATCH02.md`. AQ-AN-01 was resolved on
September 25, 2026 by restoring the superposition step used in the source
methodology; AQ-AN-02 was independently confirmed by the author the same day.

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

## Batch 3 (combined with Batches 1 and 2)

The numerical analysis and discussion are translated in
`sections/04_numerical_results.tex`, with the translated transition-angle
table in `tables/table1_transition_angles.tex`. The three publication
figure captions are translated and the approved numerical values are retained.

Compile from `manuscript/latex` using XeLaTeX:

```sh
xelatex -interaction=nonstopmode -halt-on-error -jobname=Dudyk_English_Batch03 english/batch03.tex
bibtex Dudyk_English_Batch03
xelatex -interaction=nonstopmode -halt-on-error -jobname=Dudyk_English_Batch03 english/batch03.tex
xelatex -interaction=nonstopmode -halt-on-error -jobname=Dudyk_English_Batch03 english/batch03.tex
```

Output: `Dudyk_English_Batch03.pdf`.

The approved baseline transition values are
\(\alpha_1=12.9202^\circ\) and \(\alpha_2=107.0897^\circ\), consistent
with the current verification CSV. Figures 2 and 3 were regenerated after
the September-25 analytical corrections. At
\(\alpha=45^\circ\), \(i=1\), \(\sigma'=-0.5\), the updated checkpoint is
\(d_1/l=0.14743436\), \(\delta_1'=0.14578703\), and
\(J_1'=0.08362039\). On the principal negative-load material-1 branch,
the sampled maxima occur at different but nearby angles:
\(d_1/l=0.1779333\) at \(35^\circ\),
\(\delta_1'=0.2077053\) at \(32^\circ\), and
\(J_1'=0.1139144\) at \(33^\circ\).

The old numerical Author Query boxes are omitted from the clean English
translation because their agreed substance is already incorporated in the
approved manuscript logic. In particular, the approved abstract states that
the deformation and energy characteristics are uniquely related for fixed
geometry; Batch 3 expresses the corresponding criteria as equivalent when
their critical material parameters are chosen consistently.

On September 25, 2026, M. V. Dudyk independently confirmed the analytical
audit: the opening formula uses \(G_i^+(-1)\), and the coefficients in
\(W_i\) and \(J_i\) are \(8/\pi\) and \(16/\pi\), respectively.
The MATLAB implementation, regenerated Figures 2--3, and the English
analytical and numerical sections now use these corrected relations.
AQ-AN-01 and AQ-AN-02 are both closed. The Section-3 plus transform is now
explicitly the Mellin transform of the correction stress obtained after
subtracting the matched no-zone eigenfield; the functional equation itself is
unchanged. Figure 4 has also been regenerated and committed, so all three
publication figures used in Batch 3 are present.

Next translation batch: Conclusions. The Abstract and Introduction should be
translated after the body is stable, followed by a final first-use,
abbreviation, cross-reference, and terminology audit in reading order.
