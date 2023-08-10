#' Calculate the Forest OzCBI from numeric input variables
#'
#' `r lifecycle::badge("stable")`
#'
#' @details The Forest OzCBI is calculated from the following components:
#'
#' * Stratum 1 fraction of cover: always 1 (100%), therefore never captured.
#' * Stratum {2..5} fcov: surface covered by the stratum in quarter steps
#'   from 0 to 1: 0.0, 0.25, 0.5, 0.75, 1.0
#' * Stratum scores (CBI): The average grading from all non-null gradings out of
#'   all captured variables for each stratum.
#'   The variables are named with a stratum prefix.
#'   E.g., all variables for stratum 1 are prefixed `stratum_1_surface_s1_`.
#'
#' ### Overall index: OzCBI
#' The OzCBI is calculated as:
#'
#' (sum of stratum scores) / (sum of stratum fraction of cover)
#'
#' ### Variables not used in OzCBI formula
#' Some variables are captured, but not used for OzCBI calculation.
#' They provide context and metadata, and include representative photos.
#'
#' @param stratum_1_surface_p_s1_unburnt A numeric grade from 0.0 to 3.0.
#'   Unburnt area.
#'   The approximate percentage of area not burned.
#' @param stratum_1_surface_p_s1_duff A numeric grade from 0.0 to 3.0.
#'   Duff condition (crushed sticks and leaves).
#'   Broken leaf pieces that form a type of mulch under the litter layer.
#'   If necessary, scrape down to mineral soil to see how deeply the char has
#'   penetrated.
#' @param stratum_3_elevated_p_s3_crown
#'   A numeric grade from 0.0 to 3.0.
#'   Intact original crown cover.
#'   How much original crown is intact?
#' @param straum_4_intermediate_p_s4_crown
#'   A numeric grade from 0.0 to 3.0.
#'   Intact original crown cover.
#'   How much original crown is intact?
#' @param straum_4_intermediate_p_s4_char
#'   A numeric grade from 0.0 to 3.0.
#'   Char height.
#'   Fraction of total stratum height charred.
#' @param stratum_5_overstorey_p_s5_crown
#'   A numeric grade from 0.0 to 3.0.
#'   Intact original crown cover.
#'   How much original crown is intact?
#' @param stratum_5_overstorey_p_s5_litter
#'   A numeric grade from 0.0 to 3.0.
#'   Ground surface covered by leaves that have fallen after the burn,
#'   not unburned patches.
#' @param stratum_5_overstorey_p_s5_char
#'   A numeric grade from 0.0 to 3.0.
#'   Char height.
#'   Fraction of total stratum height charred.
#' @param stratum_1_surface_s1_fcov
#'   The fraction of coverage of stratum 1, default: 1. This value
#'   is never captured in the digital form as it always is 1 (100%).
#'   The variable is however provided here to allow different values.
#' @param stratum_3_elevated_p_s3_fcov
#'   The fraction of coverage of stratum 2 in quarter steps
#'   from 0.0 to 1.0. Default: 0.
#' @param straum_4_intermediate_p_s4_fcov
#'   The fraction of coverage of stratum 2 in quarter steps
#'   from 0.0 to 1.0. Default: 0.
#' @param stratum_5_overstorey_p_s5_fcov
#'   The fraction of coverage of stratum 2 in quarter steps
#'   from 0.0 to 1.0. Default: 0.
#' @param verbose Whether to display diagnostic messages, default: FALSE.
#' @family ozcbi
#' @export
#' @examples
#' # With missing variables
#' calculate_ozcbi_forest(
#'   stratum_1_surface_p_s1_unburnt = 1,
#'   verbose = TRUE
#' )
#'
#' # With complete variables, all set to 1
#' calculate_ozcbi_forest(
#'   stratum_1_surface_p_s1_unburnt = 1,
#'   stratum_1_surface_p_s1_duff = 1,
#'   stratum_3_elevated_p_s3_crown = 1,
#'   straum_4_intermediate_p_s4_crown = 1,
#'   straum_4_intermediate_p_s4_char = 1,
#'   stratum_5_overstorey_p_s5_crown = 1,
#'   stratum_5_overstorey_p_s5_litter = 1,
#'   stratum_5_overstorey_p_s5_char = 1,
#'   stratum_1_surface_s1_fcov = 1,
#'   stratum_3_elevated_p_s3_fcov = 0,
#'   straum_4_intermediate_p_s4_fcov = 0,
#'   stratum_5_overstorey_p_s5_fcov = 0,
#'   verbose = TRUE
#' )
calculate_ozcbi_forest <- function(
    stratum_1_surface_p_s1_unburnt = NA_real_,
    stratum_1_surface_p_s1_duff = NA_real_,
    stratum_3_elevated_p_s3_crown = NA_real_,
    straum_4_intermediate_p_s4_crown = NA_real_,
    straum_4_intermediate_p_s4_char = NA_real_,
    stratum_5_overstorey_p_s5_crown = NA_real_,
    stratum_5_overstorey_p_s5_litter = NA_real_,
    stratum_5_overstorey_p_s5_char = NA_real_,
    stratum_1_surface_s1_fcov = 1,
    stratum_3_elevated_p_s3_fcov = 0,
    straum_4_intermediate_p_s4_fcov = 0,
    stratum_5_overstorey_p_s5_fcov = 0,
    verbose = FALSE) {
  # -------------------------------------------------------------------------- #
  # Stratum 1
  #
  s1_cbi <- c(
    stratum_1_surface_p_s1_unburnt,
    stratum_1_surface_p_s1_duff
  ) %>%
    purrr::discard(is.na) %>%
    mean()
  s1_score <- s1_cbi * stratum_1_surface_s1_fcov
  if (verbose == TRUE) {
    ruODK::ru_msg_info(
      glue::glue(
        "Stratum 1: CBI {s1_cbi} * FCOV ",
        "{stratum_1_surface_s1_fcov} = Score {s1_score}"
      )
    )
  }

  # -------------------------------------------------------------------------- #
  # Stratum 2 is unused
  #
  # s2_cbi <- c(
  #   stratum_2_near_surface_s2_area_unburnt,
  #   stratum_2_near_surface_s2_grass_trees_with_skirts,
  #   stratum_2_near_surface_s2_unburnt_shrub_density,
  #   stratum_2_near_surface_s2_fcov_regenerating_plants
  # ) %>%
  #   purrr::discard(is.na) %>%
  #   mean()
  # s2_score <- s2_cbi * stratum_2_near_surface_s2_fcov
  # if (verbose == TRUE)
  #   ruODK::ru_msg_info(
  #     glue::glue(
  #       "Stratum 2: CBI {s2_cbi} * FCOV ",
  #       "{stratum_2_near_surface_s2_fcov} = Score {s2_score}"
  #       )
  #   )
  #

  # -------------------------------------------------------------------------- #
  # Stratum 3
  s3_cbi <- stratum_3_elevated_p_s3_crown
  s3_score <- s3_cbi * stratum_3_elevated_p_s3_fcov
  if (verbose == TRUE) {
    ruODK::ru_msg_info(
      glue::glue(
        "Stratum 3: CBI {s3_cbi} * FCOV ",
        "{stratum_3_elevated_p_s3_fcov} = Score {s3_score}"
      )
    )
  }

  # -------------------------------------------------------------------------- #
  # Stratum 4
  s4_cbi <- c(
    straum_4_intermediate_p_s4_crown,
    straum_4_intermediate_p_s4_char
  ) %>%
    purrr::discard(is.na) %>%
    mean()
  s4_score <- s4_cbi * straum_4_intermediate_p_s4_fcov
  if (verbose == TRUE) {
    ruODK::ru_msg_info(
      glue::glue(
        "Stratum 4: CBI {s4_cbi} * FCOV ",
        "{straum_4_intermediate_p_s4_fcov} = Score {s4_score}"
      )
    )
  }

  # -------------------------------------------------------------------------- #
  # Stratum 5
  s5_cbi <- c(
    stratum_5_overstorey_p_s5_crown,
    stratum_5_overstorey_p_s5_litter,
    stratum_5_overstorey_p_s5_char
  ) %>%
    purrr::discard(is.na) %>%
    mean()
  s5_score <- s5_cbi * stratum_5_overstorey_p_s5_fcov
  if (verbose == TRUE) {
    ruODK::ru_msg_info(
      glue::glue(
        "Stratum 5: CBI {s5_cbi} * FCOV ",
        "{stratum_5_overstorey_p_s5_fcov} = Score {s5_score}"
      )
    )
  }

  # OzCBI
  score_sum <- sum(
    s1_score,
    s3_score,
    s4_score,
    s5_score,
    na.rm = TRUE
  )
  fcov_sum <- sum(
    stratum_1_surface_s1_fcov,
    stratum_3_elevated_p_s3_fcov,
    straum_4_intermediate_p_s4_fcov,
    stratum_5_overstorey_p_s5_fcov
  )
  ozcbi <- score_sum / fcov_sum
  if (verbose == TRUE) {
    ruODK::ru_msg_success(
      glue::glue(
        "OzCBI: {ozcbi} = Score sum {score_sum} / FCOV sums {fcov_sum}"
      )
    )
  }

  ozcbi
}

# usethis::use_test("calculate_ozcbi")
