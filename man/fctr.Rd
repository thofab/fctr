\name{fctr}
\alias{fctr}
\title{
Generating a factor with a description
}
\description{
Generates an 
}
\usage{
fctr(x, desc, ref = NA)
}
\arguments{
  \item{x}{
    a factor or character vector that can be transformed to a factor
}
  \item{desc}{
    a data.frame containing at least one column with all level of the
    factor in 'x'.
}
  \item{ref}{
    a character vector indicating which column of the data.frame in
    'desc' contains the levels of the factor 'x'
}
}
\details{
 FIXME: more details should follow
}
\value{
  An object of class fctr (that contains the class factor) and can be
  used as a standard factor.
}
\author{
  Thomas Fabbro <thomas.fabbro@unibas.ch>
}
\examples{
f <- c("a", "b", "c", "a", "a")
l <- data.frame(orig = c("a", "b", "c", "d"),
                lang1 = c("A", "B", "C", "D"),
                lang2 = c("first", "second", "third", "last"),
                order1 = c(5, 3, 4, 2),
                order2 = c("z", "y", "x", "w"),
                group1 =c("A", "B", "B", "B")
                )
sf <- fctr(f, l)
use(sf, "lang1")
use(sf, "lang2")
use(sf, "lang2", reorder = "order1")
use(sf, "lang1", drop = FALSE)
}
\keyword{manip}
