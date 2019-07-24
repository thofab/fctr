\name{print.fctr}
\alias{print.fctr}
\title{
Print Values
}
\description{
  An extension of print.factor for objects of class 'fctr'
}
\usage{
\method{print}{fctr}(x, quote = FALSE, max.levels = NULL, width = getOption("width"), ...)
}

\arguments{
  \item{x}{
    an object of class fctr.
}
  \item{quote}{
    logical, indicating whether or not strings should be printed
    with surrounding quotes.
}
  \item{max.levels}{
    integer, indicating how many levels should be printed for a
    factor; if ‘0’, no extra "Levels" line will be printed.  The
    default, ‘NULL’, entails choosing ‘max.levels’ such that the
    levels print on one line of width ‘width’.
}
  \item{width}{
    only used when ‘max.levels’ is NULL, see above.
}
  \item{\dots}{
    further arguments passed to or from other methods.
}
}
\details{
  see help on print
}

\author{
  Thomas Fabbro <thomas.fabbro@unibas.ch>
}
\seealso{
  \code{\link{print}}
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

use(sf, "lang2")
use(sf, "lang2", reorder = "order1")
use(sf, "lang2", drop = FALSE)
}
\keyword{ print }
