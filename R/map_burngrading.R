#' Map Burn Grading data (incl GeoCBI) with labels and popups
#'
#' @param data Data from form Burn Grading with GeoCBI.
#' @return A leaflet map
#' @export
#' @family helpers
#' @examples
#' \dontrun{
#' data("burngrading01")
#' burngrading01 %>%
#'   add_geocbi() %>%
#'   map_burngrading()
#' }
map_burngrading <- function(data) {

  getColour <- function(geocbi) {
      if(geocbi <= 1) {
        "green"
      } else if(geocbi <= 2) {
        "orange"
      } else {
        "red"
      }
  }

  leaflet::leaflet(width = 800, height = 600) %>%
    leaflet::addProviderTiles("Esri.WorldImagery", group = "Aerial") %>%
    leaflet::addProviderTiles("OpenStreetMap.Mapnik", group = "Place names") %>%
    leaflet::clearBounds() %>%
    # leaflet::setView(130,-33, 4) %>%
    leaflet::addAwesomeMarkers(
      data = data,
      lng = ~location_longitude, lat = ~location_latitude,
      icon = leaflet::makeAwesomeIcon(
        text = ~round(as.numeric(geocbi), 2),
        markerColor = ~ getColour(geocbi)
      ),
      label = ~ glue::glue("[{geocbi}] {plot_name} {observation_start_time}"),
      popup = ~ glue::glue('
<h3>{plot_name}</h3><h4>GeoCBI {round(as.numeric(geocbi), 4)}</h4>
Survey start {observation_start_time}</br>
Reporter {reporter}</br>
Device {device_id}</br>
<div>Burn homogeneous throughout plot: {homogeneous_burn_severity}</div>

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
<img src="{plot_photo}" alt="Plot overview">
<div class="carousel-caption">Plot overview</div>
</div>
<div class="item">
<img src="{s1_photo}" alt="Stratum 1">
<div class="carousel-caption">Stratum 1</div>
</div>
<div class="item">
<img src="{s2_photo}" alt="Stratum 2: {s2_dominant_vegetation}">
<div class="carousel-caption">Stratum 2: {s2_dominant_vegetation}</div>
</div>
<div class="item">
<img src="{s3_photo}" alt="Stratum 3: {s3_dominant_vegetation}">
<div class="carousel-caption">Stratum 3: {s3_dominant_vegetation}</div>
</div>
<div class="item">
<img src="{s4_photo}" alt="Stratum 4: {s4_dominant_vegetation}">
<div class="carousel-caption">Stratum 4: {s4_dominant_vegetation}</div>
</div>
<div class="item">
<img src="{s5_photo}" alt="Stratum 5: {s5_dominant_vegetation}">
<div class="carousel-caption">Stratum 5: {s5_dominant_vegetation}</div>
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

<h5>Additional observations</h5>
<div>{no_grass_trees} grass trees</div>
<div>{no_hollow_logs} hollow logs</div>
<div>{no_standing_trees_gt20cm} standing trees &gt;20cm</div>
<div>{no_standing_trees_with_hollows}
standing trees with hollows</div>
<div>Litter leaf depth {depth_leaf_litter_cm}cm</div>
<div>Avg gap between unburnt patches: {avg_gap_between_unburnt_patches}m</div>
<div>Evidence of native fauna: {evidence_of_native_fauna}</div>
<div>Evidence of feral fauna: {evidence_of_feral_fauna}</div>
      '),
      clusterOptions = leaflet::markerClusterOptions()
    ) %>%
    leaflet::addLayersControl(
      baseGroups = c("Aerial", "Place names"),
      # overlayGroups = "",
      options = leaflet::layersControlOptions(collapsed = FALSE)
    )
}


# usethis::use_test("map_burngrading")
