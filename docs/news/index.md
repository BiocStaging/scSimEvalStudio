# Changelog

## scSimEvalStudio 0.99.3

- Streamlined `README.md`, `vignettes/scSimEvalStudio-workflow.Rmd`, and
  the `pkgdown` (`github.io`) documentation into a beginner-friendly
  Shiny studio guide—removing complex formulas and redundant `scSimEval`
  metric tables, keeping documentation focused on GUI usage, and linking
  inline to the core `scSimEval` documentation.

## scSimEvalStudio 0.99.2

- Added standard Bioconductor (`BiocManager::install("scSimEvalStudio")`) installation instructions in `README.md`, package vignette, and Shiny Help documentation, synchronized with `scSimEval 0.99.12`.
- Expanded `README.md`, `vignettes/scSimEvalStudio-workflow.Rmd`, and `pkgdown` (`github.io`) documentation with comprehensive scientific coverage of the 4 multiomics experimental designs, the 8-category / 56-measure evaluation taxonomy, direction-aware mathematical score normalization formulas, dynamic `BiocParallel` multi-core scheduling, and a detailed walkthrough of all 8 interactive Shiny studio modules.

## scSimEvalStudio 0.99.1

- Synchronized companion version compatibility with `scSimEval 0.99.11`
  and updated high-DPI workflow diagrams (350 DPI), dark-mode contrast
  styling, and responsive image zoom controls.

## scSimEvalStudio 0.99.0

- Initial Bioconductor release candidate extracted from `scSimEval` into
  a dedicated graphical Shiny studio companion package.
- Provides
  [`launch_scSimEval_app()`](https://kabilanbio.github.io/scSimEvalStudio/reference/launch_scSimEval_app.md)
  for interactive single-cell RNA-seq, scATAC-seq, and paired/unpaired
  multiomics benchmarking, result inspection, and report export powered
  by `scSimEval` and `SingleCellExperiment`.
