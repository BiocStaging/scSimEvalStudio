#' Launch Interactive scSimEval Benchmarking Studio
#'
#' Launches the companion Shiny web application bundled in \pkg{scSimEvalStudio}.
#' Provides a graphical interface to upload \code{SingleCellExperiment} biological
#' reference and simulated datasets (scRNA-seq, scATAC-seq, paired or unpaired
#' multiomics), execute the 56-measure evaluation suite across 8 canonical
#' categories, explore diagnostic figures interactively, and export
#' publication-quality figures, standalone HPC R scripts, and Excel/PDF reports.
#'
#' @details
#' The interactive \pkg{scSimEvalStudio} web application organizes single-cell
#' and multiomics simulation benchmarking into 8 modular navigation tabs:
#' \enumerate{
#'   \item \strong{Home}: Executive KPI dashboard and overview of the 8 canonical
#'     evaluation categories (56 curated measures).
#'   \item \strong{Data Hub}: Supports 4 data ingestion modes: (1) unimodal
#'     \code{scRNA-seq} (44 active measures across 7 categories), (2) unimodal
#'     \code{scATAC-seq} (38 active measures across 6 categories), (3) paired
#'     and unpaired \code{Single-Cell Multiomics} (all 56 measures across 8
#'     categories), and (4) pre-computed benchmark session archives
#'     (\code{.rds} / \code{.csv}). Includes 1-click \emph{Oryza sativa} Rice Bud
#'     and \emph{Glycine max} Soybean Root empirical benchmarks and a 1-click
#'     standalone HPC/Workstation R script generator.
#'   \item \strong{Comparative Bubble Matrix}: Dual-encoded visual ranking figure
#'     (\code{scSimEval::plot_benchmark_bubble_matrix()}) and interactive
#'     \strong{Fidelity Leaderboard} (\code{scSimEval::compute_method_leaderboard()}).
#'   \item \strong{Visualizations}: Eight diagnostic sub-panels (\emph{Evaluation
#'     Summary}, \emph{Distribution QC} across 18 empirical properties,
#'     \emph{Metric Heatmap}, \emph{Metric Plots}, \emph{PCA Ordination}
#'     anchored to the Ideal Reference Anchor \eqn{\mathbf{1}}, \emph{MDS Metric
#'     Space}, \emph{Cell Embeddings} [UMAP, t-SNE, PCA with ASW and ARI], and
#'     \emph{Scalability Benchmark} [\code{core_seconds} and \code{MiB/core}]),
#'     all equipped with a 25\%--400\% interactive step-zoom, drag-to-pan, and
#'     600\% fullscreen lightbox viewer.
#'   \item \strong{Benchmark Results & Export}: Reproducible \code{.rds} session
#'     export, filterable \code{DT} master table (\code{Score_Raw} and
#'     direction-aligned \code{Score} in \eqn{[0, 1]}), and multi-sheet Excel
#'     (\code{.xlsx}) and \code{.csv} exports.
#'   \item \strong{Help & Getting Started}: Interactive workflow diagrams, S4
#'     \code{SingleCellExperiment} preparation recipes, and dynamic
#'     \code{BiocParallel} multi-core scheduling guidelines.
#'   \item \strong{Logs}: Real-time WebSocket diagnostic console streaming
#'     \code{INFO}, \code{NOTE}, \code{WARNING}, \code{ERROR}, and
#'     \code{SUCCESS} events.
#'   \item \strong{Contact}: Institutional attribution and research team
#'     directory at the Division of Agricultural Bioinformatics, ICAR-IASRI,
#'     New Delhi.
#' }
#'
#' @param port Optional port number for the local web server. Default is
#'   \code{NULL} (random open port).
#' @param host Character string specifying the IP address to listen on.
#'   Defaults to \code{"127.0.0.1"}.
#' @param launch.browser Logical, whether to automatically open the default web
#'   browser. Defaults to \code{interactive()}.
#' @param maxRequestSize Numeric maximum upload file size in bytes. Defaults to
#'   \code{10 * 1024^3} (10 GiB).
#'
#' @return A \code{shiny.appobj} returned invisibly when \code{shiny::runApp()}
#'   exits cleanly.
#' @seealso \code{\link[scSimEval]{evaluate_simulation_accuracy}},
#'   \code{\link[scSimEval]{evaluate_multiomics_accuracy}},
#'   \code{\link[scSimEval]{normalize_bubble_scores}},
#'   \code{\link[scSimEval]{plot_benchmark_bubble_matrix}}
#' @export
#' @examples
#' app_dir <- system.file("shiny", "scSimEvalApp", package = "scSimEvalStudio")
#' nzchar(app_dir)
#' if (interactive()) {
#'   launch_scSimEval_app()
#' }
launch_scSimEval_app <- function(port = NULL,
                                 host = "127.0.0.1",
                                 launch.browser = interactive(),
                                 maxRequestSize = 10 * 1024^3) {
  options(shiny.maxRequestSize = maxRequestSize)
  app_dir <- system.file("shiny", "scSimEvalApp", package = "scSimEvalStudio")
  if (!nzchar(app_dir) || !dir.exists(app_dir)) {
    stop("Could not locate 'scSimEvalApp' inside installed 'scSimEvalStudio'.", call. = FALSE)
  }
  message("Starting scSimEval Benchmarking Studio...")
  message(sprintf("Listening on http://%s:%s", host, ifelse(is.null(port), "random", port)))
  shiny::runApp(
    appDir = app_dir,
    port = port,
    host = host,
    launch.browser = launch.browser,
    display.mode = "normal"
  )
}
