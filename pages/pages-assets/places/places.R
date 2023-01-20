library(tidyverse)
library(leaflet)
library(htmlwidgets)
library(tidygeocoder)


# Australia & NZ ----------------------------------------------------------

region_aus_nz <-
  data.frame("place" = c(
    "Sydney, NSW",
    "Perth, WA",
    "Exmouth, WA",
    "Gold Coast, QLD",
    "Melbourne, VIC",
    "Mount Buller, VIC",
    "Brisbane, QLD",
    "Canberra, ACT",
    "Port Douglas, QLD",
    "Cairns, QLD",
    "Hobart, TAS",
    "Adelaide, SA",
    "Darwin, NT",
    "Broome, WA",
    "Kununurra, WA",
    "Carnarvon, WA",
    "Boddington, WA",
    "Boyup Brook, WA",
    "Bunbury, WA",
    "Port Headland, WA",
    "Albany, WA",
    "Margaret River, WA",
    "Kalbarri, WA",
    "Dalwallinu, WA",
    "Three Springs, WA",
    "Geraldton, WA",
    "Whitsundays, QLD",
    "Christchurch, NZ",
    "Akaroa, NZ",
    "Lake Pukaki, NZ",
    "Queenstown, NZ",
    "Suva, Fiji",
    "Nadi, Fiji")) %>% 
  mutate(region = "anz") %>%
  geocode(address = place, method = "osm")


# North Asia -----------------------------------------------------------

region_north_asia <-
  data.frame("place" = c(
    "Beijing, China",
    "Shanghai, China",
    "Hangzhou, Zhejiang",
    "Guangzhou, Guangdong",
    "Qiandaohu, Zhejiang",
    "Huangshan, Anhui",
    "Xi'an, Shaanxi",
    "Ordos, Inner Mongolia",
    "Hongcun, Anhui",
    "Taipei, Taiwan",
    "Yehliu, Taiwan",
    "Sanya, Hainan",
    "Fuzhou, Fujian",
    "Ningde, Fujian",
    "Xiamen, Fujian",
    "Hong Kong SAR",
    "Macau SAR",
    "Urumqi, Xinjiang",
    "Guilin, Guangxi",
    "Fenghuang, Hunan",
    "Zhangjiajie, Hunan",
    "Dali, Yunnan",
    "Lijiang, Yunnan",
    "Shangri-La, Yunnan",
    "Chongqing, China",
    "Chengdu, Sichuan",
    "Leshan, Sichuan",
    "Hohhot, Inner Mongolia",
    "Harbin, Heilongjiang",
    "Jiamusi, Heilongjiang",
    "Changbaishan, Jilin",
    "Nanjing, Jiangsu",
    "Suzhou, Jiangsu",
    "Tokyo, Japan",
    "Yokohama, Japan",
    "Sapporo, Japan",
    "Osaka, Japan",
    "Kyoto, Japan",
    "Seoul, South Korea",
    "Jeju, South Korea"
  )) %>% 
  mutate(region = "noa") %>%
  geocode(address = place, method = "osm")


# Southeast Asia ----------------------------------------------------------

region_southeast_asia <-
  data.frame("place" = c(
    "Singapore, Singapore",
    "Johor Bahru, Malaysia",
    "Muar, Malaysia",
    "Ipoh, Malaysia",
    "Penang, Malaysia",
    "Jakarta, Indonesia",
    "Bali, Indonesia",
    "Kuala Lumpur",
    "Cameron Highlands, Malaysia",
    "Malacca, Malaysia",
    "Kota Kinabalu, Malaysia",
    "Bangkok, Thailand",
    "Chiang Mai, Thailand",
    "Siem Reap, Cambodia",
    "Phnom Penh, Cambodia",
    "Saigon, Vietnam",
    "Hue, Vietnam",
    "Da Nang, Vietnam",
    "Hanoi, Vietnam",
    "Luang Prabang, Laos",
    "Yangon, Myanmar",
    "Bagan, Myanmar",
    "Naypyidaw, Myanmar",
    "Mawlamyine, Myanmar",
    "Bago, Myanmar"
  )) %>% 
  mutate(region = "sea") %>%
  geocode(address = place, method = "osm")


# Middle East & North Africa ----------------------------------------------

region_mena <-   data.frame("place" = c(
  "Haifa, Israel",
  "Ramallah, Palestine",
  "Hebron, Palestine",
  "Jerusalem",
  "Jericho, Palestine",
  "Acre, Israel"
)) %>% 
  mutate(region = "mena") %>%
  geocode(address = place, method = "osm")


# South America -----------------------------------------------------------

region_south_america <-   data.frame("place" = c(
 "Islas Ballestas, Peru",
 "Lima, Peru",
 "Huacachina, Ica, Peru",
 "Cusco, Peru",
 "Machu Picchu, Peru",
 "Bogota, Colombia",
 "Zipaquira, Colombia"
)) %>% 
  mutate(region = "sam") %>%
  geocode(address = place, method = "osm")

# North America -----------------------------------------------------------

region_north_america <- data.frame("place" = c(
  "New York City, NY",
  "Greenwood Lake, NY",
  "Beacon, NY",
  "New Orleans, LA",
  "Las Vegas, NV",
  "San Francisco, CA",
  "Page, AZ",
  "Tusayan, AZ",
  "Grand Canyon North Rim",
  "Durham, NC",
  "Cold Spring, NY",
  "Boston, MA",
  "Philadelphia, PA",
  "Portland, Maine",
  "Scranton, PA",
  "Lancaster, PA",
  "Hoboken, NJ",
  "Baltimore, MD",
  "New Haven, CT",
  "Wilmington, DE",
  "Toronto, Canada",
  "Vancouver, Canada",
  "Washington, D.C.",
  "Oaxaca, Mexico",
  "Merida, Mexico",
  "Tulum, Mexico",
  "Valladolid, Mexico",
  "Cancun, Mexico",
  "Playa Del Carmen, Mexico",
  "Ciudad De Mexico, Mexico",
  "Uxmal, Mexico"
)) %>% 
  mutate(region = "nam") %>%
  geocode(address = place, method = "osm")


# Europe ------------------------------------------------------------------

region_europe <- data.frame("place" = c(
  "Paris, France",
  "Barcelona, Catalunya",
  "Madrid, Spain",
  "Berlin, Germany",
  "Seville, Spain",
  "Lisbon, Portugal",
  "Sintra, Portugal",
  "Porto, Portugal",
  "Bourg-Saint-Maurice, France",
  "Cork, Ireland",
  "Limerick, Ireland",
  "Galway, Ireland",
  "Aarhus, Denmark",
  "Copenhagen, Denmark",
  "Prague, Czechia",
  "Milan, Italy",
  "Catania, Italy",
  "Palermo, Italy",
  "Syracuse, Italy",
  "Agrigento, Italy",
  "Ragusa, Italy",
  "Taormina, Italy",
  "Rome, Italy",
  "Naples, Italy",
  "Florence, Italy",
  "Venice, Italy",
  "Pisa, Italy",
  "Lugano, Switzerland",
  "Vienna, Austria",
  "Salzburg, Austria",
  "Melk, Austria",
  "Bratislava, Slovakia",
  "Budapest, Hungary",
  "Hallstatt, Austria",
  "Cesky Krumlov, Czechia",
  "Amsterdam, Netherlands",
  "London, UK",
  "Oxford, UK",
  "Cambridge, UK",
  "Bath, UK",
  "Bilbao, Basque Country",
  "Cordoba, Spain",
  "Donostia, Basque Country"
)) %>% 
  mutate(region = "eur") %>%
  geocode(address = place, method = "osm")


# Build data, palette & map -----------------------------------------------

combined <- bind_rows(mget(ls(pattern = "region_")))

saveRDS(combined, file = "../../../files/combined_places.rds")


### START HERE TO ADD NEW PLACES

library(tidyverse)
library(leaflet)
library(tmap)
library(htmlwidgets)
library(tidygeocoder)

combined <- readRDS("../../../files/combined_places.rds")

add_location <- function(df, location_name, region_code){
  
  #' @param get_landing_urls a valid region code 
  #' valid codes: anz  eur  mena nam  noa  sam  sea soa
  
  if(region_code %in% c("anz", "eur","mena", "nam", "noa", "sam", "sea", "soa")){
    
    new <- data.frame(place = location_name, region = region_code) %>%
      geocode(address = place, method = "osm")
    
    return(unique(rbind(df, new)))
    
  }
  
  else{
    print("Invalid region_code.")
  }

}

# combined <- add_location(combined, "New Delhi, India", "soa")

pal <- colorFactor(
  palette = c('blue', 'darkorange1', 'black', 'turquoise4', 'red', 'darkorchid4', 'darkgreen'),
  domain = combined$region
)

map <- combined %>%
  mutate(region = as.factor(region)) %>% 
  leaflet() %>% # create leaflet map widget
  addProviderTiles(providers$CartoDB.Positron) %>% # add muted palette basemap
  addCircles(lng = ~ long, lat = ~ lat, popup = ~place, color = ~pal(region)) # add markers with popup text

map <- combined %>%
  mutate(region = as.factor(region)) %>% 
  leaflet() %>%
  addCircles(lng = ~ long, lat = ~ lat, popup = ~place, color = ~pal(region))

# add basemap layer groups
map <- map %>% addLayersControl(
  baseGroups = c("CartoDB.Positron", "OpenStreetMap", "Esri.WorldTopoMap"),
  options = layersControlOptions(collapsed = FALSE)
) %>%
  addProviderTiles("Esri.WorldGrayCanvas", group = "Esri.WorldGrayCanvas") %>%
  addProviderTiles("OpenStreetMap", group = "OpenStreetMap") %>%
  addProviderTiles("Esri.WorldTopoMap", group = "Esri.WorldTopoMap") %>%
  leaflet::fitBounds(lng1 = -90, lat1 = -90, lng2 = 90, lat2 = 90) %>% 
  leaflet.extras::addFullscreenControl() %>%
  leaflet.extras::addResetMapButton() %>%
  leaflet::setView(lat = 0, lng = 0, zoom = 1.3)


map

# Save/write map as widget ----------------------------------------------

setwd(dirname(rstudioapi::getActiveDocumentContext()[["path"]]))

map %>% saveWidget('places.html') # save as widget

