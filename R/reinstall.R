#' Reinstall streamBasic and restart R
#' @export
reinstall <- function(dir, pkg, others = NULL) {
  devtools::build(file.path(dir, pkg))
  devtools::install(file.path(dir, pkg))
  .rs.restartR()
  require(pkg, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)
  for (p in others) {
    require(p, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)
  }
}
