#' Burn Grading Forest form submission data
#'
#' @source Form submissions of form
#'   `system.file("odk/BurnGradingForest.xlsx", package = "rOzCBI")`
#'   downloaded from ODK Central using `ruODK::odata_submission_get()`
#'   (see `vignette("analysis")`).
#' @family included
"bgf"

#' Burn Grading Heath form submission data
#'
#' @source Form submissions of form
#'   `system.file("odk/BurnGradingHeath.xlsx", package = "rOzCBI")`
#'   downloaded from ODK Central using `ruODK::odata_submission_get()`
#'   (see `vignette("analysis")`).
#' @family included
"bgh"

#' Burn Grading Verify form submission data
#'
#' @source Form submissions of form
#'   `system.file("odk/BurnGradingVerify.xlsx", package = "rOzCBI")`
#'   downloaded from ODK Central using `ruODK::odata_submission_get()`
#'   (see `vignette("analysis")`).
#' @family included
"bgv"

#' Burn Grading 0.1 form submission data
#'
#' `r lifecycle::badge("superseded")`
#'
#' Use data("bgf") instead.
#'
#' @source Form submissions of form
#'   `system.file("odk/archive/BurnGrading01.xml", package = "rOzCBI")`
#'   downloaded from ODK Central using `ruODK::odata_submission_get()`
#'   (see `vignette("analysis")`).
#' @family included
"burngrading01"


#' FMS verify severity form submission data
#'
#' `r lifecycle::badge("superseded")`
#'
#' Use data("bgv") instead.
#'
#' @source Form submissions of form
#'   `system.file("odk/archive/FMSVerifySeverity.xml", package = "rOzCBI")`
#'   downloaded from ODK Central using `ruODK::odata_submission_get()`
#'   (see `vignette("analysis")`).
#' @family included
"fms"
