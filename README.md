
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rOzCBI: A Burn Severity Assessment Toolkit for Austral Vegetation Communities <img src="man/figures/rOzCBI.png" align="right" alt="How good was that burn?" width="120" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/dbca-wa/rOzCBI/workflows/R-CMD-check/badge.svg?branch=master)](https://github.com/dbca-wa/rOzCBI/actions)
[![Travis build
status](https://travis-ci.org/dbca-wa/rOzCBI.svg?branch=master)](https://travis-ci.org/dbca-wa/rOzCBI)
[![CircleCI build
status](https://circleci.com/gh/dbca-wa/rOzCBI/tree/master.svg?style=svg)](https://circleci.com/gh/dbca-wa/rOzCBI/tree/master)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/dbca-wa/rOzCBI?branch=master&svg=true)](https://ci.appveyor.com/project/florianm/rOzCBI)
[![Codecov test
coverage](https://codecov.io/gh/dbca-wa/rOzCBI/branch/master/graph/badge.svg)](https://codecov.io/gh/dbca-wa/rOzCBI?branch=master)
[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Last-changedate](https://img.shields.io/github/last-commit/dbca-wa/rOzCBI.svg)](https://github.com/dbca-wa/rOzCBI/commits/master)
[![GitHub
issues](https://img.shields.io/github/issues/dbca-wa/rOzCBI.svg?style=popout)](https://github.com/dbca-wa/rOzCBI/issues/)
<!-- badges: end -->

rOzCBI in a nutshell:

  - [OpenDataKit](https://opendatakit.org/) forms to evaluate a burnt
    site.
  - Helpers to calculate the OzCBI from the burn grading field data.
  - Instructions to get up and running with digital data capture and
    data analysis.
  - Working examples of the entire data flow.

## What

To evaluate the severity of burns, the differential normalised burn
ratio (dNBR) of a burnt site can be derived from satellite imagery
cost-effectively and on a large scale. The NBR is calculated from NIR
and SWIR bands as \(NBR = (NIR - SWIR) / (NIR + SWIR)\). The dNBR is
calculated from pre- and post-burn NBR as
\(dNBR = NBR_{post} / NBR_{pre}\). To calibrate the dNBR, ground
truthing field work can derive an index called “OzCBI” from the
condition and composition of a burnt site.

rOzCBI contains background, digital data capture, analysis, and
visualisation for the calculation of OzCBI, a composite burn index for
the initial assessment of the short-term burn severity from remotely
sensed data.

OzCBI was derived from GeoCBI, which was first described in [De Santis,
Angela & Chuvieco, Emilio.
(2009)](https://doi.org/10.1016/j.rse.2008.10.011) ([Fulltext
(pdf)](https://www.researchgate.net/publication/229043914_GeoCBI_A_modified_version_of_the_Composite_Burn_Index_for_the_initial_assessment_of_the_short-term_burn_severity_from_remotely_sensed_data))
GeoCBI: A modified version of the Composite Burn Index for the initial
assessment of the short-term burn severity from remotely sensed data.
Remote Sensing of Environment
113  
[DOI 10.1016/j.rse.2008.10.011](https://www.sciencedirect.com/science/article/abs/pii/S0034425708003246)

OzCBI was further modified to suit Australian vegetation communities by
Valerie Densmore at DBCA in Western Australia. This version of the OzCBI
is currently being tested and validated so the current version may not
reflect the final form. Feedback on the use and validity of OzCBI is
welcome as [GitHub issues](https://github.com/dbca-wa/rOzCBI/issues).

## How

`rOzCBI` supplies an Xform to capture data digitally using OpenDataKit,
then goes on to access the data directly from R using the package
`ruODK`, and provides helper methods to calculate the OzCBI from the
captured data.

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
remotes::install_github("dbca-wa/rOzCBI")
```

The overall data flow from digital form to data analysis is described at
[ruODK](https://dbca-wa.github.io/ruODK/index.html).

![An ODK setup with ODK Build, Central, Collect, and
ruODK](https://www.lucidchart.com/publicSegments/view/952c1350-3003-48c1-a2c8-94bad74cdb46/image.png)

Read vignette [Digital Data
Capture](https://dbca-wa.github.io/rOzCBI/articles/forms.html) on the
design and setup of the digital data capture form and infrastructure.

Read vignette [Data
analysis](https://dbca-wa.github.io/rOzCBI/articles/analysis.html) on
access, analysis, and visualisation of the captured burn grading data
using the GeoCBI assessment method.

## Who

The methodology was compiled and adapted to Western Australian
vegetation by Valerie Densmore (DBCA).

The R package `rOzCBI` was developed, and is maintained, by Florian
Mayer (DBCA) for the Western Australian [Department of Biodiversity,
Conservation and Attractions (DBCA)](https://www.dbca.wa.gov.au/).

The background image in the package logo shows the aerial view of a
prescribed burn in the Pilbara. Photo: Paul Rampant (DBCA).

To cite package `rOzCBI` in publications use:

``` r
citation("rOzCBI")
#> 
#> To cite rOzCBI in publications use:
#> 
#>   Valerie Densmore, Florian W. Mayer (2020). rOzCBI: A Burn Severity
#>   Assessment Toolkit for Austral Vegetation Communities. R package
#>   version 0.0.3. https://github.com/dbca-wa/rOzCBI
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Misc{,
#>     title = {rOzCBI: A Burn Severity Assessment Toolkit for Austral Vegetation Communities},
#>     author = {Valerie Densmore and Florian W. Mayer},
#>     note = {R package version 0.0.3},
#>     year = {2020},
#>     url = {https://github.com/dbca-wa/rOzCBI},
#>   }
```

## Contribute

Feedback and bug reports are welcome as
[issues](https://github.com/dbca-wa/rOzCBI/issues).

The package development workflow is described in vignette
[Development](https://dbca-wa.github.io/rOzCBI/articles/dev.html).
