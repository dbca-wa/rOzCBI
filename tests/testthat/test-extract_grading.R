test_that("extract_grading works", {
  testthat::expect_equal(extract_grading("0.0_test"), 0.0)
  testthat::expect_equal(extract_grading("0.5_test"), 0.5)
  testthat::expect_equal(extract_grading("1.0_test"), 1.0)
  testthat::expect_equal(extract_grading("1.5_test"), 1.5)
  testthat::expect_equal(extract_grading("-"), NA_real_)
  testthat::expect_equal(extract_grading("2.5_test-with-long-label"), 2.5)
  testthat::expect_equal(
    extract_grading(c("0.5_test", "0.75_test", NA, "1.0_test", "na_test", "-")),
    c(0.50, 0.75, NA, 1.00, NA, NA_real_)
  )
})
