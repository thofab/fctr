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
  levels(x) <- desc[, lang]
  if (is.logical(reorder)) {
    if (reorder) {
      u.levels <- desc[order(desc[, lang]), lang]
    } else {
      u.levels <- desc[, lang]
    }
  } else if (reorder %in% names(desc)) {
    u.levels <- desc[order(desc[, reorder]), lang]
  } else {
    warning("argument 'reorder' provided but not used")
  }
  ## recreate the factor with the correct levels
  ret <- factor(x, levels = unique(u.levels))
  ##
  if (drop) {
    ret <- droplevels(ret)
  }
  ##
  ## attr(x, "desc") <- NULL
  ## class(x) <- "factor"
  ##
  return(ret)
}
