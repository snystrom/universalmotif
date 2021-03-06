% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make_DBscores.R
\name{make_DBscores}
\alias{make_DBscores}
\title{Create P-value databases.}
\usage{
make_DBscores(db.motifs, method = c("PCC", "EUCL", "SW", "KL", "WEUCL",
  "ALLR", "BHAT", "HELL", "WPCC", "SEUCL", "MAN", "ALLR_LL"),
  shuffle.db = TRUE, shuffle.k = 3, shuffle.method = "linear",
  rand.tries = 1000, widths = 5:30, min.position.ic = 0,
  normalise.scores = c(FALSE, TRUE), min.overlap = 6, min.mean.ic = 0.25,
  progress = TRUE, nthreads = 1, tryRC = TRUE, score.strat = c("sum",
  "a.mean", "g.mean", "median", "wa.mean", "wg.mean", "fzt"))
}
\arguments{
\item{db.motifs}{\code{list} Database motifs.}

\item{method}{\code{character(1)} One of PCC, EUCL, SW, KL, ALLR, BHAT, HELL,
SEUCL, MAN, ALLR_LL, WEUCL, WPCC. See details.}

\item{shuffle.db}{\code{logical(1)} Deprecated. Does nothing.
generate random motifs with \code{\link[=create_motif]{create_motif()}}.}

\item{shuffle.k}{\code{numeric(1)} See \code{\link[=shuffle_motifs]{shuffle_motifs()}}.}

\item{shuffle.method}{\code{character(1)} See \code{\link[=shuffle_motifs]{shuffle_motifs()}}.}

\item{rand.tries}{\code{numeric(1)} Approximate number of comparisons
to perform for every combination of \code{widths}.}

\item{widths}{\code{numeric} Motif widths to use in P-value database calculation.}

\item{min.position.ic}{\code{numeric(1)} Minimum information content required between
individual alignment positions for it to be counted in the final alignment
score. It is recommended to use this together with \code{normalise.scores = TRUE},
as this will help punish scores resulting from only a fraction of an
alignment.}

\item{normalise.scores}{\code{logical(1)} Favour alignments which leave fewer
unaligned positions, as well as alignments between motifs of similar length.
Similarity scores are multiplied by the ratio of
aligned positions to the total number of positions in the larger motif,
and the inverse for distance scores.}

\item{min.overlap}{\code{numeric(1)} Minimum overlap required when aligning the
motifs. Setting this to a number higher then the width of the motifs
will not allow any overhangs. Can also be a number between 0 and 1,
representing the minimum fraction that the motifs must overlap.}

\item{min.mean.ic}{\code{numeric(1)} Minimum mean information content between the
two motifs for an alignment to be scored. This helps prevent scoring
alignments between low information content regions of two motifs.}

\item{progress}{\code{logical(1)} Show progress.}

\item{nthreads}{\code{numeric(1)} Run \code{\link[=compare_motifs]{compare_motifs()}} in parallel with \code{nthreads}
threads. \code{nthreads = 0} uses all available threads.}

\item{tryRC}{\code{logical(1)} Try the reverse complement of the motifs as well,
report the best score.}

\item{score.strat}{\code{character(1)} How to handle column scores calculated from
motif alignments. "sum": add up all scores. "a.mean": take the arithmetic
mean. "g.mean": take the geometric mean. "median": take the median.
"wa.mean", "wg.mean": weighted arithmetic/geometric mean. "fzt": Fisher
Z-transform. Weights are the
total information content shared between aligned columns.}
}
\value{
A \code{DataFrame} with score distributions for the
input database. If more than one \code{\link[=make_DBscores]{make_DBscores()}} run occurs (i.e. args
\code{method}, \code{normalise.scores} or \code{score.strat} are longer than 1), then
the function args are included in the \code{metadata} slot.
}
\description{
Generate data used by \code{\link[=compare_motifs]{compare_motifs()}} for P-value calculations. By default,
\code{\link[=compare_motifs]{compare_motifs()}} uses an internal database based on the JASPAR2018 core motifs
(Khan et al. 2018). Parameters for distributions are
are estimated for every combination of motif \code{widths}.
}
\details{
See \code{\link[=compare_motifs]{compare_motifs()}} for more info on comparison parameters.

To replicate the internal \pkg{universalmotif} DB scores, run
\code{\link[=make_DBscores]{make_DBscores()}} with the default settings. Note that this will be
a slow process.

Arguments \code{widths}, \code{method}, \code{normalise.scores} and \code{score.strat} are
vectorized; all combinations will be attempted.
}
\examples{
\dontrun{
library(MotifDb)
motifs <- convert_motifs(MotifDb[1:100])
scores <- make_DBscores(motifs, method = "PCC")
compare_motifs(motifs, 1:100, db.scores = scores)
}

}
\references{
Khan A, Fornes O, Stigliani A, Gheorghe M, Castro-Mondragon JA,
van der Lee R, Bessy A, Cheneby J, Kulkarni SR, Tan G, Baranasic
D, Arenillas DJ, Sandelin A, Vandepoele K, Lenhard B, Ballester B,
Wasserman WW, Parcy F, Mathelier A (2018). “JASPAR 2018: update of
the open-access database of transcription factor binding profiles
and its web framework.” \emph{Nucleic Acids Research}, \emph{46}, D260-D266.
}
\seealso{
\code{\link[=compare_motifs]{compare_motifs()}}
}
\author{
Benjamin Jean-Marie Tremblay, \email{b2tremblay@uwaterloo.ca}
}
