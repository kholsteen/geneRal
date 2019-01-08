# RStudio has many useful shortcuts that can help make your programming more efficient by reducing the need to reach for the mouse and point and click your way around code and RStudio. These can be viewed by using a little known but extremely useful keyboard shortcut:
#
#   Alt+Shift+K
# This will display the default shortcuts in RStudio. It is worth spending time identifying which of these could be useful in your work and practising interacting with RStudio rapidly with minimal reliance on the mouse. Some more useful shortcuts are listed below. There are many more gems to find that could boost your R writing productivity:
#
#   Ctl+Z/Shift+Z: Undo/Redo.
# Ctl+Enter: Execute the current line or code selection in the Source pane.
# Ctl+Alt+R: Execute all the R code in the currently open file in the Source pane.
# Ctl+Left/Right: Navigate code quickly, word by word.
# Home/End: Navigate to the beginning/end of the current line.
# Alt+Shift+Up/Down: Duplicate the current line up or down.
# Ctl+D: Delete the current line.


#' Convert a Windows path on the clipboard to a path accepted by R
#' @description Specifically, it converts the forward slashes to backslashes
#' @param path file path to convert; defaults to the path on the clipboard
#' @export
pathPrep <- function(path = "clipboard") {

  # from https://stackoverflow.com/questions/8425409/file-path-issues-in-r-using-windows-hex-digits-in-character-string-error/47251807

  y <- if (path == "clipboard") {
    readClipboard()
  } else {
    cat("Please enter the path:\n\n")
    readline()
  }
  x <- chartr("\\", "/", y)
  writeClipboard(x)
  return(x)
}

#' Write lines to a file if the path is given
#' @description Write lines to a file if the connection is not null; else just cat the lines.
#' This is useful for logging progress of a running script.
#' @param lines the lines to write
#' @param file the file destination; default NULL 
#' @export
appendIfFile <- function(lines, file = NULL) {

  if (!is.null(file)) {
    if ("data.frame" %in% class(lines)) {
      write.table(lines, file, append = TRUE ,sep="\t",
                  row.names = FALSE, col.names = TRUE)
    } else {
      write(lines, file, append = TRUE)
    }
  } else {
    cat(file)
  }
}


#' Round to the nearest anything.
#' @description From http://r.789695.n4.nabble.com/Is-there-in-R-a-function-equivalent-to-the-mround-as-found-in-most-spreadsheets-td855895.html

#' @export
mround <- function(x,base){
  base*round(x/base)
}

#' Emulate ggplot colors
#' @param n the number of colors needed
#' @export
#' @description from https://stackoverflow.com/questions/8197559/emulate-ggplot2-default-color-palette
#' @example plot(c(1:10), col = gg_color_hue(10), pch = 16, cex = 10)
gg_color_hue <- function(n) {
  hues = seq(15, 375, length = n + 1)
  hcl(h = hues, l = 65, c = 100)[1:n]
}





