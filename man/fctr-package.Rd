\name{fctr-package}
\alias{fctr-package}
\docType{package}
\title{
\packageTitle{fctr}
}
\description{
\packageDescription{fctr}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{fctr}
\packageIndices{fctr}

}
\author{
\packageAuthor{fctr}

Maintainer: \packageMaintainer{fctr}
}
\keyword{ package }

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
