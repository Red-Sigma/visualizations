library(ggplot2)
library(gganimate)
#library(mapdata)
library(ggmap)
library(osmdata)

library(geojsonsf)
einp_map <- geojson_sf("https://github.com/Red-Sigma/proj-ki-geo/raw/main/resources/Elk_Island_National_Park.geojson")
plot(einp_map) 

#ggplot() +
#  geom_polygon(data = einp_map, aes( x = b01$longitude, y = b01$latitude), fill="#69b3a2", color="white") +
#  theme_void() +
#  coord_map()

map <- get_navermap(
  bbox = c(left = -113.4043, bottom = 53.4263, right = -112.3263, top = 53.8002),
)

osm_map <- osmdata("~/Downloads/map")
plot(osm_map)

library(sf)
library(ggmap)
#latrange <- range(moose.df$lat) + c(-.5,.5)
#longrange <- range(moose.df$lon) + c(-.5,.5)
test.map <- get_map(location = c(longrange[1], latrange[1], longrange[2], latrange[2]), maptype = "terrain", source="google")