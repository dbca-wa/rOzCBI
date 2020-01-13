#' Add the GeoCBI calculated from the burn grading data
#'
#' @param burngrading A data.frame of burn grading data, collected with ODK Collect
#'   from the form "Burn Grading 0.1" and downloaded with
#'   `ruODK::odata_submission_get(wkt=T)`.
#' @return The input data.frame with an extra variable, 'geocbi'.
#' @export
#' @examples
#' data("burngrading01")
#' data_with_geocbi <- add_geocbi(burngrading01)
#' names(data_with_geocbi)
add_geocbi <- function(burngrading) {
  burngrading %>% dplyr::mutate(geocbi = {
    burngrading %>%
      dplyr::select(
        s1_fcov_post_fire_leaf_fall,
        s1_area_unburnt,
        s1_duff,
        s1_coarse_fuel,
        s2_area_unburnt,
        s2_grass_trees_with_skirts,
        s2_unburnt_shrub_density,
        s2_fcov_regenerating_plants,
        s3_fcov_original_crown_intact,
        s3_density_bare_shrubs,
        s4_fcov_original_crown_intact,
        s4_resprouting_on_live_trees,
        s4_char_height,
        s5_fcov_original_crown_intact,
        s5_no_trees_over_20cm_fallen,
        s5_resprouting_on_live_trees,
        s5_char_height,
        s2_fcov,
        s3_fcov,
        s4_fcov,
        s5_fcov
      ) %>%
      dplyr::mutate_all(extract_grading) %>%
      purrr::pmap(calculate_geocbi)
  })
}

# usethis::use_test("add_geocbi")
