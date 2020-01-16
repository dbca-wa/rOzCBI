test_that("add_geocbi adds a column geocbi", {

  # This test uses the provided example data from ODK form "Burn Grading 0.1"
  data("burngrading01")

  # Add geocbi
  data_witout_geocbi <- burngrading01
  data_with_geocbi <- add_geocbi(burngrading01)

  # The dataframe does not yet contain a variable "geocbi"
  testthat::expect_false("geocbi" %in% names(burngrading01))

  # add_geocbi adds a variable called "geocbi"
  # To test for validity of the geocbi values, see tests for "calculate_geocbi"
  testthat::expect_true("geocbi" %in% names(data_with_geocbi))

  # add_geocbi adds more variables
  testthat::expect_equal(ncol(data_with_geocbi),ncol(data_witout_geocbi) + 1)

  # geocbi column is numeric
  testthat::expect_equal(class(data_with_geocbi$geocbi), "numeric")

})



# usethis::use_r("add_geocbi")
