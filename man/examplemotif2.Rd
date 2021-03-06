% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{examplemotif2}
\alias{examplemotif2}
\title{Another example motif in \code{universalmotif} format.}
\format{
\linkS4class{universalmotif}
}
\usage{
examplemotif2
}
\description{
A simple DNA motif with a non-empty \code{multifreq} slot.
To recreate to this motif:
\code{add_multifreq(examplemotif, DNAStringSet(rep(c("CAAAACC", "CTTTTCC"), 3)))}
}
\keyword{datasets}
