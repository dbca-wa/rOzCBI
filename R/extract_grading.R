#' Extract the grading from a Burn Grading field value
#'
#' @param grading_string A string in the format `<grading>_<label>`.
#'   These strings are field values of the form "Burn Grading".
#'   E.g. "0.5_test-label", "2.0_other-label".
#' @return The grading as numeric value, e.g. 0.5, 2.0.
#' @export
#' @family helpers
#' @examples
#' testthat::expect_equal(extract_grading("0.0_test"), 0.0)
#' testthat::expect_equal(extract_grading("0.5_test"), 0.5)
#' testthat::expect_equal(extract_grading("1.0_test"), 1.0)
#' testthat::expect_equal(extract_grading("1.5_test"), 1.5)
#' testthat::expect_equal(extract_grading("2.5_test-with-long-label"), 2.5)
extract_grading <- function(grading_string) {
  grading_string %>%
    stringr::str_remove("_.*") %>%
    stringr::str_replace_all("na", "") %>%
    as.numeric(.)
}

# usethis::use_test("extract_grading")
