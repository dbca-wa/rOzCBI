test_that("map_burngrading returns an 800x600 leaflet htmlwidget", {
  data("burngrading01")
  burnmap <- burngrading01 %>%
    add_ozcbi() %>%
    map_burngrading()
  testthat::expect_equal(class(burnmap), c("leaflet", "htmlwidget"))
  testthat::expect_equal(burnmap$width, 800)
  testthat::expect_equal(burnmap$height, 600)
})


# usethis::use_r("map_burngrading")
