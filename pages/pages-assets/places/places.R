# places.R - Geocoder and Travel Map with Images

# Load necessary libraries
library(dplyr)
library(rstudioapi)
library(readr)
library(leaflet)
library(htmlwidgets)
library(tidygeocoder)

## INSTRUCTIONS
## Update the combined.csv file with new data.
## Upload images to Imgur and add links if desired.
## Run this entire script (Cmd + Shift + Enter).

## WARNINGS
## Ensure the 'combined.csv' file is closed before executing this script.
## Check the variable "new_places" to verify if geocoding was successful.

# Set working directory to the location of this script
setwd(dirname(getActiveDocumentContext()[["path"]]))

# Read in data from CSV file
combined <- read_csv("combined.csv")

# Geocode new places if latitude or longitude is missing
if (sum(is.na(combined$lat) | is.na(combined$long)) == 0) {
  message("LIAM SAYS: There were no new places to geocode")
  stop("Please try again with actual addresses to geocode...", call. = FALSE)
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

# Split data into 'home' and 'away'
combined_factored <- combined %>%
  mutate(max_year = sapply(strsplit(visited_year, ","), function(x) max(as.integer(trimws(x)))))

home <- combined_factored %>% filter(place %in% c("Perth, WA", "Singapore, Singapore"))
away <- combined_factored %>% filter(!place %in% c("Perth, WA", "Singapore, Singapore"))

# Create color palettes for the map
pal <- colorNumeric(
  palette = viridis::turbo(n = max(combined_factored$max_year, na.rm = TRUE) - 2008),
  domain = c(2008, max(combined_factored$max_year, na.rm = TRUE)),
  na.color = "dimgrey"
)

reverse_pal <- colorNumeric(
  palette = viridis::turbo(n = max(combined_factored$max_year, na.rm = TRUE) - 2008),
  domain = c(-2008, -max(combined_factored$max_year, na.rm = TRUE)),
  na.color = "dimgrey",
  reverse = TRUE
)

# Create the map
map <- combined_factored %>%
  leaflet() %>%
  addMarkers(
    data = home,
    lng = ~ long,
    lat = ~ lat,
    popup = ~ paste(
      "<b>", place, "</b><br>",
      "A place I call home!",
      "<br><img src='", image_url, "' width='150' height='auto'/>",
      sep = ""
    ),
    icon = leaflet::makeIcon(
      iconUrl = "https://cdn-icons-png.flaticon.com/512/25/25694.png",
      iconWidth = 15,
      iconHeight = 15,
      iconAnchorX = 12,
      iconAnchorY = 12,
      popupAnchorX = 1,
      popupAnchorY = -12
    )
  ) %>%
  addCircleMarkers(
    data = away,
    lng = ~ long,
    lat = ~ lat,
    popup = ~ paste(
      "<b>", place, "</b><br>",
      "Years visited: ", visited_year,
      "<br><img src='", image_url, "' width='150' height='auto'/>",
      sep = ""
    ),
    color = ~ pal(max_year),
    stroke = FALSE,
    fillOpacity = 0.75,
    radius = 4.5
  ) %>%
  addLegend(
    pal = reverse_pal,
    data = away %>% filter(max_year >= 2008 | is.na(max_year)),
    values = ~ (-max_year),
    title = "Year",
    opacity = 1,
    position = "bottomright",
    na.label = "<2008",
    labFormat = labelFormat(big.mark = "", transform = function(x) -x)
  ) %>%
  addLayersControl(
    baseGroups = c("CartoDB.Positron", "Esri.WorldTopoMap", "OpenStreetMap"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  addProviderTiles("CartoDB.Positron", group = "CartoDB.Positron", options = providerTileOptions(minZoom = 1, maxZoom = 8)) %>%
  addProviderTiles("OpenStreetMap", group = "OpenStreetMap", options = providerTileOptions(minZoom = 1, maxZoom = 8)) %>%
  addProviderTiles("Esri.WorldTopoMap", group = "Esri.WorldTopoMap", options = providerTileOptions(minZoom = 1, maxZoom=8)) %>%
  leaflet::fitBounds(lng1=-90, lat1=-80, lng2=90, lat2=80) %>%
  leaflet.extras::addFullscreenControl() %>%
  leaflet.extras::addResetMapButton() %>%
  leaflet::setView(lat=0, lng=0, zoom=1)

# Display the map
map

# Save/write map as widget (uncomment to use)
map %>% saveWidget('places.html') # save as widget

# Git commands
system("git config --global user.email 'liam.k@columbia.edu'")
system("git pull") # Pull first
commit_message <- "update places.html map"
system("git add combined.csv")
system("git add places.html")
system("git add places.R")
system2("git", c("commit", "-m", shQuote(commit_message)))
system("git push -u origin main") # Push changes to remote repository
