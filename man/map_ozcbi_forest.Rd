% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/map_ozcbi_forest.R
\name{map_ozcbi_forest}
\alias{map_ozcbi_forest}
\title{Map Burn Grading Forest data (incl OzCBI) with labels and popups}
\usage{
map_ozcbi_forest(data)
}
\arguments{
\item{data}{Data from form Burn Grading Forest with OzCBI.}
}
\value{
A leaflet map
}
\description{
Map Burn Grading Forest data (incl OzCBI) with labels and popups
}
\examples{
\dontrun{
data("bgf")
bgf \%>\%
  add_ozcbi_forest() \%>\%
  map_ozcbi_forest()
}
}
\seealso{
Other helpers: 
\code{\link{extract_grading}()},
\code{\link{reactable_ozcbi_forest}()}
}
\concept{helpers}
