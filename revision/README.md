# IJF revision workspace

This directory is reserved for editorial decisions and reviewer responses.

## Baseline

The exact submitted v1.0 state is frozen on:

`submitted/ijf-v1.0`

Do not modify that branch.

## Round workflow

For each revision round:

1. save the decision letter in the round directory;
2. copy reviewer comments verbatim into `reviewer_comments.md`;
3. classify every comment as scientific, mathematical, numerical, editorial,
   citation-related, or presentation-related;
4. make manuscript changes only in the canonical source
   `submission/ijf/IJF_manuscript.tex`;
5. record each change in `change_log.md`;
6. draft the point-by-point reply in `response_to_reviewers.md`;
7. rerun numerical/unit tests where relevant;
8. rebuild the IJF package and inspect the generated PDF;
9. verify that every reviewer comment is explicitly closed before resubmission.

Never answer a reviewer from memory when the repo contains a derivation, test,
or audit note that can provide direct evidence.
