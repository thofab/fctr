use <- function(x, ...) UseMethod("use")
use.fctr <- function(x, lang, reorder = FALSE, drop = TRUE, ...){
  ## drop:
  if (!is.logical(drop)) {
    stop("argument 'drop' needs to be TRUE or FALSE")
  }
  ## x
  if (!is(x, "fctr")) {
     stop(strwrap(
         "argument 'x' needs to be of class 'fctr',
          e.g. generated using the function 'fctr()'",
        prefix = " ", initial = ""))
  }
  desc <- attr(x, "desc")
  ## reorder
  ## FIXME: assert that logical or an column name of 'lang'
  if (is.logical(reorder)) {
    if (reorder) {
      levels(x) <- desc[order(desc[, lang]), lang]
    } else {
      levels(x) <- desc[, lang]
    }
  } else if (reorder %in% names(desc)) {
    levels(x) <- desc[order(desc[, reorder]), lang]
  } else {
    warning("argument 'reorder' provided but not used")
  }
  ##
  if (drop) {
    x <- droplevels(x)
  }
  ##
  attr(x, "desc") <- NULL
  class(x) <- "factor"
  ##
  return(x)
}
