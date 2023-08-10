#' Display a reactable of Burn Grading Forest data (incl OzCBI) with details
#'
#' `r lifecycle::badge("stable")`
#'
#' @param data Data from form Burn Grading Forest with OzCBI.
#' @return An interactive reactable.
#' @export
#' @family helpers
#' @examples
#' \dontrun{
#' data("bgf")
#' bgf %>%
#'   add_ozcbi_forest() %>%
#'   reactable_ozcbi_forest()
#' }
reactable_ozcbi_forest <- function(data) {
  data %>%
    reactable::reactable(
      sortable = TRUE,
      filterable = TRUE,
      details = function(index) {
        htmltools::tags$div(
          htmltools::tags$img(
            width = "200px;",
            alt = "Plot photo",
            src = data[index, ]$details_plot_photo
          ),
          htmltools::tags$img(
            width = "200px;",
            alt = "Stratum 1 photo",
            src = data[index, ]$stratum_1_surface_s1_photo
          ),
          htmltools::tags$img(
            width = "200px;",
            alt = "Stratum 2 photo",
            src = data[index, ]$stratum_2_near_surface_s2_photo
          ),
          htmltools::tags$img(
            width = "200px;",
            alt = "Stratum 3 photo",
            src = data[index, ]$stratum_3_elevated_s3_photo
          ),
          htmltools::tags$img(
            width = "200px;",
            alt = "Stratum 4 photo",
            src = data[index, ]$straum_4_intermediate_s4_photo
          ),
          htmltools::tags$img(
            width = "200px;",
            alt = "Stratum 5 photo",
            src = data[index, ]$stratum_5_overstorey_s5_photo
          )
        )
      }
    )
}

# usethis::use_test("reactable_ozcbi_forest")
