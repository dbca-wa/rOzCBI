test_that("calculate_ozcbi returns 0 if no data given", {
  testthat::expect_equal(calculate_ozcbi(), 0)
})

test_that("calculate_ozcbi sends its regards", {
  testthat::expect_message(calculate_ozcbi(verbose = TRUE))
})

test_that("calculate_ozcbi is 1 if all scores are 1", {
  testthat::expect_equal(
    calculate_ozcbi(
      stratum_1_surface_s1_fcov_post_fire_leaf_fall = 1,
      stratum_1_surface_s1_area_unburnt = 1,
      stratum_1_surface_s1_duff = 1,
      stratum_1_surface_s1_coarse_fuel = 1,
      stratum_2_near_surface_s2_area_unburnt = 1,
      stratum_2_near_surface_s2_grass_trees_with_skirts = 1,
      stratum_2_near_surface_s2_unburnt_shrub_density = 1,
      stratum_2_near_surface_s2_fcov_regenerating_plants = 1,
      stratum_3_elevated_s3_fcov_original_crown_intact = 1,
      stratum_3_elevated_s3_density_bare_shrubs = 1,
      straum_4_intermediate_s4_fcov_original_crown_intact = 1,
      straum_4_intermediate_s4_resprouting_on_live_trees = 1,
      straum_4_intermediate_s4_char_height = 1,
      stratum_5_overstorey_s5_fcov_original_crown_intact = 1,
      stratum_5_overstorey_s5_no_trees_over_20cm_fallen = 1,
      stratum_5_overstorey_s5_resprouting_on_live_trees = 1,
      stratum_5_overstorey_s5_char_height = 1,
      stratum_1_surface_s1_fcov = 1,
      stratum_2_near_surface_s2_fcov = 1,
      stratum_3_elevated_s3_fcov = 1,
      straum_4_intermediate_s4_fcov = 1,
      stratum_5_overstorey_s5_fcov = 1,
      verbose = FALSE
    ),
    1
  )
})

test_that("calculate_ozcbi is 2 if all scores=2 and all fcov=2", {
  testthat::expect_equal(
    calculate_ozcbi(
      stratum_1_surface_s1_fcov_post_fire_leaf_fall = 2,
      stratum_1_surface_s1_area_unburnt = 2,
      stratum_1_surface_s1_duff = 2,
      stratum_1_surface_s1_coarse_fuel = 2,
      stratum_2_near_surface_s2_area_unburnt = 2,
      stratum_2_near_surface_s2_grass_trees_with_skirts = 2,
      stratum_2_near_surface_s2_unburnt_shrub_density = 2,
      stratum_2_near_surface_s2_fcov_regenerating_plants = 2,
      stratum_3_elevated_s3_fcov_original_crown_intact = 2,
      stratum_3_elevated_s3_density_bare_shrubs = 2,
      straum_4_intermediate_s4_fcov_original_crown_intact = 2,
      straum_4_intermediate_s4_resprouting_on_live_trees = 2,
      straum_4_intermediate_s4_char_height = 2,
      stratum_5_overstorey_s5_fcov_original_crown_intact = 2,
      stratum_5_overstorey_s5_no_trees_over_20cm_fallen = 2,
      stratum_5_overstorey_s5_resprouting_on_live_trees = 2,
      stratum_5_overstorey_s5_char_height = 2,
      stratum_1_surface_s1_fcov = 1,
      stratum_2_near_surface_s2_fcov = 1,
      stratum_3_elevated_s3_fcov = 1,
      straum_4_intermediate_s4_fcov = 1,
      stratum_5_overstorey_s5_fcov = 1,
      verbose = FALSE
    ),
    2
  )
})

test_that("calculate_ozcbi ignores grades from strata with fcov 0", {
  testthat::expect_equal(
    calculate_ozcbi(
      stratum_1_surface_s1_fcov_post_fire_leaf_fall = 1,
      stratum_1_surface_s1_area_unburnt = 1,
      stratum_1_surface_s1_duff = 1,
      stratum_1_surface_s1_coarse_fuel = 1,
      stratum_2_near_surface_s2_area_unburnt = 3,
      stratum_2_near_surface_s2_grass_trees_with_skirts = 3,
      stratum_2_near_surface_s2_unburnt_shrub_density = 3,
      stratum_2_near_surface_s2_fcov_regenerating_plants = 3,
      stratum_3_elevated_s3_fcov_original_crown_intact = 3,
      stratum_3_elevated_s3_density_bare_shrubs = 3,
      straum_4_intermediate_s4_fcov_original_crown_intact = 3,
      straum_4_intermediate_s4_resprouting_on_live_trees = 3,
      straum_4_intermediate_s4_char_height = 3,
      stratum_5_overstorey_s5_fcov_original_crown_intact = 3,
      stratum_5_overstorey_s5_no_trees_over_20cm_fallen = 3,
      stratum_5_overstorey_s5_resprouting_on_live_trees = 3,
      stratum_5_overstorey_s5_char_height = 3,
      stratum_1_surface_s1_fcov = 1,
      stratum_2_near_surface_s2_fcov = 0,
      stratum_3_elevated_s3_fcov = 0,
      straum_4_intermediate_s4_fcov = 0,
      stratum_5_overstorey_s5_fcov = 0,
      verbose = FALSE
    ),
    1
  )
})


test_that("calculate_ozcbi gets different ozcbi from real data", {
  data("burngrading01")

  data_with_ozcbi <- burngrading01 %>% add_ozcbi()
  testthat::expect_false(
    data_with_ozcbi$ozcbi[[3]] == data_with_ozcbi$ozcbi[[2]]
  )
})


# usethis::use_r("calculate_ozcbi")
