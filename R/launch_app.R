#' Launch Interactive scSimEval Benchmarking Studio
#'
#' Launches the companion Shiny web application bundled in \pkg{scSimEvalStudio}.
#' Provides a graphical interface to upload \code{SingleCellExperiment} biological
#' reference and simulated datasets (scRNA-seq, scATAC-seq, paired or unpaired
#' multiomics), inspect 56 evaluation metrics, explore diagnostic figures
#' interactively, and export high-resolution plots and Excel/PDF reports.
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
