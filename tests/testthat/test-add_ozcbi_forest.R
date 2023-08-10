test_that("add_ozcbi_forest adds a column ozcbi", {
  # This test uses the provided example data from ODK form "Burn Grading 0.1"
  data("bgf")

  # Add ozcbi
  data_witout_ozcbi <- bgf
  data_with_ozcbi <- add_ozcbi_forest(bgf)

  # The dataframe does not yet contain a variable "ozcbi"
  testthat::expect_false("ozcbi" %in% names(bgf))

  # add_ozcbi_forest adds a variable called "ozcbi"
  # To test for validity of the ozcbi values,
  # see tests for "calculate_ozcbi_forest"
  testthat::expect_true("ozcbi" %in% names(data_with_ozcbi))

  # add_ozcbi_forest adds more variables
  testthat::expect_equal(ncol(data_with_ozcbi), ncol(data_witout_ozcbi) + 1)

  # add_ozcbi_forest column is numeric
  testthat::expect_equal(class(data_with_ozcbi$ozcbi), "numeric")
})

# usethis::use_r("add_ozcbi")
