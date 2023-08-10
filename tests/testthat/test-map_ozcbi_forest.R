test_that("map_ozcbi_forest returns an 800x600 leaflet htmlwidget", {
  data("bgf")
  burnmap <- bgf %>%
    add_ozcbi_forest() %>%
    map_ozcbi_forest()
  testthat::expect_equal(class(burnmap), c("leaflet", "htmlwidget"))
  testthat::expect_equal(burnmap$width, 800)
  testthat::expect_equal(burnmap$height, 600)
})
