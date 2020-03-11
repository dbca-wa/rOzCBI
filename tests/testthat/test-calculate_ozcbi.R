test_that("calculate_ozcbi returns 0 if no data given", {
  testthat::expect_equal(calculate_ozcbi(), 0)
})

test_that("calculate_ozcbi sends its regards", {
  testthat::expect_message(calculate_ozcbi(verbose = TRUE))
})

test_that("calculate_ozcbi is 1 if all scores are 1", {
  testthat::expect_equal(
    calculate_ozcbi(
      s1_fcov_post_fire_leaf_fall = 1,
      s1_area_unburnt = 1,
      s1_duff = 1,
      s1_coarse_fuel = 1,
      s2_area_unburnt = 1,
      s2_grass_trees_with_skirts = 1,
      s2_unburnt_shrub_density = 1,
      s2_fcov_regenerating_plants = 1,
      s3_fcov_original_crown_intact = 1,
      s3_density_bare_shrubs = 1,
      s4_fcov_original_crown_intact = 1,
      s4_resprouting_on_live_trees = 1,
      s4_char_height = 1,
      s5_fcov_original_crown_intact = 1,
      s5_no_trees_over_20cm_fallen = 1,
      s5_resprouting_on_live_trees = 1,
      s5_char_height = 1,
      s1_fcov = 1,
      s2_fcov = 1,
      s3_fcov = 1,
      s4_fcov = 1,
      s5_fcov = 1,
      verbose = FALSE
    ),
    1
  )
})

test_that("calculate_ozcbi is 2 if all scores=2 and all fcov=2", {
  testthat::expect_equal(
    calculate_ozcbi(
      s1_fcov_post_fire_leaf_fall = 2,
      s1_area_unburnt = 2,
      s1_duff = 2,
      s1_coarse_fuel = 2,
      s2_area_unburnt = 2,
      s2_grass_trees_with_skirts = 2,
      s2_unburnt_shrub_density = 2,
      s2_fcov_regenerating_plants = 2,
      s3_fcov_original_crown_intact = 2,
      s3_density_bare_shrubs = 2,
      s4_fcov_original_crown_intact = 2,
      s4_resprouting_on_live_trees = 2,
      s4_char_height = 2,
      s5_fcov_original_crown_intact = 2,
      s5_no_trees_over_20cm_fallen = 2,
      s5_resprouting_on_live_trees = 2,
      s5_char_height = 2,
      s1_fcov = 1,
      s2_fcov = 1,
      s3_fcov = 1,
      s4_fcov = 1,
      s5_fcov = 1,
      verbose = FALSE
    ),
    2
  )
})

test_that("calculate_ozcbi ignores grades from strata with fcov 0", {
  testthat::expect_equal(
    calculate_ozcbi(
      s1_fcov_post_fire_leaf_fall = 1,
      s1_area_unburnt = 1,
      s1_duff = 1,
      s1_coarse_fuel = 1,
      s2_area_unburnt = 3,
      s2_grass_trees_with_skirts = 3,
      s2_unburnt_shrub_density = 3,
      s2_fcov_regenerating_plants = 3,
      s3_fcov_original_crown_intact = 3,
      s3_density_bare_shrubs = 3,
      s4_fcov_original_crown_intact = 3,
      s4_resprouting_on_live_trees = 3,
      s4_char_height = 3,
      s5_fcov_original_crown_intact = 3,
      s5_no_trees_over_20cm_fallen = 3,
      s5_resprouting_on_live_trees = 3,
      s5_char_height = 3,
      s1_fcov = 1,
      s2_fcov = 0,
      s3_fcov = 0,
      s4_fcov = 0,
      s5_fcov = 0,
      verbose = FALSE
    ),
    1
  )
})


test_that("calculate_ozcbi gets different ozcbi from real data", {
  data("burngrading01")

  data_with_ozcbi <- burngrading01 %>% add_ozcbi()
  testthat::expect_false(
    data_with_ozcbi$ozcbi[[1]] == data_with_ozcbi$ozcbi[[2]]
  )
})


# usethis::use_r("calculate_ozcbi")
