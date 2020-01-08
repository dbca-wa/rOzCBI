
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `rGeoCBI`: A burn severity assessment toolkit <img src="man/figures/rGeoCBI.png" align="right" alt="How good was that burn?" width="120" />

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/dbca-wa/rGeoCBI.svg?branch=master)](https://travis-ci.org/dbca-wa/rGeoCBI)
<!-- badges: end -->

rGeoCBI contains background, digital data capture, analysis, and
visualisation for the calculation of GeoCBI, a composite burn index for
the initial assessment of the short-term burn severity from remotely
sensed data.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
remotes::install_github("dbca-wa/rGeoCBI")
```

## Usage

### Background on GeoCBI

[paper](https://doi.org/10.1016/j.rse.2008.10.011)
[pdf](https://www.researchgate.net/publication/229043914_GeoCBI_A_modified_version_of_the_Composite_Burn_Index_for_the_initial_assessment_of_the_short-term_burn_severity_from_remotely_sensed_data)

### Data capture

Use supplied Xform to capture data digitally using OpenDataKit.

### Data access

Use ruODK to access captured data.

### Data analysis

Use this package to calculate GeoCBI from captured data.

## Attribution and Citation

`rGeoCBI` was developed, and is maintained, by Florian Mayer for the
Western Australian [Department of Biodiversity, Conservation and
Attractions (DBCA)](https://www.dbca.wa.gov.au/).

The background image in package logo shows the aerial view of a
prescribed burn in the Pilbara. Photo: Paul Rampant (DBCA).

To cite package `rGeoCBI` in publications use:

``` r
citation("ruODK")
#> 
#> To cite ruODK in publications use:
#> 
#>   Florian W. Mayer (2019). ruODK: Client for the ODK Central API. R package version 0.6.6.
#>   https://github.com/dbca-wa/ruODK
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Misc{,
#>     title = {ruODK: Client for the ODK Central API},
#>     author = {Florian W. Mayer},
#>     note = {R package version 0.6.6},
#>     year = {2019},
#>     url = {https://github.com/dbca-wa/ruODK},
#>   }
```
