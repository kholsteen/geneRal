% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/general-functions.R
\name{appendIfFile}
\alias{appendIfFile}
\title{Write lines to a file if the path is given}
\usage{
appendIfFile(lines, file = NULL)
}
\arguments{
\item{lines}{the lines to write}

\item{file}{the file destination; default NULL}
}
\description{
Write lines to a file if the connection is not null; else just cat the lines.
This is useful for logging progress of a running script.
}
