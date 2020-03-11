# rOzCBI 0.0.4
* Add GitHub Actions for CI, test coverage, website build and deployment.
* All references and function names are now renamed from `geocbi` to `ozcbi`.
* Tests pass on 

  * Windows Server 2019 (latest) with R 3.5
  * Ubuntu 18.04 (Bionic Beaver) with R 3.5 and 3.6
* Tests fail due to tidyr/dplyr/rlang unavailabilities on

  * Windows Server 2019 (latest) with R 3.6
  * macOS Catalina 10.15 (latest) with R 3.5 and 3.6
  * Ubuntu 16.04 (Xenial Xerus) with R 3.5 and 3.6

# rOzCBI 0.0.3
* Fix media attachments in package vignettes.
* Renamed from rGeoCBI to rOzCBI.

# rOzCBI 0.0.2
* Some improvements to form "Burn Grading 0.1" identified and in preparation
  as "Burn Grading 0.2". Pending review and QA.
* Add workhorse function `calculate_geocbi`. Example see vignette "analysis".
* Move helpers `map_burngrading` and `reactable_burngrading` from vignette 
  to own functions.
* Add Valerie Densmore as package author. Valerie has refined the GeoCBI for
  Western Austrlian Flora.

# rOzCBI 0.0.1
* Add package infrastructure: hosted documentation, continuous integration,
  code coverage, GitHub issue templates, license, citation and attribution.
