#' Calculate the GeoCBI from input variables
#'
#' @details The GeoCBI is calculated from the following components:
#'
#' * Stratum 1 fraction of cover: always 1 (100%), therefore never captured.
#' * Stratum {2..5} fcov: the extracted gradings of surface cover in quarter
#'   steps from 0 to 1: 0.0, 0.25, 0.5, 0.75, 1.0
#' * Stratum scores (CBI): The average grading from all non-null gradings out of
#'   all captured variables for each stratum.
#'   The variables are named with a stratum prefix.
#'   E.g., all variables for stratum 1 are prefixed `s1_`.
#'
#' ### Overall index: GeoCBI
#' The GeoCBI is calculated as:
#'
#' (sum of stratum scores) / (sum of stratum fraction of cover)
#'
#' ### Vars not used in GeoCBI formula
#' Some variables are captured, but not used for GeoCBI calculation.
#' They provide context and metadata, and include representative photos.
#'
#' "id" "observation_start_time" "reporter" "device_id" "observation_end_time"
#' "submission_date" "submitter_id" "submitter_name" "instance_id"
#' "location_longitude" "location_latitude" "location_altitude" "plot_photo"
#' "plot_name" "homogeneous_burn_severity" "s1_photo" "s2_dominant_vegetation"
#' "s2_photo" "s3_dominant_vegetation" "s3_photo" "s4_dominant_vegetation"
#' "s4_photo" "s5_dominant_vegetation" "s5_photo" "no_grass_trees"
#' "no_hollow_logs" "no_standing_trees_gt20cm" "no_standing_trees_with_hollows"
#' "depth_leaf_litter_cm" "avg_gap_between_unburnt_patches"
#' "evidence_of_native_fauna" "evidence_of_feral_fauna" "odata_context"
#'
#'
#' @param s1_fcov_post_fire_leaf_fall A numeric grade from 0.0 to 3.0.
#'   Post-fire leaf fall cover.
#'   Includes leaves that have fallen after the burn but not unburned patches.
#' @param s1_area_unburnt A numeric grade from 0.0 to 3.0.
#'   Unburnt area.
#'   The approximate percentage of area not burned.
#' @param s1_duff A numeric grade from 0.0 to 3.0.
#'   Duff condition (crushed sticks and leaves).
#'   Broken leaf pieces that form a type of mulch under the litter layer.
#'   If necessary, scrape down to mineral soil to see how deeply the char has
#'   penetrated.
#' @param s1_coarse_fuel A numeric grade from 0.0 to 3.0.
#'   Coarse fuel condition (logs).
#'   Logs greater than 6 mm diameter that were on the ground prior to the burn.
#' @param s2_area_unburnt A numeric grade from 0.0 to 3.0.
#'   Unburnt area.
#'   The approximate percentage of area not burned.
#' @param s2_grass_trees_with_skirts A numeric grade from 0.0 to 3.0.
#'   Grass trees with skirts.
#'   How many grass trees still have skirts?
#' @param s2_unburnt_shrub_density A numeric grade from 0.0 to 3.0.
#'   Density of unburnt shrubs.
#'   When walking across plot, how would you touch shrubs below 1m?
#' @param s2_fcov_regenerating_plants A numeric grade from 0.0 to 3.0.
#'   Regenerating plants cover.
#'   All green growth associated at the base of shrubs or apparently out in the
#'   open. Include seedlings in the approximate area.
#' @param s3_fcov_original_crown_intact A numeric grade from 0.0 to 3.0.
#'   Intact original crown cover.
#'   How much original crown is intact?
#' @param s3_density_bare_shrubs A numeric grade from 0.0 to 3.0.
#'   Density of bare shrubs > 1m.
#' @param s4_fcov_original_crown_intact A numeric grade from 0.0 to 3.0.
#'   Intact original crown cover.
#'   How much original crown is intact?
#' @param s4_resprouting_on_live_trees A numeric grade from 0.0 to 3.0.
#'   Resprouting on live trees.
#' @param s4_char_height A numeric grade from 0.0 to 3.0.
#'   Char height.
#'   Fraction of total stratum height charred.
#' @param s5_fcov_original_crown_intact A numeric grade from 0.0 to 3.0.
#'   Intact original crown cover.
#'   How much original crown is intact?
#' @param s5_no_trees_over_20cm_fallen A numeric grade from 0.0 to 3.0.
#'   Number of trees > 20cm fallen.
#' @param s5_resprouting_on_live_trees A numeric grade from 0.0 to 3.0.
#'   Resprouting on live trees.
#' @param s5_char_height A numeric grade from 0.0 to 3.0.
#'   Char height.
#'   Fraction of total stratum height charred.
#' @param s1_fcov The fraction of coverage of stratum 1, default: 1. This value
#'   is never captured in the digital form as it always is 1 (100%).
#'   The variable is however provided here to allow different values.
#' @param s2_fcov The fraction of coverage of stratum 2 in quarter steps
#'   from 0.0 to 1.0. Default: 0.
#' @param s3_fcov The fraction of coverage of stratum 2 in quarter steps
#'   from 0.0 to 1.0. Default: 0.
#' @param s4_fcov The fraction of coverage of stratum 2 in quarter steps
#'   from 0.0 to 1.0. Default: 0.
#' @param s5_fcov The fraction of coverage of stratum 2 in quarter steps
#'   from 0.0 to 1.0. Default: 0.
#' @param verbose Whether to display diagnostic messages, default: FALSE.
#' @family geocbi
#' @export
#' @examples
#' # With missing variables
#' calculate_geocbi(
#'   s1_fcov_post_fire_leaf_fall = 1,
#'   s2_area_unburnt = 2.5,
#'   s2_fcov = 0.5,
#'   verbose = TRUE)
#'
#' # With complete variables, all set to 1
#' calculate_geocbi(
#'   s1_fcov_post_fire_leaf_fall = 1,
#'   s1_area_unburnt = 1,
#'   s1_duff = 1,
#'   s1_coarse_fuel = 1,
#'   s2_area_unburnt = 1,
#'   s2_grass_trees_with_skirts = 1,
#'   s2_unburnt_shrub_density = 1,
#'   s2_fcov_regenerating_plants = 1,
#'   s3_fcov_original_crown_intact = 1,
#'   s3_density_bare_shrubs = 1,
#'   s4_fcov_original_crown_intact = 1,
#'   s4_resprouting_on_live_trees = 1,
#'   s4_char_height = 1,
#'   s5_fcov_original_crown_intact = 1,
#'   s5_no_trees_over_20cm_fallen = 1,
#'   s5_resprouting_on_live_trees = 1,
#'   s5_char_height = 1,
#'   s1_fcov = 1,
#'   s2_fcov = 1,
#'   s3_fcov = 1,
#'   s4_fcov = 1,
#'   s5_fcov = 1,
#'   verbose = TRUE)
calculate_geocbi <- function(s1_fcov_post_fire_leaf_fall = NA_real_,
                             s1_area_unburnt = NA_real_,
                             s1_duff = NA_real_,
                             s1_coarse_fuel = NA_real_,
                             s2_area_unburnt = NA_real_,
                             s2_grass_trees_with_skirts = NA_real_,
                             s2_unburnt_shrub_density = NA_real_,
                             s2_fcov_regenerating_plants = NA_real_,
                             s3_fcov_original_crown_intact = NA_real_,
                             s3_density_bare_shrubs = NA_real_,
                             s4_fcov_original_crown_intact = NA_real_,
                             s4_resprouting_on_live_trees = NA_real_,
                             s4_char_height = NA_real_,
                             s5_fcov_original_crown_intact = NA_real_,
                             s5_no_trees_over_20cm_fallen = NA_real_,
                             s5_resprouting_on_live_trees = NA_real_,
                             s5_char_height = NA_real_,
                             s1_fcov = 1,
                             s2_fcov = 0,
                             s3_fcov = 0,
                             s4_fcov = 0,
                             s5_fcov = 0,
                             verbose = FALSE) {

  # -------------------------------------------------------------------------- #
  # Stratum 1
  #
  s1_cbi <- c(
    s1_fcov_post_fire_leaf_fall,
    s1_area_unburnt,
    s1_duff,
    s1_coarse_fuel
  ) %>%
    purrr::discard(is.na) %>%
    mean()
  s1_score <- s1_cbi * s1_fcov
  if (verbose == T) {
    message(
      glue::glue("Stratum 1: CBI {s1_cbi} * FCOV {s1_fcov} = Score {s1_score}")
    )
  }

  # -------------------------------------------------------------------------- #
  # Stratum 2
  #
  s2_cbi <- c(
    s2_area_unburnt,
    s2_grass_trees_with_skirts,
    s2_unburnt_shrub_density,
    s2_fcov_regenerating_plants
  ) %>%
    purrr::discard(is.na) %>%
    mean()
  s2_score <- s2_cbi * s2_fcov
  if (verbose == T) {
    message(
      glue::glue("Stratum 2: CBI {s2_cbi} * FCOV {s2_fcov} = Score {s2_score}")
    )
  }

  # -------------------------------------------------------------------------- #
  # Stratum 3
  s3_cbi <- c(
    s3_fcov_original_crown_intact,
    s3_density_bare_shrubs
  ) %>%
    purrr::discard(is.na) %>%
    mean()
  s3_score <- s3_cbi * s3_fcov
  if (verbose == T) {
    message(
      glue::glue("Stratum 3: CBI {s3_cbi} * FCOV {s3_fcov} = Score {s3_score}")
    )
  }

  # -------------------------------------------------------------------------- #
  # Stratum 4
  s4_cbi <- c(
    s4_fcov_original_crown_intact,
    s4_resprouting_on_live_trees,
    s4_char_height
  ) %>%
    purrr::discard(is.na) %>%
    mean()
  s4_score <- s4_cbi * s4_fcov
  if (verbose == T) {
    message(
      glue::glue("Stratum 4: CBI {s4_cbi} * FCOV {s4_fcov} = Score {s4_score}")
    )
  }

  # -------------------------------------------------------------------------- #
  # Stratum 5
  s5_cbi <- c(
    s5_fcov_original_crown_intact,
    s5_no_trees_over_20cm_fallen,
    s5_resprouting_on_live_trees,
    s5_char_height
  ) %>%
    purrr::discard(is.na) %>%
    mean()
  s5_score <- s5_cbi * s5_fcov
  if (verbose == T) {
    message(
      glue::glue("Stratum 5: CBI {s5_cbi} * FCOV {s5_fcov} = Score {s5_score}")
    )
  }

  # GeoCBI
  score_sum <- sum(s1_score, s2_score, s3_score, s4_score, s5_score, na.rm = T)
  fcov_sum <- sum(s1_fcov, s2_fcov, s3_fcov, s4_fcov, s5_fcov)
  geocbi <- score_sum / fcov_sum
  if (verbose == T)
    message(
      glue::glue(
        "GeoCBI: {geocbi} = Score sum {score_sum} / FCOV sums {fcov_sum}"
        )
    )
  geocbi
}

# usethis::use_test("calculate_geocbi")
