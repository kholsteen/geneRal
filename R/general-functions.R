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
