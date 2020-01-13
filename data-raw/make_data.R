# ---------------------------------------------------------------------------- #
# This file generates and updates the provided package data "burngrading01".
#
ruODK::ru_setup(
  svc = paste0(
    "https://odkcentral.dbca.wa.gov.au/v1/projects/27/",
    "forms/build_Burn-Grading-0-1_1578487677.svc"
  ),
  un = Sys.getenv("ODKC_UN"),
  pw = Sys.getenv("ODKC_PW")
)

burngrading01 <- ruODK::odata_submission_get(
  verbose = TRUE,
  tz = "Australia/Perth",
  local_dir = fs::path("media"),
  wkt = T
)

fs::dir_copy(fs::path("media"), here::here("vignettes/media"), overwrite = TRUE)
fs::dir_delete(fs::path("media"))

usethis::use_data(burngrading01, overwrite = T, compress = "xz")
