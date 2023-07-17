# places.R geocoder and travel map with images

library(dplyr)
library(rstudioapi)
library(readr)
library(leaflet)
library(htmlwidgets)
library(tidygeocoder)

## INSTRUCTIONS
## Update the combined.csv file
## Upload images to imgur and add links if desired
## Then run this whole script (cmd + shift + enter)

## WARNINGS
## Make sure to close the 'combined.csv' file before executing this script
## Check the variable "new_places" to see whether the geocode has worked

setwd(dirname(getActiveDocumentContext()[["path"]]))

# read in data
combined <- read_csv("combined.csv")

# geocode new (if no new places, ignore -- it will throw an error)
if(sum(is.na(combined$lat) | is.na(combined$long)) == 0){
  message("LIAM SAYS: There were no new places to geocode")
  stop("Please try again with actual addresses to geocode...",
       call. = FALSE)
  
} else{
  
  new_places <- combined %>%
    filter(is.na(lat) | is.na(long)) %>%
    dplyr::select(-lat, -long) %>%
    geocode(address = place, method = "osm")
  
  successes <- sum(!is.na(new_places$lat) & !is.na(new_places$long))
  failures <-  sum(is.na(new_places$lat) | is.na(new_places$long))
  
  cat("New places geocoded: \n\n")
  
  for (i in seq_len(nrow(new_places))) {
    if (is.na(new_places$lat[i]) | is.na(new_places$long[i])) {
      cat(paste(new_places$place[i], "[FAILURE]", sep = " "), "\n")
    } else {
      cat(paste(new_places$place[i], "[SUCCESS]", sep = " "), "\n")
    }
  }
  
  ## Remove input rows and bind newly geocoded rows
  combined <<- combined %>% 
    filter(!is.na(lat) & !is.na(long)) %>%
    bind_rows(new_places)
  
  ## Write out the new combined.csv file
  message("File combined.csv successfully overwritten")
  write_csv(combined, "combined.csv")
  
}

## 2 -- Generate the map 

# Create color palette based on the unique continents
pal <- colorFactor(
  palette = c('forestgreen', #europe
              'navyblue', #latin america 
              'goldenrod4', #middle east & north africa 
              'firebrick2', #north america 
              'darkmagenta', #north & east asia 
              'deepskyblue3', #oceania
              'darkorange1'), #south and southeast asia
  domain = combined$region
)

# make the map
map <- combined %>%
  mutate(region = as.factor(region)) %>% 
  leaflet() %>%
  addCircleMarkers(lng = ~ long, 
                   lat = ~ lat, 
                   popup = ~paste("<b>", place, "</b><br>", 
                                  "Years visited: ", visited_year, 
                                  "<br><img src='", image_url, 
                                  "' width='150' height='auto'/>", sep = ""),
                   color = ~pal(region), 
                   stroke = F,
                   fillOpacity = 0.7,
                   radius = 4.5) %>%
  addLayersControl(
    baseGroups = c("CartoDB.Positron","Esri.WorldTopoMap", "OpenStreetMap"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  addProviderTiles("CartoDB.Positron", group = "CartoDB.Positron", 
                   options = providerTileOptions(minZoom = 1, maxZoom = 7)) %>%
  addProviderTiles("OpenStreetMap", group = "OpenStreetMap",
                   options = providerTileOptions(minZoom = 1, maxZoom = 7)) %>%
  addProviderTiles("Esri.WorldTopoMap", group = "Esri.WorldTopoMap",
                   options = providerTileOptions(minZoom = 1, maxZoom = 7)) %>%
  leaflet::fitBounds(lng1 = -90, lat1 = -80, lng2 = 90, lat2 = 80) %>% 
  leaflet.extras::addFullscreenControl() %>%
  leaflet.extras::addResetMapButton() %>%
  leaflet::setView(lat = 0, lng = 0, zoom = 1)

# display the map
map

# save/write map as widget ----------------------------------------------
map %>% saveWidget('places.html') # save as widget

# Git commands
system("git config --global user.email 'liam.k@columbia.edu'")

# Pull first
system("git pull")

# Commit message
commit_message <- "update places.html map"

# Add changes to the staging area
system("git add combined.csv")
system("git add places.html")

# Commit changes with the specified message
system2("git", c("commit", "-m", shQuote(commit_message)))

# Push changes to the remote repository
system("git push -u origin main")

