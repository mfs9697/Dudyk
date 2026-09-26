#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OUT="$ROOT/submission/ijf/build"
DIST="$ROOT/submission/ijf/dist"

rm -rf "$OUT" "$DIST"
mkdir -p "$OUT" "$DIST"

cp "$ROOT/submission/ijf/IJF_manuscript.tex" "$OUT/main.tex"
cp "$ROOT/submission/ijf/template/sn-jnl.cls" "$OUT/sn-jnl.cls"
cp "$ROOT/submission/ijf/template/sn-mathphys-ay.bst" "$OUT/sn-mathphys-ay.bst"
cp "$ROOT/submission/ijf/references.bib" "$OUT/references.bib"

cp "$ROOT/figures/figure2_recalculated.pdf" "$OUT/Fig2.pdf"
cp "$ROOT/figures/figure3_recalculated.pdf" "$OUT/Fig3.pdf"
cp "$ROOT/figures/figure4_admissible_segments.pdf" "$OUT/Fig4.pdf"

cat > "$OUT/Fig1_source.tex" <<'EOF'
\documentclass[tikz,border=2pt]{standalone}
\usepackage{tikz}
\usetikzlibrary{arrows.meta,calc}
\begin{document}
\input{../../../manuscript/latex/figures/figure1_original_tikz.tex}
\end{document}
EOF

(
  cd "$OUT"
  pdflatex -interaction=nonstopmode -halt-on-error Fig1_source.tex
  mv Fig1_source.pdf Fig1.pdf

  pdflatex -interaction=nonstopmode -halt-on-error main.tex | tee main-pdflatex-1.log
  bibtex main | tee main-bibtex.log
  pdflatex -interaction=nonstopmode -halt-on-error main.tex | tee main-pdflatex-2.log
  pdflatex -interaction=nonstopmode -halt-on-error main.tex | tee main-pdflatex-3.log
)

if grep -E "Citation .* undefined|There were undefined citations|There were undefined references|Warning--I didn't find a database entry" "$OUT/main.log" "$OUT/main-bibtex.log"; then
  echo "Unresolved citation/reference warning detected."
  exit 1
fi

if grep -E "Missing character:|LaTeX Error|Package .* Error" "$OUT/main.log"; then
  echo "Fatal font/package issue detected."
  exit 1
fi

echo "Layout warnings (for rendered-PDF inspection):"
grep -E "Overfull \\hbox|Overfull \\vbox" "$OUT/main.log" || true

cp "$OUT/main.pdf" "$DIST/IJF_Manuscript_Submission.pdf"
cp "$ROOT/submission/ijf/cover_letter.md" "$DIST/cover_letter.md"
cp "$ROOT/submission/ijf/submission_checklist.md" "$DIST/submission_checklist.md"

mkdir -p "$ROOT/submission/ijf/cover-build"
cp "$ROOT/submission/ijf/cover_letter.tex" "$ROOT/submission/ijf/cover-build/cover_letter.tex"
(
  cd "$ROOT/submission/ijf/cover-build"
  pdflatex -interaction=nonstopmode -halt-on-error cover_letter.tex
)
cp "$ROOT/submission/ijf/cover-build/cover_letter.pdf" "$DIST/IJF_Cover_Letter.pdf"

if [ -f "$ROOT/submission/ijf/package/FINAL_CONFIRMATIONS.txt" ]; then
  cp "$ROOT/submission/ijf/package/FINAL_CONFIRMATIONS.txt" "$DIST/FINAL_CONFIRMATIONS.txt"
fi

(
  cd "$OUT"
  zip -9 "$DIST/IJF_Submission_Source.zip" \
    main.tex sn-jnl.cls sn-mathphys-ay.bst references.bib main.bbl \
    Fig1.pdf Fig2.pdf Fig3.pdf Fig4.pdf
)

echo "Built:"
ls -lh "$DIST"
