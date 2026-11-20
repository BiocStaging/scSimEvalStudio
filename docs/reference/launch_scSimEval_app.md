# Launch Interactive scSimEval Benchmarking Studio

Launches the companion Shiny web application bundled in `scSimEvalStudio`. Provides a graphical interface to upload `SingleCellExperiment` biological reference and simulated datasets (scRNA-seq, scATAC-seq, paired or unpaired multiomics), execute the 56-measure evaluation suite across 8 canonical categories, explore diagnostic figures interactively, and export publication-quality figures, standalone HPC R scripts, and Excel/PDF reports.

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

- `port`: Optional port number for the local web server. Default is `NULL` (random open port).
- `host`: Character string specifying the IP address to listen on. Defaults to `"127.0.0.1"`.
- `launch.browser`: Logical, whether to automatically open the default web browser. Defaults to `interactive()`.
- `maxRequestSize`: Numeric maximum upload file size in bytes. Defaults to `10 * 1024^3` (10 GiB).

## Value

A `shiny.appobj` returned invisibly when `shiny::runApp()` exits cleanly.

## Details

The interactive `scSimEvalStudio` web application organizes single-cell and multiomics simulation benchmarking into 8 modular navigation tabs (`Home`, `Data Hub`, `Comparative Bubble Matrix`, `Visualizations`, `Benchmark Results & Export`, `Help & Getting Started`, `Logs`, and `Contact`).

## Examples

``` r
app_dir <- system.file("shiny", "scSimEvalApp", package = "scSimEvalStudio")
nzchar(app_dir)
#> [1] TRUE
if (interactive()) {
  launch_scSimEval_app()
}
```
