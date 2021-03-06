\name{labels.dendrogram}
\alias{Rcpp_labels_dendrogram}
\alias{labels.dendrogram}
\alias{stats_labels.dendrogram}
\title{Find Labels from a dendrogram Object using Rcpp}
\source{
R-devel-mailing list.
}
\usage{
\method{labels}{dendrogram}(object, warn=FALSE, ...)
}
\arguments{
  \item{object}{a dendrogram object.}

  \item{warn}{logical (FALSE) - should the user be warned
  if reverting to default? (I set it to FALSE since it can
  be very noisy sometimes...)}

  \item{...}{not used.}
}
\value{
A vector of labels from the dendrogram leaves. This is
often a character vector, but there are cases it might be
integer.
}
\description{
Extract the leaves labels from a dendrogram object.
}
\examples{
dend <- as.dendrogram(hclust(dist(USArrests)))

labels(dend)

require(microbenchmark)
microbenchmark(stats_labels.dendrogram(dend),
               dendextendRcpp::labels.dendrogram(dend),
               times = 100)
# about 30 times faster. It is faster the larger the tree is.
}
\author{
Romain Francois, Dirk Eddelbuettel, Tal Galili
}
\seealso{
\code{\link{labels}}, \code{\link{dendrogram}}
}

