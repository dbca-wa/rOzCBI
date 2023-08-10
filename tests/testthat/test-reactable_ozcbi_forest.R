test_that("reactable_ozcbi_forest works", {
  data("bgf")
  rt <- bgf %>%
    add_ozcbi_forest() %>%
    reactable_ozcbi_forest()
  testthat::expect_equal(class(rt), c("reactable", "htmlwidget"))
})
