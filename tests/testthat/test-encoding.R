test_that("guess_encoding() works", {
  skip_on_os("solaris")

  x <- guess_encoding(readr_example("mtcars.csv"))
  expect_s3_class(x, "tbl_df")
  expect_equal(as.character(x$encoding), "ASCII")
  expect_equal(x$confidence, 1)

  x <- guess_encoding("a\n\u00b5\u00b5")
  expect_s3_class(x, "tbl_df")
  expect_equal(as.character(x$encoding), "UTF-8")
  expect_equal(x$confidence, 0.8)
})
