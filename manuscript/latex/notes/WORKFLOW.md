# Stepwise manuscript workflow

The TeX tree is deliberately modular. Complete and review one stage before
moving to the next.

1. **Notation and problem statement.** Fix geometry, material numbering,
   angle convention, normalization, admissibility conditions, and Figure 1.
2. **Analytical derivation.** Transfer Eqs. (1)-(10) and Appendix A from the
   verified equation inventory, not by automatic Word conversion.
3. **Numerical-results section.** Write from the repository CSV files and the
   corrected Figures 2-4. Record convergence and physical segment changes.
4. **Introduction.** Rebuild the literature logic and sharpen the novelty
   claim after the technical contribution is fixed.
5. **Conclusions and abstract.** Write these from the completed analytical and
   numerical sections; remove claims unsupported by a displayed result.
6. **Bibliography.** Convert and normalize all 36 references, verify DOI and
   bibliographic metadata, and remove duplicate or weakly relevant sources.
7. **English version.** Translate the scientifically stable Ukrainian source,
   resolving terminology questions explicitly rather than translating the
   unstable Word draft sentence by sentence.
8. **Journal adaptation.** Only after the content is stable, replace the
   neutral `article` class with the selected journal class and apply its
   reference, heading, and front-matter requirements.

At every stage, compile with LuaLaTeX and keep `main.tex` buildable.
