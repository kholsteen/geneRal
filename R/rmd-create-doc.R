#'Render the Rmarkdown file and move the output
#' @export
rmd_create_doc <- function(run.dir, rmd.file, final.dir = NA, final.title = NA,
                           nocopy = TRUE, nobib = TRUE, doctype= "html",
                           bibtex.dir, bibtex.file, csl.file, code.dir, header.file
                           ) {

  setwd(run.dir)
  # Copy bibliography files
  if (!nobib) {
    file.copy(from = file.path(bibtex.dir, bibtex.file),
              to = file.path(run.dir, bibtex.file),
              overwrite=TRUE)
    file.copy(from = file.path(bibtex.dir, csl.file),
              to = file.path(run.dir, csl.file),
              overwrite=TRUE)
    file.copy(from = file.path(code.dir, header.file),
              to = file.path(run.dir, header.file),
              overwrite=TRUE)
  }

  # Render doc and move to destination dir
  rmarkdown::render(file.path(run.dir, paste0(rmd.file, ".Rmd")))
  if (!nocopy) {
    file.copy(from = file.path(run.dir, paste0(rmd.file, ".", doctype)),
            to = file.path(final.dir, paste0(final.title, ".", doctype)),
            overwrite=TRUE)
  }
}

