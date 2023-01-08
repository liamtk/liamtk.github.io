library(tidyverse)
library(leaflet)
library(htmlwidgets)
library(tidygeocoder)


# Australia & NZ ----------------------------------------------------------

anz <-
  data.frame("place" = c(
    "Sydney, NSW",
    "Perth, WA",
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

noa <-
  data.frame("place" = c(
    "Beijing",
    "Shanghai",
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
    "Hong Kong",
    "Macau",
    "Urumqi, Xinjiang",
    "Guilin, Guangxi",
    "Fenghuang, Hunan",
    "Zhangjiajie, Hunan",
    "Dali, Yunnan",
    "Lijiang, Yunnan",
    "Shangri-La, Yunnan",
    "Chongqing",
    "Chengdu, Sichuan",
    "Leshan, Sichuan",
    "Hohhot, Inner Mongolia",
    "Harbin, Heilongjiang",
    "Jiamusi, Heilongjiang",
    "Changbaishan, Jilin",
    "Nanjing, Jiangsu",
    "Suzhou, Jiangsu",
    "Tokyo",
    "Yokohama, Japan",
    "Sapporo, Japan",
    "Osaka, Japan",
    "Kyoto, Japan",
    "Seoul",
    "Jeju, South Korea"
  )) %>% 
  mutate(region = "noa") %>%
  geocode(address = place, method = "osm")


# Southeast Asia ----------------------------------------------------------

sea <-
  data.frame("place" = c(
    "Singapore",
    "Johor Bahru, Malaysia",
    "Muar, Malaysia",
    "Ipoh, Malaysia",
    "Penang, Malaysia",
    "Jakarta",
    "Bali, Indonesia",
    "Kuala Lumpur",
    "Cameron Highlands, Malaysia",
    "Malacca, Malaysia",
    "Kota Kinabalu, Malaysia",
    "Bangkok",
    "Chiang Mai, Thailand",
    "Siem Reap, Cambodia",
    "Phnom Penh",
    "Saigon, Vietnam",
    "Hue, Vietnam",
    "Da Nang, Vietnam",
    "Hanoi",
    "Luang Prabang, Laos",
    "Yangon, Myanmar",
    "Bagan, Mandalay",
    "Naypyidaw",
    "Mawlamyine, Mon State",
    "Bago, Bago Region"
  )) %>% 
  mutate(region = "sea") %>%
  geocode(address = place, method = "osm")


# Middle East & North Africa ----------------------------------------------

mena <-   data.frame("place" = c(
  "Haifa, Israel",
  "Ramallah, Palestine",
  "Hebron, Palestine",
  "Jerusalem, Palestine",
  "Jericho, Palestine",
  "Acre, Israel"
)) %>% 
  mutate(region = "mena") %>%
  geocode(address = place, method = "osm")


# South America -----------------------------------------------------------

sam <-   data.frame("place" = c(
 "Islas Ballestas, Peru",
 "Lima",
 "Huacachina, Ica, Peru",
 "Cusco, Peru",
 "Machu Picchu, Peru",
 "Bogota, Colombia",
 "Zipaquira, Colombia"
)) %>% 
  mutate(region = "sam") %>%
  geocode(address = place, method = "osm")

# North America -----------------------------------------------------------

nam <- data.frame("place" = c(
  "New York City",
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

eur <- data.frame("place" = c(
  "Paris",
  "Barcelona, Catalunya",
  "Madrid",
  "Berlin, Germany",
  "Seville, Spain",
  "Lisbon",
  "Sintra, Portugal",
  "Porto, Portugal",
  "Bourg-Saint-Maurice, France",
  "Cork, Ireland",
  "Limerick, Ireland",
  "Galway, Ireland",
  "Aarhus, Denmark",
  "Copenhagen",
  "Prague",
  "Milan, Italy",
  "Catania, Italy",
  "Palermo, Italy",
  "Syracuse, Italy",
  "Agrigento, Italy",
  "Ragusa, Italy",
  "Taormina, Italy",
  "Rome",
  "Naples, Italy",
  "Florence, Italy",
  "Venice, Italy",
  "Pisa, Italy",
  "Lugano, Switzerland",
  "Vienna",
  "Salzburg, Austria",
  "Melk, Austria",
  "Bratislava, Slovakia",
  "Budapest, Hungary",
  "Hallstatt, Austria",
  "Cesky Krumlov, Czechia",
  "Amsterdam, Netherlands",
  "London",
  "Oxford, U.K.",
  "Cambridge, U.K.",
  "Bath, U.K.",
  "Bilbao, Basque Country",
  "Cordoba, Spain",
  "Donostia, Basque Country"
)) %>% 
  mutate(region = "eur") %>%
  geocode(address = place, method = "osm")


# Build data, palette & map -----------------------------------------------

combined <- rbind(nam, sam, eur, anz, mena, noa, sea) %>% 
  mutate(region=as.factor(region))

pal <- colorFactor(
  palette = c('blue', 'darkorange1', 'black', 'turquoise4', 'red', 'darkorchid4', 'limegreen'),
  domain = combined$region
)

map <- combined %>% leaflet() %>% # create leaflet map widget
  addProviderTiles(providers$CartoDB.Positron) %>% # add muted palette basemap
  addCircles(lng = ~ long, lat = ~ lat, popup = ~place, color = ~pal(region)) # add markers with popup text

# Save/write map as widget ----------------------------------------------

setwd(dirname(rstudioapi::getActiveDocumentContext()[["path"]]))

map %>% saveWidget('places_been.html') # save as widget

