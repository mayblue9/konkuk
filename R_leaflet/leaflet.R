##install.packages("leaflet")
library(leaflet)

## load topojson
topoData <- readLines("seoul.json") %>% paste(collapse = "\n")

## Basic tile
map <- leaflet() %>% addTiles() %>% 
  addMarkers(lng=127.063866, lat=37.506387, popup="google campus")

## CartoDB DarkMatter tile
map <- leaflet() %>% addProviderTiles("CartoDB.DarkMatter") %>% 
  addMarkers(lng=127.063866, lat=37.506387, popup="google campus")

## CartoDB Positron tile & topojson layer add
map <- leaflet() %>% addProviderTiles("CartoDB.Positron") %>% 
  addMarkers(lng=127.063866, lat=37.506387, popup="google campus") %>% addTopoJSON(topoData, weight = 1, color = "#444444", fill = FALSE)

## View map
map
