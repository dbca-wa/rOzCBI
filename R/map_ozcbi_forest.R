#' Map Burn Grading Forest data (incl OzCBI) with labels and popups
#'
#' @param data Data from form Burn Grading Forest with OzCBI.
#' @return A leaflet map
#' @export
#' @family helpers
#' @examples
#' \dontrun{
#' data("bgf")
#' bgf %>%
#'   add_ozcbi_forest() %>%
#'   map_ozcbi_forest()
#' }
map_ozcbi_forest <- function(data) {
  data_map <- data %>%
    dplyr::mutate(
      ozcbi_rnd = round(ozcbi, 2),
      marker_colour = dplyr::case_when(
        ozcbi <= 0.3 ~ "green",
        ozcbi <= 1.3 ~ "orange",
        ozcbi <= 2.1 ~ "red",
        ozcbi > 2.8 ~ "darkred"
      )
    )

  leaflet::leaflet(width = 800, height = 600) %>%
    leaflet::addProviderTiles("Esri.WorldImagery", group = "Aerial") %>%
    leaflet::addProviderTiles("OpenStreetMap.Mapnik", group = "Place names") %>%
    leaflet::clearBounds() %>%
    # leaflet::setView(130,-33, 4) %>%
    leaflet::addAwesomeMarkers(
      data = data_map,
      lng = ~details_location_longitude,
      lat = ~details_location_latitude,
      icon = leaflet::makeAwesomeIcon(
        text = ~ozcbi_rnd,
        markerColor = ~marker_colour
      ),
      label = ~ glue::glue(
        "[{ozcbi_rnd}] {details_site} {start}"
      ),
      popup = ~ glue::glue('
<h3>{details_site}</h3><h4>OzCBI {ozcbi_rnd}</h4>
Survey start {start}</br>
Reporter {reporter}</br>
Device {device_id}</br>
<div>Burn homogeneous throughout plot: {details_homogeneous_burn_severity}</div>

<div id="carousel-photos" class="carousel slide" data-ride="carousel">

<!-- Indicators -->
<ol class="carousel-indicators">
<li data-target="#carousel-photos" data-slide-to="0" class="active"></li>
<li data-target="#carousel-photos" data-slide-to="1"></li>
<li data-target="#carousel-photos" data-slide-to="2"></li>
<li data-target="#carousel-photos" data-slide-to="3"></li>
<li data-target="#carousel-photos" data-slide-to="4"></li>
<li data-target="#carousel-photos" data-slide-to="5"></li>
</ol>

<!-- Wrapper for slides -->
<div class="carousel-inner" role="listbox">
<div class="item active">
<img src="{details_plot_photo}" alt="Plot overview">
<div class="carousel-caption">Plot overview</div>
</div>
<div class="item">
<img src="{stratum_1_surface_s1_photo}" alt="Stratum 1">
<div class="carousel-caption">Stratum 1</div>
</div>
<div class="item">
<img src="{stratum_2_near_surface_s2_photo}"
alt="Stratum 2: {stratum_2_near_surface_s2_veg}">
<div class="carousel-caption">
Stratum 2: {stratum_2_near_surface_s2_veg}</div>
</div>
<div class="item">
<img src="{stratum_3_elevated_s3_photo}"
alt="Stratum 3: {stratum_3_elevated_s3_veg}">
<div class="carousel-caption">
Stratum 3: {stratum_3_elevated_s3_veg}</div>
</div>
<div class="item">
<img src="{straum_4_intermediate_s4_photo}"
alt="Stratum 4: {straum_4_intermediate_s4_veg}">
<div class="carousel-caption">
Stratum 4: {straum_4_intermediate_s4_veg}</div>
</div>
<div class="item">
<img src="{stratum_5_overstorey_s5_photo}"
alt="Stratum 5: {stratum_5_overstorey_s5_veg}">
<div class="carousel-caption">
Stratum 5: {stratum_5_overstorey_s5_veg}</div>
</div>
</div>

<!-- Controls -->
<a class="left carousel-control"
href="#carousel-photos" role="button" data-slide="prev">
<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
<span class="sr-only">Previous</span>
</a>
<a class="right carousel-control"
href="#carousel-photos" role="button" data-slide="next">
<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
<span class="sr-only">Next</span>
</a>
</div>
      '),
      clusterOptions = leaflet::markerClusterOptions()
    ) %>%
    leaflet::addLayersControl(
      baseGroups = c("Aerial", "Place names"),
      # overlayGroups = "",
      options = leaflet::layersControlOptions(collapsed = FALSE)
    )
}


# usethis::use_test("map_ozcbi_forest")
