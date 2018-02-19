# Render the Rmarkdown file and place the files in the proper locations

home.dir <- "C:/Users/Katherine Holsteen/"
final.dir <- paste0(home.dir, "Box Sync/Migraine/Surveys/Triggers/")
final.title <- "TriggerFrequencyComparison"

rmd.file <- "calc_trigger_freqs"
# Home dir must be the location of the rmd file to render
run.dir <- paste0(final.dir, "Rmd-files/")
bibtex.dir <- paste0(home.dir, "/Documents/My Documents/Research/Migraine_App/DissertationProposal/")
bibtex.file <- "Migraine App.bib"
csl.file <-"american-medical-association-no-url.csl"

setwd(run.dir)

# Copy bibliography files
file.copy(from = paste0(bibtex.dir, bibtex.file), 
          to = paste0(run.dir, bibtex.file))
file.copy(from = paste0(bibtex.dir, csl.file), 
          to = paste0(run.dir, csl.file))

# Render pdf doc and move to destination dir
rmarkdown::render(paste0(rmd.file, ".Rmd"))
file.copy(from = paste0(rmd.file, ".pdf"), 
          to = paste0(final.dir, final.title, ".pdf"))

