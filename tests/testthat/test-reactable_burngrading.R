test_that("reactable_burngrading works", {
  data("burngrading01")
  rt <- burngrading01 %>%
    add_geocbi() %>%
    reactable_burngrading()
  testthat::expect_equal(class(rt), c("reactable", "htmlwidget"))
})

# usethis::use_r("reactable_burngrading")
