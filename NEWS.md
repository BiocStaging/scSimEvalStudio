# scSimEvalStudio 0.99.7

* Synchronized with `scSimEval (>= 0.99.17)` for per-metric `[0, 1]` tile color scaling in raw-value heatmaps and raw-mode-only optimization-direction arrows (`↑` / `↓`) across all plotting modules.
* Updated the Metric Plots single-metric picker so `↑` / `↓` direction arrows appear only when **Raw Metric Value** is selected (preserving the active metric selection on toggle), and synced package version references across `README.md`, vignettes, and `pkgdown` docs.


# scSimEvalStudio 0.99.6

* Synchronized with `scSimEval (>= 0.99.16)` for full 56-metric category coverage and optimization-direction arrows (`↑` / `↓`) across all visualization modules, including previously saved `.rds` uploads via Data Hub Option 4.
* Updated the PCA Ordination module (and exported R script) to include all 8 canonical categories / 56 metrics (`exclude_categories = NULL`) and increased the top-loadings selector limit to 56 metrics.
* Updated the Metric Plots single-metric picker and category-bar height calculation to disambiguate Category V (`RNA DE` vs `ATAC DA`, 12 metrics) and Category VI (`Integration ARI`/`Integration NMI`) with canonical ordering and `↑`/`↓` arrows, and increased default Heatmap (`1250 px`) and MDS (`720 px`) plot heights for 56-metric readability.

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
