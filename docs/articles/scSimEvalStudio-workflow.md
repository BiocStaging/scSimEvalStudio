# Beginner's Guide to scSimEvalStudio

## 1. Welcome to `scSimEvalStudio`

**`scSimEvalStudio`** (version `0.99.9`) is a **point-and-click Shiny
web app** built to make single-cell and multiomics simulation
benchmarking simple and accessible—even if you are brand new to R.

Instead of writing scripts to run metrics and format dozens of plots,
`scSimEvalStudio` gives you a clean browser workspace where you can:

- Try **1-click example datasets** immediately to learn how the app
  works.
- Upload your own **scRNA-seq**, **scATAC-seq**, or **multiomics**
  `.rds` datasets (`SingleCellExperiment` or `Seurat`).
- Compare simulators visually on an easy **0 to 1 scale** (where **1.0 =
  best match** to your real dataset).
- Zoom, pan, customize, and download **600 DPI figures**, **Excel
  workbooks**, and **reproducible R scripts**.

> **Want the full metric definitions, statistical details, or R
> programming tutorials?** All underlying evaluation methods are
> documented separately on the **[scSimEval Core Package
> Documentation](https://kabilanbio.github.io/scSimEval/)**.

![Overview of the 4 simple stages inside scSimEvalStudio: Load Data, Run
Evaluation, Compare Rankings, and Explore & Export
Results.](workflow_diagram.png)

Overview of the 4 simple stages inside scSimEvalStudio: Load Data, Run
Evaluation, Compare Rankings, and Explore & Export Results.

------------------------------------------------------------------------

## 2. Step 1 — Install and Open the App

### Install from Bioconductor

\
`if`` ``(``!`[`requireNamespace`](https://rdrr.io/r/base/ns-load.html)`(``"BiocManager"``, quietly ``=`` ``TRUE``)``)`` ``{`\
`    `[`install.packages`](https://rdrr.io/r/utils/install.packages.html)`(``"BiocManager"``)`\
`}`\
`BiocManager``::`[`install`](https://bioconductor.github.io/BiocManager/reference/install.html)`(`[`c`](https://rdrr.io/r/base/c.html)`(``"scSimEval"``, ``"scSimEvalStudio"``)``)`

### Or Install from GitHub

\
`if`` ``(``!`[`requireNamespace`](https://rdrr.io/r/base/ns-load.html)`(``"remotes"``, quietly ``=`` ``TRUE``)``)`` ``{`\
`    `[`install.packages`](https://rdrr.io/r/utils/install.packages.html)`(``"remotes"``)`\
`}`\
`remotes``::`[`install_github`](https://remotes.r-lib.org/reference/install_github.html)`(``"kabilanbio/scSimEval"``)`\
`remotes``::`[`install_github`](https://remotes.r-lib.org/reference/install_github.html)`(``"kabilanbio/scSimEvalStudio"``)`

### Launch the Shiny Studio

\
[`library`](https://rdrr.io/r/base/library.html)`(`[`scSimEvalStudio`](https://kabilanbio.github.io/scSimEvalStudio/)`)`\
\
`# Configures shiny.maxRequestSize = 10 GiB by default for large multiomics .rds archives`\
[`launch_scSimEval_app`](https://kabilanbio.github.io/scSimEvalStudio/reference/launch_scSimEval_app.md)`(``)`

Your default web browser will open automatically. By default, the app
allows uploads up to **10 GiB** so large single-cell `.rds` files can be
loaded locally without errors.

------------------------------------------------------------------------

## 3. Step 2 — Load Data in the Data Hub Tab

When the app opens, click **Data Hub** in the top bar. You have **4 easy
options**:

1.  **Try a 1-Click Example Dataset (Recommended for Beginners)** Choose
    an included empirical benchmark—such as **Rice Bud** (6 simulators)
    or **Soybean Root** (3 simulators)—to populate every chart and table
    in seconds.
2.  **Upload Your Own Single-Cell Data (`scRNA-seq` or `scATAC-seq`)**
    Upload your real reference `.rds` file along with one or more
    simulated `.rds` files. Both `SingleCellExperiment` and `Seurat`
    `.rds` files are accepted (`Seurat` objects are converted
    automatically). If your files contain `cell_type` and `batch`
    columns, extra clustering, batch, and biological signal checks
    unlock automatically.
3.  **Upload Multiomics Data (RNA + ATAC)** Choose **Paired** (RNA and
    ATAC measured in the same cells) or **Unpaired** (measured in
    separate cells from the same tissue), upload your `.rds` files, and
    click **Run**.
4.  **Reload Previously Saved Results (`.rds` or `.csv`)** Already ran a
    benchmark earlier? Upload your saved `.rds` archive or `.csv` table
    to view and customize plots instantly without waiting for
    calculations to run again.

> **Tip for Very Large Datasets:** After configuring your files in
> **Data Hub**, click **Download R Script** to save a ready-to-run
> script that you can execute on a lab workstation or HPC server, then
> upload the saved `.rds` output back into **Data Hub** to explore the
> plots.

------------------------------------------------------------------------

## 4. Step 3 — Compare Simulators at a Glance

Open the **Comparative Bubble Matrix** tab to see how your simulators
rank:

- **How to Read the Scores:** Every metric is shown on a simple **0.0 to
  1.0 scale**, where **closer to 1.0 means a closer match** to your real
  biological dataset.
- **Comparative Bubble Matrix Figure:** The left bars show overall and
  category averages; the right grid shows individual metrics as circles.
  **Bigger circles = better scores**, and a **bold black outline**
  highlights the top-performing simulator for each metric.
- **Fidelity Leaderboard:** Switch to the second sub-tab for a clean,
  sortable ranking table that you can download as a `.csv` file.
- **Easy Filtering:** Use the sidebar controls to filter by dataset,
  modality (`scRNA-seq`, `scATAC-seq`, or `Combined`), specific
  simulators, or specific categories, and adjust figure width and height
  before downloading.

------------------------------------------------------------------------

## 5. Step 4 — Explore Interactive Charts (Visualizations Tab)

The **Visualizations** tab provides **8 focused chart views** so you can
inspect your results from every angle:

| Sub-Tab | What It Helps You See |
|:---|:---|
| **1. Evaluation Summary** | Overall and category-level bar charts and radar profiles comparing all simulators side by side. |
| **2. Distribution QC** | Visual checks showing whether simulated library sizes, gene/peak averages, and zero counts match your real data. |
| **3. Metric Heatmap** | Color-coded matrix displaying all simulator scores together in one view (switch between 0–1 scores and raw values). |
| **4. Metric Plots** | Zoom in on any single metric bar chart or compare simulator spread across a category using boxplots. |
| **5. PCA Ordination** | Simple 2D map showing which simulators sit closest to the **Ideal Reference** target. |
| **6. MDS Metric Space** | Visual map grouping simulators that behave similarly across evaluation metrics. |
| **7. Cell Embeddings (UMAP, t-SNE & PCA)** | Side-by-side or overlaid 2D cell plots colored by cell type, batch, or library size, plus a clean cluster quality summary table. |
| **8. Scalability Benchmark** | Compare simulator speed (runtime) and memory usage (RAM) with selectable units (seconds, minutes, MB, GB, or per-core). |

### Interactive Zoom, Pan & Publication Downloads

Every plot panel inside `scSimEvalStudio` includes:

- **Zoom & Pan Toolbar:** Zoom smoothly from **25% to 400%**, drag to
  pan around large figures, or click **Full View** to inspect plots in
  fullscreen mode.
- **High-Resolution Downloads:** Save any chart as a **600 DPI JPEG** or
  **Vector PDF** ready for papers, theses, and posters.
- **1-Click R Script Export:** Download a standalone `ggplot2` R script
  for any figure if you want to fine-tune colors or labels in R later.

------------------------------------------------------------------------

## 6. Step 5 — Export Results, Monitor Progress & Get Help

- **Benchmark Results & Export:** Browse, search, and filter the master
  results table (showing both raw values and 0–1 scores), and download a
  formatted **Excel workbook (`.xlsx`)**, **`.csv`** table, or full
  **`.rds`** session backup.
- **Logs:** Watch live progress messages (`INFO`, `WARNING`, `SUCCESS`)
  while benchmarks run, filter messages by type, or download a `.txt`
  log file for troubleshooting.
- **Help & Contact:** Access quick in-app tips, file format checklists,
  and contact details for the development team at ICAR-IASRI, New Delhi.

------------------------------------------------------------------------

## 7. Quick Verification (For Package Testing)

You can confirm from R that the bundled Shiny app and demo dataset load
properly:

\
[`library`](https://rdrr.io/r/base/library.html)`(`[`scSimEvalStudio`](https://kabilanbio.github.io/scSimEvalStudio/)`)`\
\
`app_dir`` ``<-`` `[`system.file`](https://rdrr.io/r/base/system.file.html)`(``"shiny"``, ``"scSimEvalApp"``, package ``=`` ``"scSimEvalStudio"``)`\
[`dir.exists`](https://rdrr.io/r/base/files2.html)`(``app_dir``)`\
`#> [1] TRUE`\
\
`app`` ``<-`` ``shiny``::`[`shinyAppDir`](https://rdrr.io/pkg/shiny/man/shinyApp.html)`(``app_dir``)`\
`#> Loading required package: shiny`\
`#> `\
`#> Attaching package: 'bslib'`\
`#> The following object is masked from 'package:utils':`\
`#> `\
`#>     page`\
`#> Warning: package 'ggplot2' was built under R version 4.6.2`\
`#> `\
`#> Attaching package: 'DT'`\
`#> The following objects are masked from 'package:shiny':`\
`#> `\
`#>     dataTableOutput, renderDataTable`\
[`class`](https://rdrr.io/r/base/class.html)`(``app``)`\
`#> [1] "shiny.appobj"`\
\
`demo_file`` ``<-`` `[`file.path`](https://rdrr.io/r/base/file.path.html)`(``app_dir``, ``"data"``, ``"demo_benchmark_data.rds"``)`\
`demo_obj`` ``<-`` `[`readRDS`](https://rdrr.io/r/base/readRDS.html)`(``demo_file``)`\
`demo_obj``$``methods`\
`#> [1] "scMultiSim" "scDesign3"  "MOSim"      "scCross"    "scMoMtF"   `\
`#> [6] "Matilda"`\
[`head`](https://rdrr.io/r/utils/head.html)`(``demo_obj``$``benchmark_summary_table``[``, `[`c`](https://rdrr.io/r/base/c.html)`(``"Method"``, ``"Category"``, ``"Metric"``, ``"Score"``)``]``, ``6``)`\
`#>       Method                      Category         Metric     Score`\
`#> 1 scMultiSim (I) Distributional Properties    Wasserstein 0.3676551`\
`#> 2 scMultiSim (I) Distributional Properties             KS 0.4675325`\
`#> 3 scMultiSim (I) Distributional Properties            MAD 0.4223376`\
`#> 4 scMultiSim (I) Distributional Properties  Bhattacharyya 0.6940634`\
`#> 5 scMultiSim (I) Distributional Properties Runs_Statistic 0.5600933`\
`#> 6 scMultiSim (I) Distributional Properties    NN_Mismatch 0.5628743`

------------------------------------------------------------------------

## 8. Session Information

\
[`sessionInfo`](https://rdrr.io/r/utils/sessionInfo.html)`(``)`\
`#> R version 4.6.1 (2026-06-24 ucrt)`\
`#> Platform: x86_64-w64-mingw32/x64`\
`#> Running under: Windows 11 x64 (build 26300)`\
`#> `\
`#> Matrix products: default`\
`#>   LAPACK version 3.12.1`\
`#> `\
`#> locale:`\
`#> [1] LC_COLLATE=English_India.utf8  LC_CTYPE=English_India.utf8   `\
`#> [3] LC_MONETARY=English_India.utf8 LC_NUMERIC=C                  `\
`#> [5] LC_TIME=English_India.utf8    `\
`#> `\
`#> time zone: Asia/Calcutta`\
`#> tzcode source: internal`\
`#> `\
`#> attached base packages:`\
`#> [1] stats     graphics  grDevices utils     datasets  methods   base     `\
`#> `\
`#> other attached packages:`\
`#> [1] scSimEval_0.99.18      Matrix_1.7-6           DT_0.34.0             `\
`#> [4] ggplot2_4.0.4          bslib_0.12.0           shiny_1.14.0          `\
`#> [7] scSimEvalStudio_0.99.9`\
`#> `\
`#> loaded via a namespace (and not attached):`\
`#>   [1] RColorBrewer_1.1-3          jsonlite_2.0.0             `\
`#>   [3] magrittr_2.0.5              spatstat.utils_3.2-5       `\
`#>   [5] farver_2.1.2                rmarkdown_2.32             `\
`#>   [7] fs_2.1.0                    ragg_1.5.2                 `\
`#>   [9] vctrs_0.7.3                 ROCR_1.0-12                `\
`#>  [11] memoise_2.0.1               spatstat.explore_3.8-3     `\
`#>  [13] htmltools_0.5.9             S4Arrays_1.13.0            `\
`#>  [15] SparseArray_1.13.2          sass_0.4.10                `\
`#>  [17] sctransform_0.4.3           parallelly_1.48.0          `\
`#>  [19] KernSmooth_2.23-26          fontawesome_0.5.3          `\
`#>  [21] htmlwidgets_1.6.4           desc_1.4.3                 `\
`#>  [23] ica_1.0-3                   plyr_1.8.9                 `\
`#>  [25] plotly_4.12.1               zoo_1.9-1                  `\
`#>  [27] cachem_1.1.0                igraph_2.3.3               `\
`#>  [29] mime_0.13                   lifecycle_1.0.5            `\
`#>  [31] pkgconfig_2.0.3             R6_2.6.1                   `\
`#>  [33] fastmap_1.2.0               MatrixGenerics_1.25.0      `\
`#>  [35] fitdistrplus_1.2-6          future_1.82.0              `\
`#>  [37] digest_0.6.39               patchwork_1.3.2            `\
`#>  [39] S4Vectors_0.51.10           tensor_1.5.1               `\
`#>  [41] Seurat_5.5.1                RSpectra_0.16-2            `\
`#>  [43] irlba_2.3.7                 crosstalk_1.2.2            `\
`#>  [45] textshaping_1.0.5           GenomicRanges_1.65.4       `\
`#>  [47] progressr_1.1.0             spatstat.sparse_3.2-0      `\
`#>  [49] polyclip_1.10-7             httr_1.4.9                 `\
`#>  [51] abind_1.4-8                 compiler_4.6.1             `\
`#>  [53] withr_3.0.3                 S7_0.2.2                   `\
`#>  [55] bsicons_0.1.2               BiocParallel_1.47.0        `\
`#>  [57] fastDummies_1.7.6           MASS_7.3-66                `\
`#>  [59] DelayedArray_0.39.8         ggsci_5.2.0                `\
`#>  [61] tools_4.6.1                 lmtest_0.9-40              `\
`#>  [63] otel_0.2.0                  zip_3.0.2                  `\
`#>  [65] httpuv_1.6.17               future.apply_1.21.0        `\
`#>  [67] goftest_1.2-3               glue_1.8.1                 `\
`#>  [69] nlme_3.1-171                promises_1.5.0             `\
`#>  [71] grid_4.6.1                  Rtsne_0.17                 `\
`#>  [73] cluster_2.1.8.3             reshape2_1.4.5             `\
`#>  [75] generics_0.1.4              spatstat.data_3.1-9        `\
`#>  [77] gtable_0.3.6                tidyr_1.3.2                `\
`#>  [79] data.table_1.18.6.1         sp_2.2-3                   `\
`#>  [81] XVector_0.52.0              spatstat.geom_3.8-3        `\
`#>  [83] BiocGenerics_0.59.12        RcppAnnoy_0.0.23           `\
`#>  [85] ggrepel_0.9.8               RANN_2.6.3                 `\
`#>  [87] pillar_1.11.1               stringr_1.6.0              `\
`#>  [89] spam_2.11-4                 RcppHNSW_0.7.0             `\
`#>  [91] later_1.4.8                 splines_4.6.1              `\
`#>  [93] dplyr_1.2.1                 lattice_0.22-9             `\
`#>  [95] deldir_2.0-4                survival_3.8-12            `\
`#>  [97] tidyselect_1.2.1            SingleCellExperiment_1.35.2`\
`#>  [99] CDI_1.11.0                  miniUI_0.1.2               `\
`#> [101] pbapply_1.7-5               knitr_1.52                 `\
`#> [103] gridExtra_2.3.1             IRanges_2.47.5             `\
`#> [105] Seqinfo_1.3.2               SummarizedExperiment_1.43.0`\
`#> [107] scattermore_1.2             stats4_4.6.1               `\
`#> [109] xfun_0.60                   Biobase_2.73.2             `\
`#> [111] matrixStats_1.5.0           stringi_1.8.9              `\
`#> [113] yaml_2.3.12                 evaluate_1.0.5             `\
`#> [115] codetools_0.2-20            tibble_3.3.1               `\
`#> [117] cli_3.6.6                   uwot_0.2.5                 `\
`#> [119] xtable_1.8-8                reticulate_1.47.0          `\
`#> [121] systemfonts_1.3.2           jquerylib_0.1.4            `\
`#> [123] dichromat_2.0-1             Rcpp_1.1.2                 `\
`#> [125] spatstat.random_3.5-2       globals_0.20.0             `\
`#> [127] png_0.1-9                   spatstat.univar_3.2-0      `\
`#> [129] parallel_4.6.1              pkgdown_2.2.1              `\
`#> [131] dotCall64_1.2               listenv_1.1.0              `\
`#> [133] viridisLite_0.4.3           scales_1.4.0               `\
`#> [135] ggridges_0.5.7              writexl_2.0.1              `\
`#> [137] SeuratObject_5.4.0          openxlsx_4.2.9             `\
`#> [139] purrr_1.2.2                 rlang_1.3.0                `\
`#> [141] cowplot_1.2.0`
