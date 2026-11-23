# Launch Interactive scSimEval Benchmarking Studio

Launches the companion Shiny web application bundled in scSimEvalStudio.
Provides a graphical interface to upload `SingleCellExperiment`
biological reference and simulated datasets (scRNA-seq, scATAC-seq,
paired or unpaired multiomics), execute the 56-measure evaluation suite
across 8 canonical categories, explore diagnostic figures interactively,
and export publication-quality figures, standalone HPC R scripts, and
Excel/PDF reports.

## Usage

``` r
launch_scSimEval_app(
  port = NULL,
  host = "127.0.0.1",
  launch.browser = interactive(),
  maxRequestSize = 10 * 1024^3
)
```

## Arguments

- port:

  Optional port number for the local web server. Default is `NULL`
  (random open port).

- host:

  Character string specifying the IP address to listen on. Defaults to
  `"127.0.0.1"`.

- launch.browser:

  Logical, whether to automatically open the default web browser.
  Defaults to
  [`interactive()`](https://rdrr.io/r/base/interactive.html).

- maxRequestSize:

  Numeric maximum upload file size in bytes. Defaults to `10 * 1024^3`
  (10 GiB).

## Value

A `shiny.appobj` returned invisibly when
[`shiny::runApp()`](https://rdrr.io/pkg/shiny/man/runApp.html) exits
cleanly.

## Details

The interactive scSimEvalStudio web application organizes single-cell
and multiomics simulation benchmarking into 8 modular navigation tabs:

1.  **Home**: Executive KPI dashboard and overview of the 8 canonical
    evaluation categories (56 curated measures).

2.  **Data Hub**: Supports 4 data ingestion modes: (1) unimodal
    `scRNA-seq` (44 active measures across 7 categories), (2) unimodal
    `scATAC-seq` (38 active measures across 6 categories), (3) paired
    and unpaired `Single-Cell Multiomics` (all 56 measures across 8
    categories), and (4) pre-computed benchmark session archives (`.rds`
    / `.csv`). Includes 1-click *Oryza sativa* Rice Bud and *Glycine
    max* Soybean Root empirical benchmarks and a 1-click standalone
    HPC/Workstation R script generator.

3.  **Comparative Bubble Matrix**: Dual-encoded visual ranking figure
    ([`scSimEval::plot_benchmark_bubble_matrix()`](https://kabilanbio.github.io/scSimEval/reference/plot_benchmark_bubble_matrix.html))
    and interactive **Fidelity Leaderboard**
    ([`scSimEval::compute_method_leaderboard()`](https://kabilanbio.github.io/scSimEval/reference/compute_method_leaderboard.html)).

4.  **Visualizations**: Eight diagnostic sub-panels (*Evaluation
    Summary*, *Distribution QC* across 18 empirical properties, *Metric
    Heatmap*, *Metric Plots*, *PCA Ordination* anchored to the Ideal
    Reference Anchor \\\mathbf{1}\\, *MDS Metric Space*, *Cell
    Embeddings* \[UMAP, t-SNE, PCA with ASW and ARI\], and *Scalability
    Benchmark* \[`core_seconds` and `MiB/core`\]), all equipped with a
    25%–400% interactive step-zoom, drag-to-pan, and 600% fullscreen
    lightbox viewer.

5.  **Benchmark Results & Export**: Reproducible `.rds` session export,
    filterable `DT` master table (`Score_Raw` and direction-aligned
    `Score` in \\\[0, 1\]\\), and multi-sheet Excel (`.xlsx`) and `.csv`
    exports.

6.  **Help & Getting Started**: Interactive workflow diagrams, S4
    `SingleCellExperiment` preparation recipes, and dynamic
    `BiocParallel` multi-core scheduling guidelines.

7.  **Logs**: Real-time WebSocket diagnostic console streaming `INFO`,
    `NOTE`, `WARNING`, `ERROR`, and `SUCCESS` events.

8.  **Contact**: Institutional attribution and research team directory
    at the Division of Agricultural Bioinformatics, ICAR-IASRI, New
    Delhi.

## See also

[`evaluate_simulation_accuracy`](https://kabilanbio.github.io/scSimEval/reference/evaluate_simulation_accuracy.html),
[`evaluate_multiomics_accuracy`](https://kabilanbio.github.io/scSimEval/reference/evaluate_multiomics_accuracy.html),
[`normalize_bubble_scores`](https://kabilanbio.github.io/scSimEval/reference/normalize_bubble_scores.html),
[`plot_benchmark_bubble_matrix`](https://kabilanbio.github.io/scSimEval/reference/plot_benchmark_bubble_matrix.html)

## Examples

``` r
app_dir <- system.file("shiny", "scSimEvalApp", package = "scSimEvalStudio")
nzchar(app_dir)
#> [1] TRUE
if (interactive()) {
  launch_scSimEval_app()
}
```
