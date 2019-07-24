use <- function(x, ...) UseMethod("use")
use.fctr <- function(x, lang, reorder = FALSE, drop = TRUE, ...){
  ## x
  ## FIXME: assert that x is of class fctr (needed?)
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
  ## drop:
  ## FIXME: assert that logical
  if (drop) {
    return(droplevels(x))
  } else {
    return(x)
  }
}
