# scSimEvalStudio 0.99.5

* Synchronized bundled example benchmark caches (`demo_benchmark_data.rds` and `demo_paired_multiomics_saved.rds`) with `scSimEval 0.99.14` (Rice Bud paired 100 balanced cells × 100 HVGs/HVPs across 6 simulators, Soybean Root unpaired 100 balanced cells × 100 HVGs/HVPs across 3 simulators, updated scalability benchmarks, and complete bivariate Category I coverage returning exact 56/56/44/38 metrics).
* Automatically disabled the `Calculate scRNA-seq Metrics`, `Calculate scATAC-seq Metrics`, and `Calculate Multiomics Metrics` buttons in the Data Hub (until app refresh) whenever an example dataset is loaded for exploration, preventing accidental clicks from triggering the busy overlay and blocking result viewing.

# scSimEvalStudio 0.99.4

* Extracted inline post-footer JavaScript across `docs/*.html` into `docs/studio-ui.js` for clean HTML markup and verified `R CMD check` and `BiocCheck` compliance.

# scSimEvalStudio 0.99.3

* Streamlined `README.md`, `vignettes/scSimEvalStudio-workflow.Rmd`, and the `pkgdown` (`github.io`) documentation into a beginner-friendly Shiny studio guide—removing complex formulas and redundant `scSimEval` metric tables, keeping documentation focused on GUI usage, and linking inline to the core `scSimEval` documentation.

# scSimEvalStudio 0.99.2

* Added standard Bioconductor (`BiocManager::install("scSimEvalStudio")`) installation instructions in `README.md`, package vignette, and Shiny Help documentation, synchronized with `scSimEval 0.99.12`.
* Expanded `README.md`, `vignettes/scSimEvalStudio-workflow.Rmd`, and `pkgdown` (`github.io`) documentation with comprehensive scientific coverage of the 4 multiomics experimental designs, the 8-category / 56-measure evaluation taxonomy, direction-aware mathematical score normalization formulas, dynamic `BiocParallel` multi-core scheduling, and a detailed walkthrough of all 8 interactive Shiny studio modules.

# scSimEvalStudio 0.99.1

* Synchronized companion version compatibility with `scSimEval 0.99.11` and updated high-DPI workflow diagrams (350 DPI), dark-mode contrast styling, and responsive image zoom controls.

# scSimEvalStudio 0.99.0

* Initial Bioconductor release candidate extracted from `scSimEval` into a
  dedicated graphical Shiny studio companion package.
* Provides `launch_scSimEval_app()` for interactive single-cell RNA-seq,
  scATAC-seq, and paired/unpaired multiomics benchmarking, result inspection,
  and report export powered by `scSimEval` and `SingleCellExperiment`.
