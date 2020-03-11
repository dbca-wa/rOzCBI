test_that("add_ozcbi adds a column ozcbi", {

  # This test uses the provided example data from ODK form "Burn Grading 0.1"
  data("burngrading01")

  # Add ozcbi
  data_witout_ozcbi <- burngrading01
  data_with_ozcbi <- add_ozcbi(burngrading01)

  # The dataframe does not yet contain a variable "ozcbi"
  testthat::expect_false("ozcbi" %in% names(burngrading01))

  # add_ozcbi adds a variable called "ozcbi"
  # To test for validity of the ozcbi values, see tests for "calculate_ozcbi"
  testthat::expect_true("ozcbi" %in% names(data_with_ozcbi))

  # add_ozcbi adds more variables
  testthat::expect_equal(ncol(data_with_ozcbi), ncol(data_witout_ozcbi) + 1)

  # ozcbi column is numeric
  testthat::expect_equal(class(data_with_ozcbi$ozcbi), "numeric")
})



# usethis::use_r("add_ozcbi")
