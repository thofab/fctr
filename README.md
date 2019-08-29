# fctr
Compact and robust handling of categorical information using R.

Handling categorical data with the base R functionalities in a compact and robust manner is a challange.

There are several packages that provide tools for working with factors (R's data structure for categorical data), like e.g. [the  forcats package](https://forcats.tidyverse.org/) from the tidyverse package collection.

Although many of those packages make working with factors more compact and robust, we suggest with this package a very simple to handle approach that allows to extend common factors by by multiple sets of labels.
These sets of labels are stored with the factor (as attibutes).
Everytime a factor is used e.g. for plotting, modelling it is possible to select which set of labels (and therefore set of levels) will be used in this particular case.

This allows to have e.g. translations of categories in different languages, or short and long versions of category descriptions at one place.
Additionally it also allows have different groupings of categories all in common place.

```{r taeser}
library(devtools)
install_github("thofab/fctr")
catinfo <- c("nz", "nz", "ch", "fr", "ch")
labeltable <- data.frame(lower = c("nz", "ch", "fr", "it"),
                alpha2code = c("NZ", "CH", "FR", "IT"),
                alpha3code = c("NZL", "CHE", "FRA", "ITA"),
                english = c("New Zealand", "Switzerland", "France", "Italy"),
                german = c("Neuseeland", "Schweiz", "Frankreich", "Italien"),
                iso3166 = c("554", "756", "250", "380"))
                ## you could easily take the whole list from e.g. wikipedia
f <- fctr(catinfo, labeltable)
use(f, "alpha2code")
use(f, "english")
use(f, "english", reorder = "iso3166")
use(f, "alpha3code", drop = FALSE)
```
[![Build Status](https://travis-ci.org/thofab/fctr.svg?branch=master)](https://travis-ci.org/thofab/fctr)
