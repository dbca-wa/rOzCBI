#' Add the GeoCBI calculated from the burn grading data
#'
#' @param data A data.frame of burn grading data, collected with ODK Collect
#'   from the form "Burn Grading 0.1" and downloaded with
#'   `ruODK::odata_submission_get(wkt=T)`.
#' @return The input data.frame with an extra variable, 'geocbi'.
#' @export
add_geocbi <- function(data){
  # TODO: gate checks for variable completeness and range
  data %>%
    dplyr::mutate(geocbi = calculate_geocbi())
}

# usethis::use_test("add_geocbi")
