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

loc <- fs::path("media")
fs::dir_create(loc)

burngrading01 <- ruODK::odata_submission_get(
  verbose = TRUE,
  tz = "Australia/Perth",
  local_dir = loc,
  wkt = T
)

# Resize images to minimise package size
system("find media -name *.jpg -exec mogrify -resize 200x150 {} \\;")

# Update vignette "analysis" header with:
ymlthis::yml_resource_files(ymlthis::yml(), fs::dir_ls(loc))

# Move files where header expects them
fs::dir_copy(loc, here::here("vignettes/media"), overwrite = TRUE)
fs::dir_delete(loc)

usethis::use_data(burngrading01, overwrite = T, compress = "xz")



