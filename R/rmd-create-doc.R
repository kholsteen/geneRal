#'Render Rmarkdown file and potentially copy the output to a new location
#' @param run.dir the location of the rmd file to render
#' @param rmd.file the name of the rmd file to render
#' @param params the list of parameters to pass into the rmd file
#' @param doctype the output file format (string): pdf, html, or docx
#' @param final.dir the destination location for the rendered file
#' @param final.title the destination title for the rendered file
#' @param nocopy boolean: TRUE if you do NOT want to copy the rendered file to a new location
#' @param nobib boolean: TRUE if you do NOT want to copy the bibtext bibliography into the run.dir (i.e. if you don't have citations in this document)
#' @param bibtex.dir the location of the bibtex file for the citations
#' @param bibtex.file the name of the bibtext file
#' @param csl.file the name of the csl file giving the citation formal
#' @export
rmd_create_doc <- function(run.dir, rmd.file, params,
                           final.dir = NA, final.title = NA,
                           nocopy = TRUE, nobib = TRUE, doctype= "html",
                           bibtex.dir, bibtex.file, csl.file, code.dir, header.file
                           ) {

  #setwd(run.dir)
  ## Copy bibliography files
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

  # Render doc
  rmarkdown::render(file.path(run.dir, paste0(rmd.file, ".Rmd")),
                    params = params, output_format = paste0(doctype, "_document"))

  ## Move to destination directory
  if (!nocopy) {
    file.copy(from = file.path(run.dir, paste0(rmd.file, ".", doctype)),
            to = file.path(final.dir, paste0(final.title, ".", doctype)),
            overwrite=TRUE)
  }
}

