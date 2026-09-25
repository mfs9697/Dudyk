# International Journal of Fracture — submission preflight

Target journal: **International Journal of Fracture (Springer Nature)**  
Prepared: 2026-09-25  
Manuscript: **Analytical Model for Branching Initiation from the Corner of a V-Shaped Interfacial Shear Crack**

## Verified journal requirements

Source checked on 2026-09-25:
- https://link.springer.com/journal/10704/submission-guidelines
- https://link.springer.com/journal/10704/aims-and-scope
- https://www.springernature.com/gp/authors/campaigns/latex-author-support/see-where-our-services-will-take-you/18782940

### Fit and review
- The journal explicitly covers theoretical investigations of fracture, damage, and failure.
- Peer review is single-blind.
- The journal page currently routes submissions through `submission.nature.com`.

### Manuscript format
- LaTeX is the preferred manuscript format.
- Springer Nature's current journal template is recommended.
- IJF specifically requests the `[iicol]` two-column option.
- The submission should contain the editable source, figures/style files, and a compiled PDF.
- Springer Nature currently recommends a single main `.tex` file for the submission package and warns against subdirectories in uploaded LaTeX projects.
- For the current Springer Nature Article Processing Platform, the source should compile under `pdflatex`.
- Custom fonts should not be used in the upload package.

### Abstract and keywords
- IJF prefers an abstract of **150–200 words**.
- The abstract should contain **no mathematical symbols**.
- Provide **4–6 keywords**.

### References
- IJF's current instructions specify **author–year citations** in the text.
- The reference list should be alphabetized by the first author's surname.
- Full DOI links should be supplied when available.

### Title page
Required:
- concise title;
- all author names;
- affiliations, city, country;
- a clearly identified corresponding author with an active e-mail;
- ORCID identifiers where available.

### Statements and declarations
- Competing interests must be declared.
- Funding information must be supplied in the submission interface and in the manuscript declarations.
- Original research articles must contain a Data Availability Statement.
- Author contribution information must be supplied at submission; Springer Nature also recommends a contribution statement in the manuscript.

## Current manuscript status

Already satisfactory:
- title and author order are fixed;
- two affiliations are present;
- six keywords are present;
- figures and table are cited in order;
- the final bilingual scientific content has passed the repository build and final rendered-PDF sweep;
- Uman National University is the current official English institution name.

Changes needed for the IJF upload package:
1. use a journal-specific Springer Nature `sn-jnl` source with `iicol`;
2. compile the submission copy with `pdflatex`, not the XeLaTeX/fontspec working master;
3. flatten the manuscript into one main `.tex` file for upload;
4. switch the submission copy to author–year references;
5. use the 150–200-word symbol-free IJF abstract in `SUBMISSION_METADATA.md`;
6. add corresponding-author e-mail;
7. complete Funding, Competing Interests, Data Availability, and Author Contributions;
8. package the figures in the same upload directory and verify the journal-template rendering.

## Items requiring author confirmation before the final upload ZIP is frozen

- **Corresponding author:** proposed working choice is M. F. Selivanov; confirm before inserting the e-mail in the public submission source.
- **Funding:** confirm the exact grant/project statement, or confirm that no specific funding supported this work.
- **Competing interests:** confirm the no-conflict statement or provide any declaration.
- **Author contributions:** confirm a CRediT/free-text contribution statement for A. O. Kaminsky, M. F. Selivanov, M. V. Dudyk, and T. V. Polishchuk.
- **Data availability:** approve the proposed wording in `SUBMISSION_METADATA.md`.
- **AI-tool disclosure:** Springer Nature states that AI-assisted copy editing does not require disclosure, whereas broader LLM use should be documented. Confirm the final characterization/disclosure of the ChatGPT-assisted translation, restructuring, consistency checking, and submission preparation before submission.

No scientific reworking is required for journal fit. The remaining work is submission-format normalization and declarations.
