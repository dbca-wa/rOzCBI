#' Add the OzCBI calculated from the burn grading data
#'
#' `r lifecycle::badge("superseded")`
#'
#' @param burngrading A data.frame of burn grading data,
#'   collected with ODK Collect from the form "Burn Grading 0.1"
#'   and downloaded with `ruODK::odata_submission_get(wkt=T)`.
#' @return The input data.frame with an extra variable, 'ozcbi'.
#' @export
#' @family ozcbi
#' @examples
#' data("bgf")
#' data_with_ozcbi <- add_ozcbi_forest(bgf)
#' names(data_with_ozcbi)
add_ozcbi_forest <- function(burngrading) {
  burngrading %>%
    dplyr::mutate(ozcbi = {
      burngrading %>%
        dplyr::select(
          stratum_1_surface_p_s1_unburnt,
          stratum_1_surface_p_s1_duff,
          stratum_3_elevated_p_s3_crown,
          straum_4_intermediate_p_s4_crown,
          straum_4_intermediate_p_s4_char,
          stratum_5_overstorey_p_s5_crown,
          stratum_5_overstorey_p_s5_litter,
          stratum_5_overstorey_p_s5_char,
          stratum_3_elevated_p_s3_fcov,
          straum_4_intermediate_p_s4_fcov,
          stratum_5_overstorey_p_s5_fcov
        ) %>%
        dplyr::mutate_all(extract_grading) %>%
        purrr::pmap(calculate_ozcbi_forest) %>%
        as.numeric()
    })
}

# usethis::use_test("add_ozcbi")
