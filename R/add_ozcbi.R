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
#' data("burngrading01")
#' data_with_ozcbi <- add_ozcbi(burngrading01)
#' names(data_with_ozcbi)
add_ozcbi <- function(burngrading) {
  burngrading %>%
    dplyr::mutate(ozcbi = {
      burngrading %>%
        dplyr::select(
          stratum_1_surface_s1_fcov_post_fire_leaf_fall,
          stratum_1_surface_s1_area_unburnt,
          stratum_1_surface_s1_duff,
          stratum_1_surface_s1_coarse_fuel,
          stratum_2_near_surface_s2_area_unburnt,
          stratum_2_near_surface_s2_grass_trees_with_skirts,
          stratum_2_near_surface_s2_unburnt_shrub_density,
          stratum_2_near_surface_s2_fcov_regenerating_plants,
          stratum_3_elevated_s3_fcov_original_crown_intact,
          stratum_3_elevated_s3_density_bare_shrubs,
          straum_4_intermediate_s4_fcov_original_crown_intact,
          straum_4_intermediate_s4_resprouting_on_live_trees,
          straum_4_intermediate_s4_char_height,
          stratum_5_overstorey_s5_fcov_original_crown_intact,
          stratum_5_overstorey_s5_no_trees_over_20cm_fallen,
          stratum_5_overstorey_s5_resprouting_on_live_trees,
          stratum_5_overstorey_s5_char_height,
          stratum_2_near_surface_s2_fcov = 0,
          stratum_3_elevated_s3_fcov = 0,
          straum_4_intermediate_s4_fcov = 0,
          stratum_5_overstorey_s5_fcov
        ) %>%
        dplyr::mutate_all(extract_grading) %>%
        purrr::pmap(calculate_ozcbi) %>%
        as.numeric()
    })
}

# usethis::use_test("add_ozcbi")
