

pathPrep <- function(path = "clipboard") {
  
  # Convert a Windows path on the clipboard to a path accepted by R
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