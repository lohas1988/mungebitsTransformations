context("renamer")

test_that("it can rename zero columns", {
  iris2 <- iris
  renamer(iris2, NULL)
  expect_equal(colnames(iris2), colnames(iris))
})

test_that("it can rename one column", {
  iris2 <- iris
  renamer(iris2, list(Sepal.Length = 'seplen'))
  expect_equal(colnames(iris2), c('seplen', colnames(iris)[2:5]))
})

test_that("it can rename two column", {
  iris2 <- iris
  renamer(iris2, list(Sepal.Length = 'seplen', Sepal.Width = 'sepwid'))
  expect_equal(colnames(iris2), c('seplen', 'sepwid', colnames(iris)[3:5]))
})

test_that("it can swap two column names", {
  iris2 <- iris
  renamer(iris2, list(Sepal.Length = 'Sepal.Width', Sepal.Width = 'Sepal.Length'))
  expect_equal(colnames(iris2), c(colnames(iris)[2:1], colnames(iris)[3:5]))
})

