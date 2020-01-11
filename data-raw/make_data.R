ruODK::ru_setup(
  svc = paste0("https://odkcentral.dbca.wa.gov.au/v1/projects/27/",
               "forms/build_Burn-Grading-0-1_1578487677.svc"),
  un = Sys.getenv("ODKC_UN"),
  pw = Sys.getenv("ODKC_PW")
)

burngrading01 <- ruODK::odata_submission_get(
  verbose = TRUE,
  tz = "Australia/Perth",
  local_dir = fs::path(here::here("vignettes/media")),
  wkt=T
)

usethis::use_data(burngrading01, overwrite = T, compress = "xz")
