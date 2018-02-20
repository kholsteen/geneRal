# Function to Render the Rmarkdown file and place the files in the proper locations

rmd_create_pdf <- function(run.dir, rmd.file, final.dir, final.title) {
  bibtex.dir <- paste0(home.dir, "/Documents/My Documents/Research/Migraine_App/DissertationProposal/")
  bibtex.file <- "Migraine App.bib"
  csl.file <-"american-medical-association-no-url.csl"
  
  setwd(run.dir)
  # Copy bibliography files
  file.copy(from = paste0(bibtex.dir, bibtex.file), 
            to = paste0(run.dir, bibtex.file),
            overwrite=TRUE)
  file.copy(from = paste0(bibtex.dir, csl.file), 
            to = paste0(run.dir, csl.file),
            overwrite=TRUE)
  
  # Render pdf doc and move to destination dir
  rmarkdown::render(paste0(rmd.file, ".Rmd"))
  file.copy(from = paste0(rmd.file, ".pdf"), 
            to = paste0(final.dir, final.title, ".pdf"),
            overwrite=TRUE)
}

