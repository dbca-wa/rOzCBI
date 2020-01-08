#' Extract the grading from a string
#'
#' @param grading_string A string in the format <grading>_<label>.
#' @return The grading as numeric value.
#' @export
#' @examples
#' testthat::expect_equal(extract_grading("0.0_test"), 0.0)
#' testthat::expect_equal(extract_grading("0.5_test"), 0.5)
#' testthat::expect_equal(extract_grading("1.0_test"), 1.0)
#' testthat::expect_equal(extract_grading("1.5_test"), 1.5)
#' testthat::expect_equal(extract_grading("2.5_test-with-long-label"), 2.5)
extract_grading <- function(grading_string){
  grading_string %>% stringr::str_remove("_.*") %>% as.numeric(.)
}

# usethis::use_test("extract_grading")
