#'Render the Rmarkdown file and move the output
#' @export
rmd_create_doc <- function(run.dir, rmd.file, params, 
                           final.dir = NA, final.title = NA,
                           nocopy = TRUE, nobib = TRUE, doctype= "html",
                           bibtex.dir, bibtex.file, csl.file, code.dir, header.file
                           ) {

  setwd(run.dir)
  # Copy bibliography files
  if (!nobib) {
    file.copy(from = paste0(bibtex.dir, bibtex.file),
              to = paste0(run.dir, bibtex.file),
              overwrite=TRUE)
    file.copy(from = paste0(bibtex.dir, csl.file),
              to = paste0(run.dir, csl.file),
              overwrite=TRUE)
    file.copy(from = paste0(code.dir, header.file),
              to = paste0(run.dir, header.file),
              overwrite=TRUE)
  }

  # Render doc and move to destination dir
  rmarkdown::render(file.path(run.dir, paste0(rmd.file, ".Rmd")), 
                    params = params, output_format = paste0(doctype, "_document"))
  if (!nocopy) {
    file.copy(from = file.path(run.dir, paste0(rmd.file, ".", doctype)),
            to = file.path(final.dir, paste0(final.title, ".", doctype)),
            overwrite=TRUE)
  }
}

