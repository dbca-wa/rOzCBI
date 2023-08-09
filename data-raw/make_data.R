# ---------------------------------------------------------------------------- #
# This file generates and updates the provided package data "burngrading01".
#

loc <- fs::path("media")
fs::dir_create(loc)

ruODK::ru_setup(
  svc="https://ruodk.getodk.cloud/v1/projects/1/forms/burn_grading_forest.svc",
  un=Sys.getenv("RUODK_UN"),
  pw=Sys.getenv("RUODK_PW")
)

bgf <- ruODK::odata_submission_get(
  verbose = TRUE,
  tz = "Australia/Perth",
  local_dir = loc,
  wkt = T,
  top = 10
)

ruODK::ru_setup(
  svc="https://ruodk.getodk.cloud/v1/projects/1/forms/burn_grading_heath.svc",
  un=Sys.getenv("RUODK_UN"),
  pw=Sys.getenv("RUODK_PW")
)

bgh <- ruODK::odata_submission_get(
  verbose = TRUE,
  tz = "Australia/Perth",
  local_dir = loc,
  wkt = T,
  top = 10
)

ruODK::ru_setup(
  svc="https://ruodk.getodk.cloud/v1/projects/1/forms/burn_grading_verify.svc",
  un=Sys.getenv("RUODK_UN"),
  pw=Sys.getenv("RUODK_PW")
)

bgv <- ruODK::odata_submission_get(
  verbose = TRUE,
  tz = "Australia/Perth",
  local_dir = loc,
  wkt = T,
  top = 10
)

# Resize images to minimise package size
# This works only under Linux based OS
system("find media -name *.jpg -exec mogrify -resize 200x150 {} \\;")

# Update vignette "analysis" header with:
ymlthis::yml_resource_files(ymlthis::yml(), fs::dir_ls(loc))

# Move files where header expects them
fs::dir_copy(loc, here::here("vignettes/media"), overwrite = TRUE)
# fs::dir_delete(loc)

# usethis::use_data(burngrading01, overwrite = T, compress = "xz")
usethis::use_data(bgf, overwrite = T, compress = "xz")
usethis::use_data(bgh, overwrite = T, compress = "xz")
usethis::use_data(bgv, overwrite = T, compress = "xz")
