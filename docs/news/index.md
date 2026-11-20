# Changelog

## scSimEvalStudio 0.99.2

- Added standard Bioconductor
  (`BiocManager::install("scSimEvalStudio")`) installation instructions
  in `README.md`, package vignette, and Shiny Help documentation,
  synchronized with `scSimEval 0.99.12`.

## scSimEvalStudio 0.99.1

- Initial Bioconductor release candidate extracted from `scSimEval` into
  a dedicated graphical Shiny studio companion package.
- Provides
  [`launch_scSimEval_app()`](https://kabilanbio.github.io/scSimEvalStudio/reference/launch_scSimEval_app.md)
  for interactive single-cell RNA-seq, scATAC-seq, and paired/unpaired
  multiomics benchmarking, result inspection, and report export powered
  by `scSimEval` and `SingleCellExperiment`.
