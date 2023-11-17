load("./data/GPS collar data for Thom--2023-05-10.RData")

# pick one animal
b01 <- subset(df_for_tom, animalID == "B01")
with(b01, plot(longitude,latitude,asp=1, type="o"))

all_bisons_plot <- ggplot(df_for_tom, aes(x = longitude, y = latitude, col = animalID)) +
  geom_path(alpha = 0.5) +
  geom_point(alpha = 0.5) +
  coord_fixed()
all_bisons_plot

one_bison_plot <- ggplot(b01, aes(x = longitude, y = latitude, col = animalID)) +
  geom_path(alpha = 0.5) +
  geom_point(alpha = 0.5) +
  coord_fixed()
one_bison_plot

#pdf("bison_animation.pdf")
#for(i in 1:nrow(b01)){
#  with(b01, {
#    plot(longitude,latitude, asp=1, type="l", col="grey")
#    lines(longitude[1:i], latitude[1:i], col="blue", cex=0.5, lwd=2)
#    points(longitude[i], latitude[i], pch=21, cex=2, col="lightblue")
#    title(paste(animalID[1], datetime.MTN[i]))
#  })
#  box()
#}
#dev.off()

# with gganimate
library(gganimate)
library(gapminder)
library(gifski)
library(sf)

# get map shape
library(geojsonsf)
einp_map <- geojson_sf("https://github.com/Red-Sigma/proj-ki-geo/raw/main/resources/Elk_Island_National_Park.geojson")

p <- ggplot(df_for_tom, aes(longitude, latitude, colour = "black")) +
  geom_sf(data = einp_map, fill = "lightblue", color = "black") +  # Background map
  geom_point(alpha = 0.7, show.legend = FALSE) +
  #scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  # scale_x_log10() +
  # facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Time: {frame_time}', x = 'longitude', y = 'latitude') +
  transition_time(datetime.MTN) +
  ease_aes('linear')
animate(p, renderer = ffmpeg_renderer())

library()
pl <-
  ggplot(b01, aes(x = longitude, y = latitude, col = animalID)) +
  geom_path(alpha = 0.5) +
  geom_point(alpha = 0.5) +
  scale_size(range = c(2, 12)) +
  # animation settings
  labs(title = 'Time: {frame_time}', x = 'longitude', y = 'latitude') +
  transition_time(datetime.MTN) +
  ease_aes('linear')
animate(pl, renderer = ffmpeg_renderer())

library(mapdata) # also loads maps
# library(maptools) gibt es nicht mehr auf cran

library(ggplot2)
ggplot(b01, aes(x = b01$longitude, y = b01$latitude))  + geom_path(alpha = 0.5) + geom_point(alpha = 0.5) + coord_fixed()
