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

## or
f <- c("a", "b", "c", "a", "a")
l <- data.frame(lang1 = c("A", "B", "C", "D"),
                lang2 = c("first", "second", "third", "last"),
                lang3 = c("a", "b", "c", "d"),
                order1 = c(5, 3, 4, 2),
                order2 = c("z", "y", "x", "w"),
                group1 =c("A", "B", "B", "B")
                )
sf <- fctr(f, l, ref = "lang3")


## or
catinfo <- c("nz", "nz", "ch", "fr", "ch")

labeltable <- data.frame(lower = c("nz", "ch", "fr", "it"),
                alpha2code = c("NZ", "CH", "FR", "IT"),
                alpha3code = c("NZL", "CHE", "FRA", "ITA"),
                english = c("New Zealand", "Switzerland", "France", "Italy"),
                german = c("Neuseeland", "Schweiz", "Frankreich", "Italien"),
                iso3166 = c(554, 756, 250, 380))
                ## you can easily thake the whole list from e.g. wikipedia
f <- fctr(catinfo, labeltable)
use(f, "alpha2code")
use(f, "english")
use(f, "german")
use(f, "alpha3code", reorder = "iso3166")
use(f, "alpha3code", drop = FALSE)
}
\keyword{manip}
