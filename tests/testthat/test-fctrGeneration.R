context("Generation of fctr-objects")

cv <- c("a", "b", "c", "a", "a") # character vector
f <- as.factor(c("a", "b", "c", "a", "a")) # factor
i <- 2:5

df <- data.frame(r = c("a", "b", "c", "d"),
                 u = c("A", "B", "C", "D"),
                 i = as.integer(c(5, 3, 4, 2)),
                 o = as.factor(c("z", "y", "x", "w")),
                 g = c("A", "B", "B", "B"))

## --------------------------------- EXPECTATION
## generating the expectation manually
desc <- data.frame(r = c("a", "b", "c", "d"),       # r for reference
                   u = c("A", "B", "C", "D"),       # u for upper case
                   i = as.character(c(5, 3, 4, 2)), # i for integer
                   o = c("z", "y", "x", "w"),       # o to test ordering
                   g = c("A", "B", "B", "B"),       # g to test grouping
                   stringsAsFactors = FALSE)
## expectation
row.names(desc) <- c("a", "b", "c", "d")
expected <- factor(cv, levels = c("a", "b", "c", "d"))
attr(expected, "desc") <- desc
class(expected) <- c("fctr", "factor")
rm(desc)
## expectation2
desc <- data.frame(r = c("a", "b", "c", "d"),       # r for reference
                   u = c("A", "B", "C", "D"),       # u for upper case
                   i = as.character(c(5, 3, 4, 2)), # i for integer
                   o = c("z", "y", "x", "w"),       # o to test ordering
                   g = c("A", "B", "B", "B"),       # g to test grouping
                   stringsAsFactors = FALSE)
row.names(desc) <- c("5", "3", "4", "2")
expected2 <- factor(i, levels = c("5", "3", "4", "2"))
attr(expected2, "desc") <- desc
class(expected2) <- c("fctr", "factor")
rm(desc)


## --------------------------------- TESTS
test_that("proposed usage", {
  ## proposed standard usage
  expect_equal(fctr(cv, df), expected)
  expect_equal(fctr(f, df), expected)
  expect_equal(fctr(i, df, ref = "i"), expected2)
})



test_that("testing different input for desc", {
  ## using a list instead of data.frame
  l <- list(r = c("a", "b", "c", "d"),
            u = c("A", "B", "C", "D"),
            i = as.integer(c(5, 3, 4, 2)),
            o = as.factor(c("z", "y", "x", "w")),
            g = c("A", "B", "B", "B"))
  ##
  expect_equal(fctr(cv, l), expected)
  expect_equal(fctr(f, l), expected)
})



test_that("wrong input 'x'", {
  ## using a factor that has more levels than described
  expect_error(
      fctr(x = factor(c("a", "b", "c", "a", "a"),
                      levels = c("a", "b", "c", "d", "e")),
           desc = df)
  )
  ## using a factor that has undescribed levels
  expect_error(
      fctr(x = factor(c("a", "b", "e", "a", "a"),
                      levels = c("a", "b", "e")),
           desc = df)
  )
})
