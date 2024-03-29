#' @keywords internal
#' @importFrom rlang as_character
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL


#' Shim to allow Import of lifecycle, required for building docs.
#'
#' HT Jim Hester, Lionel Henry, Jenny Bryan for advice
#' @importFrom lifecycle deprecate_soft
#' @keywords internal
lifecycle_shim <- function() {
  lifecycle::deprecate_soft(when = "1.0", what = "lifecycle_shim()") # nocov
}


# CMD check silencer
utils::globalVariables(
  c(
    ".",
    "stratum_1_surface_p_s1_unburnt",
    "stratum_1_surface_p_s1_duff",
    "stratum_3_elevated_p_s3_crown",
    "straum_4_intermediate_p_s4_crown",
    "straum_4_intermediate_p_s4_char",
    "stratum_5_overstorey_p_s5_crown",
    "stratum_5_overstorey_p_s5_litter",
    "stratum_5_overstorey_p_s5_char",
    "stratum_3_elevated_p_s3_fcov",
    "straum_4_intermediate_p_s4_fcov",
    "stratum_5_overstorey_p_s5_fcov",
    "stratum_1_surface_s1_fcov",
    "stratum_2_near_surface_s2_fcov",
    "stratum_3_elevated_s3_fcov",
    "straum_4_intermediate_s4_fcov",
    "stratum_5_overstorey_s5_fcov",
    # old:
    "stratum_1_surface_s1_area_unburnt",
    "stratum_1_surface_s1_coarse_fuel",
    "stratum_1_surface_s1_duff",
    "stratum_1_surface_s1_fcov_post_fire_leaf_fall",
    "stratum_2_near_surface_s2_area_unburnt",
    "stratum_2_near_surface_s2_fcov",
    "stratum_2_near_surface_s2_fcov_regenerating_plants",
    "stratum_2_near_surface_s2_grass_trees_with_skirts",
    "stratum_2_near_surface_s2_unburnt_shrub_density",
    "stratum_3_elevated_s3_density_bare_shrubs",
    "stratum_3_elevated_s3_fcov",
    "stratum_3_elevated_s3_fcov_original_crown_intact",
    "straum_4_intermediate_s4_char_height",
    "straum_4_intermediate_s4_fcov",
    "straum_4_intermediate_s4_fcov_original_crown_intact",
    "straum_4_intermediate_s4_resprouting_on_live_trees",
    "stratum_5_overstorey_s5_char_height",
    "stratum_5_overstorey_s5_fcov",
    "stratum_5_overstorey_s5_fcov_original_crown_intact",
    "stratum_5_overstorey_s5_no_trees_over_20cm_fallen",
    "stratum_5_overstorey_s5_resprouting_on_live_trees",
    "ozcbi"
  )
)
