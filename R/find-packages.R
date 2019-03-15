#' Search through files for packages used; make sure DESCRIPTION is up to date.
#' @export
#' @importFrom dplyr %>%

find_packages <- function(input_dir, output_dir) {

  files <- list.files(path = input_dir)
  packages <- purrr::map(files, function(f) {
    lines_all <- readLines(file.path(input_dir, f))
    if (!is.null(lines_all)) {
      pattern <- "[a-zA-z0-9]{3,}::"
      line_nums <- grep(pattern, lines_all)

      if (!is.null(line_nums)) {
        return(regmatches(lines_all[line_nums], regexec(pattern, lines_all[line_nums])) %>%
          unlist() %>% unique() %>% sort() )
      } else { return(NULL)}
    }
  }) %>% unlist() %>% unique() %>% sort() %>% str_replace(pattern = "::", replacement = ",")

  ## Next step would be to grep through the description and just output the ones not already there.

  readr::write_csv(tibble::tibble(packages = packages), file.path(output_dir, "packages.csv"))

}
