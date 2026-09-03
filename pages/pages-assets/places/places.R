# places.R - Geocoder and Travel Map with Images
# Load necessary libraries
library(dplyr)
library(rstudioapi)
library(readr)
library(leaflet)
library(htmlwidgets)
library(tidygeocoder)

carto_key <- Sys.getenv("CARTO_API_KEY")

## INSTRUCTIONS ##
# Update the combined.csv file with new data.
# Upload images to Imgur and add links if desired.
# Run this entire script (Cmd + Shift + Enter).

## WARNINGS ##
# Ensure the 'combined.csv' file is closed before executing this script.
# Check the variable "new_places" to verify if geocoding was successful.

# Set working directory to the location of this script
setwd(dirname(getActiveDocumentContext()[["path"]]))

# Read in data from CSV file
combined <- read_csv("combined.csv")

# Geocode new places if latitude or longitude is missing
if (sum(is.na(combined$lat) | is.na(combined$long)) == 0) {
  message("LIAM SAYS: There were no new places to geocode")
} else {
  new_places <- combined %>%
    filter(is.na(lat) | is.na(long)) %>%
    select(-lat, -long) %>%
    geocode(address = place, method = "osm")
  
  # Report successes and failures in geocoding
  successes <- sum(!is.na(new_places$lat) & !is.na(new_places$long))
  failures <- sum(is.na(new_places$lat) | is.na(new_places$long))
  
  cat("New places geocoded:\n\n")
  for (i in seq_len(nrow(new_places))) {
    status <- ifelse(is.na(new_places$lat[i]) | is.na(new_places$long[i]), "[FAILURE]", "[SUCCESS]")
    cat(paste(new_places$place[i], status), "\n")
  }
  
  # Update combined data with newly geocoded places
  combined <<- combined %>%
    filter(!is.na(lat) & !is.na(long)) %>%
    bind_rows(new_places)
  
  # Write updated data back to CSV
  message("File combined.csv successfully overwritten")
  write_csv(combined, "combined.csv")
}

# Process max year and create a discrete year group for toggling
combined_factored <- combined %>%
  mutate(
    max_year = sapply(strsplit(visited_year, ","), function(x) max(as.integer(trimws(x)))),
    # THE FIX: Append a space so JavaScript treats these as strings, not sortable integers
    year_group = ifelse(is.na(max_year) | max_year < 2008, "<2008 ", paste0(max_year, " "))
  )

# Split data into 'home' and 'away'
home_places <- c("Perth, WA", "Singapore, Singapore", "Atlanta, GA")
home <- combined_factored %>% filter(place %in% home_places)
away <- combined_factored %>% filter(!place %in% home_places)

# --- STRICT SORTING LOGIC --- #
# Extract unique years, stripping the invisible space for numeric sorting
numeric_years <- suppressWarnings(as.numeric(trimws(unique(away$year_group))))
valid_years <- sort(numeric_years[!is.na(numeric_years)], decreasing = TRUE)

# Construct the strictly ordered levels: newest to oldest, then <2008
ordered_levels <- c(paste0(valid_years, " "), "<2008 ")
ordered_levels <- ordered_levels[ordered_levels %in% unique(away$year_group)]

# Apply the perfectly ordered factor
away$year_group <- factor(away$year_group, levels = ordered_levels)

# CRITICAL: Sort the actual data frame by this factor so Leaflet encounters them perfectly in order
away <- away %>% arrange(year_group)
unique_year_groups <- levels(away$year_group)
# ---------------------------- #

# Create a discrete color palette (REVERSED)
pal_discrete <- colorFactor(
  palette = rev(viridis::turbo(length(unique_year_groups))), # Reverses the turbo color order
  domain = away$year_group,
  na.color = "dimgrey"
)

# Construct the authenticated CARTO URL Template string
carto_url <- paste0("https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png?api_key=", carto_key)

# Create the map
map <- combined_factored %>%
  leaflet() %>%
  addMarkers(
    data = home, lng = ~ long, lat = ~ lat,
    popup = ~ paste(
      "<b>", place, "</b><br>",
      "A place I call home!",
      "<br><img src='", image_url, "' width='150' height='auto'/>", sep = ""
    ),
    icon = leaflet::makeIcon(
      iconUrl = "https://cdn-icons-png.flaticon.com/512/25/25694.png",
      iconWidth = 15, iconHeight = 15,
      iconAnchorX = 12, iconAnchorY = 12,
      popupAnchorX = 1, popupAnchorY = -12
    )
  ) %>%
  addCircleMarkers(
    data = away, lng = ~ long, lat = ~ lat,
    group = ~ year_group,
    popup = ~ paste(
      "<b>", place, "</b><br>",
      "Years visited: ", visited_year,
      "<br><img src='", image_url, "' width='150' height='auto'/>", sep = ""
    ),
    fillColor = ~ pal_discrete(year_group),
    stroke = FALSE, # Removes the border
    fillOpacity = 0.85,
    radius = 5.5
  ) %>%
  addLegend(
    pal = pal_discrete,
    values = away$year_group,
    title = "Year Visited",
    opacity = 1,
    position = "bottomleft"
  ) %>%
  addLayersControl(
    baseGroups = c("CartoDB.Positron", "OpenStreetMap", "Esri.WorldTopoMap"),
    overlayGroups = unique_year_groups,
    options = layersControlOptions(collapsed = TRUE)
  ) %>%
  # NEW: Substituted provider endpoint with manual layout and key parameter mapping
  addTiles(
    urlTemplate = carto_url,
    group = "CartoDB.Positron",
    options = tileOptions(minZoom = 1, maxZoom = 8),
    attribution = paste(
      '&copy; <a href="https://openstreetmap.org">OpenStreetMap</a> contributors,',
      '&copy; <a href="https://carto.com">CARTO</a>'
    )
  ) %>%
  addProviderTiles("OpenStreetMap", group = "OpenStreetMap", options = providerTileOptions(minZoom = 1, maxZoom = 8)) %>%
  addProviderTiles("Esri.WorldTopoMap", group = "Esri.WorldTopoMap", options = providerTileOptions(minZoom = 1, maxZoom = 8)) %>%
  leaflet::fitBounds(lng1 = -90, lat1 = -80, lng2 = 90, lat2 = 80) %>%
  leaflet.extras::addFullscreenControl() %>%
  leaflet.extras::addResetMapButton() %>%
  leaflet::setView(lat = 0, lng = 0, zoom = 1) %>%
  # Inject proper Tableau-style (All) checkbox htmlwidgets::onRender("
  htmlwidgets::onRender("
  function(el, x) {
    setTimeout(function() {
      var layersControl = document.querySelector('.leaflet-control-layers-overlays');
      if (!layersControl) return;

      // Create the (All) label container
      var allLabel = document.createElement('label');
      allLabel.style.fontWeight = 'bold';
      allLabel.style.borderBottom = '1px solid #ccc';
      allLabel.style.paddingBottom = '5px';
      allLabel.style.marginBottom = '5px';

      // Create the checkbox
      var allCheckbox = document.createElement('input');
      allCheckbox.type = 'checkbox';
      allCheckbox.checked = true; // Map loads with all layers visible
      allCheckbox.className = 'leaflet-control-layers-selector';

      // Create text
      var allText = document.createElement('span');
      allText.innerHTML = ' <span>(All)</span>';

      allLabel.appendChild(allCheckbox);
      allLabel.appendChild(allText);

      // Insert at the top of the list
      layersControl.insertBefore(allLabel, layersControl.firstChild);

      // Function to get the actual layer checkboxes
      var getLayerCbs = function() {
        var cbs = Array.from(layersControl.querySelectorAll('input[type=\"checkbox\"]'));
        return cbs.filter(cb => cb !== allCheckbox);
      };

      // 1. When (All) is clicked, toggle the others
      allCheckbox.addEventListener('change', function(e) {
        var isChecked = e.target.checked;
        getLayerCbs().forEach(function(cb) {
          if (cb.checked !== isChecked) {
            cb.click(); // Fires Leaflet's native event
          }
        });
      });

      // 2. When an individual layer is clicked, update (All) state
      layersControl.addEventListener('change', function(e) {
        if (e.target !== allCheckbox && e.target.type === 'checkbox') {
          var layerCbs = getLayerCbs();
          var allChecked = layerCbs.every(cb => cb.checked);
          allCheckbox.checked = allChecked;
        }
      });
    }, 100);
  }
  ")

# Display the map
map

# Save/write map as widget
map %>% saveWidget('places.html')

# Git commands
system("git config --global user.email 'liam.k@columbia.edu'")
system("git pull") # Pull first
commit_message <- "Auto update map"
system("git add combined.csv")
system("git add places.html")
system("git add places.R")
system2("git", c("commit", "-m", shQuote(commit_message)))
system("git push -u origin main") # Push changes to remote repository
