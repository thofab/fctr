context("Usage of fctr-objects")

cv <- c("a", "b", "c", "a", "a") # character vector
f <- as.factor(c("a", "b", "c", "a", "a")) # factor
i <- 2:5
##
df <- data.frame(r = c("a", "b", "c", "d"),
                 u = c("A", "B", "C", "D"),
                 i = as.integer(c(5, 3, 4, 2)),
                 o = as.factor(c("z", "y", "x", "w")),
                 g = c("A", "B", "B", "B"))
##
sf <- fctr(f, df)


# --------------------------------- EXPECTATION
desc <- attr(sf, "desc")
exp.u <- factor(c("A", "B", "C", "A", "A" ), levels = c("A", "B", "C"))
#attr(exp.u, "desc") <- desc
#class(exp.u) <- c("fctr", "factor")
                

# --------------------------------- TESTS
test_that("proposed usage", {
  expect_equal(use(sf, "u"), exp.u)
})
