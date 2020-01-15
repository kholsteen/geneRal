#' Print elapsed time in hours
#' @export
time_in_hours <- function(toc_object) {
  if (length(toc_object$msg) > 0) {
    msg <- paste0(toc_object$msg, ":")
  } else {
    msg <- ""
  }
  cat(paste(msg,
            sprintf("%.2f",(toc_object$toc - toc_object$tic)/3600),
            "hours\n"))
}
