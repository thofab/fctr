## FIXME: This is just base print.factor plus two lines ...
##        there is a lot to do it properly
print.fctr <- function (x, quote = FALSE, max.levels = NULL, width = getOption("width"),
    ...)
{
    ord <- is.ordered(x)
    if (length(x) == 0L)
        cat(if (ord)
            "ordered"
        else "factor", "(0)\n", sep = "")
    else {
        xx <- character(length(x))
        xx[] <- as.character(x)
        keepAttrs <- setdiff(names(attributes(x)), c("levels", 
            "class", "desc"))
        attributes(xx)[keepAttrs] <- attributes(x)[keepAttrs]
        print(xx, quote = quote, ...)
    }
    maxl <- if (is.null(max.levels)) 
        TRUE
    else max.levels
    if (maxl) {
        n <- length(lev <- encodeString(levels(x), quote = ifelse(quote, 
            "\"", "")))
        colsep <- if (ord) 
            " < "
        else " "
        T0 <- "Levels: "
        if (is.logical(maxl)) 
            maxl <- {
                width <- width - (nchar(T0, "w") + 3L + 1L + 
                  3L)
                lenl <- cumsum(nchar(lev, "w") + nchar(colsep, 
                  "w"))
                if (n <= 1L || lenl[n] <= width) 
                  n
                else max(1L, which.max(lenl > width) - 1L)
            }
        drop <- n > maxl
        cat(if (drop) 
            paste(format(n), ""), T0, paste(if (drop) 
            c(lev[1L:max(1, maxl - 1)], "...", if (maxl > 1) lev[n])
        else lev, collapse = colsep), "\n", sep = "")
    }
    cat("Description:\n")
    print(attr(x, "desc"))
    if (!isTRUE(val <- .valid.factor(x))) 
        warning(val)
    invisible(x)
}
