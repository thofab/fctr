\name{use}
\alias{use}
\alias{use.fctr}
\title{
Use a set of levels.
}
\description{
Descide which translation (and ordering) of a factor to use in a
particular situation.
}
\usage{
\method{use}{fctr}(x, lang, reorder = FALSE, drop = TRUE, ...)
}
\arguments{
  \item{x}{
    A factor that was prepared by the function 'fctr'.
}
  \item{lang}{
    A character string indicating which set of levels to be used.
}
  \item{reorder}{
    A character string indicating the name of the set of levels to be
    used for ordering the levels.
}
  \item{drop}{
    A logical, indicating if unused levels should be dropped.
  }
  \item{...}{
    Further arguments are perhaps needed in the future.
  }
}
\details{
  FIXME: to follow
}
\value{
    An object of class fctr (that contains the class factor) and can be
  used as a standard factor.
}
\author{
  Thomas Fabbro <thomas.fabbro@unibas.ch>
}
\seealso{
  \code{\link{fctr}}
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

