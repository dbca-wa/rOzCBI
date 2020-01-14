#' Display a reactable of Burn Grading data (incl GeoCBI) with details
#'
#' @param data Data from form Burn Grading with GeoCBI.
#' @return An interactive reactable.
#' @export
#' @family helpers
#' @examples
#' \dontrun{
#' data("burngrading01")
#' burngrading01 %>%
#'   add_geocbi() %>%
#'   reactable_burngrading()
#' }
reactable_burngrading <- function(data){
  data %>%
    reactable::reactable(
      sortable = T,
      filterable = T,
      details = function(index) {
        htmltools::tags$div(
          htmltools::tags$img(
            width="200px;",
            alt="Plot photo",
            src=data[index,]$plot_photo
            ),
          htmltools::tags$img(
            width="200px;",
            alt="Stratum 1 photo",
            src=data[index,]$s1_photo
            ),
          htmltools::tags$img(
            width="200px;",
            alt="Stratum 2 photo",
            src=data[index,]$s2_photo
            ),
          htmltools::tags$img(
            width="200px;",
            alt="Stratum 3 photo",
            src=data[index,]$s3_photo
            ),
          htmltools::tags$img(
            width="200px;",
            alt="Stratum 4 photo",
            src=data[index,]$s4_photo
            ),
          htmltools::tags$img(
            width="200px;",
            alt="Stratum 5 photo",
            src=data[index,]$s5_photo
            )
        )
        }
      )
}

# usethis::use_test("reactable_burngrading")

