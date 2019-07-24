fctr <- function(x, desc, ref = NA){
  ## FIXME: assert that the right things are provided
  ## to x, desc, and ref
  desc.char <- as.data.frame(lapply(desc, as.character),
                             stringsAsFactors = FALSE)
  row.names(desc.char)  <-  row.names(desc)
  if (is.na(ref)) {
    if (identical(as.character(row.names(desc.char)),
                  as.character(1:nrow(desc.char)))) {
      row.names(desc.char) <- desc.char[, 1]
    }
  } else if (ref %in% names(desc.char)) {
    row.names(desc.char) <- desc.char[, ref]
  } else {
    warning("argument 'ref' provided but not used.")
  }
  ##
  if (!all(levels(as.factor(x)) %in% row.names(desc.char))){
    stop("not all elements of 'x' are in the description")
  }
  ##
  x <- factor(x, levels = row.names(desc.char))
  attr(x, "class") <- c("fctr", "factor")
  ##
  attr(x, "desc") <- desc.char
  return(x)
}
