test_that("calculate_ozcbi_forest works with missing data", {
  expect_equal(calculate_ozcbi_forest(stratum_1_surface_p_s1_unburnt = 1), 1)
  expect_equal(calculate_ozcbi_forest(stratum_1_surface_p_s1_unburnt = 0.5), 0.5)
  expect_equal(calculate_ozcbi_forest(
    stratum_5_overstorey_p_s5_crown = 2.0,
    stratum_5_overstorey_p_s5_fcov = 0.5
  ), 2 / 3)
})

test_that("calculate_ozcbi_forest works with complete data", {
  x <- calculate_ozcbi_forest(
    stratum_1_surface_p_s1_unburnt = 1,
    stratum_1_surface_p_s1_duff = 1,
    stratum_3_elevated_p_s3_crown = 1,
    straum_4_intermediate_p_s4_crown = 1,
    straum_4_intermediate_p_s4_char = 1,
    stratum_5_overstorey_p_s5_crown = 1,
    stratum_5_overstorey_p_s5_litter = 1,
    stratum_5_overstorey_p_s5_char = 1,
    stratum_1_surface_s1_fcov = 1,
    stratum_3_elevated_p_s3_fcov = 0,
    straum_4_intermediate_p_s4_fcov = 0,
    stratum_5_overstorey_p_s5_fcov = 0,
  )
  expect_equal(x, 1)
})
