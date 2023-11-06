load("~/Informatik_Studium/projekt-geo-informatik/GPS collar data for Thom--2023-05-10.RData")

# pick one animal
b01 <- subset(df_for_tom, animalID == "B01")
with(b01, plot(longitude,latitude,asp=1, type="o"))

library(mapdata) # also loads maps
# library(maptools) gibt es nicht mehr auf cran

library(ggplot2)
ggplot(b01, aes(x = b01$longitude, y = b01$latitude))  + geom_path(alpha = 0.5) + geom_point(alpha = 0.5) + coord_fixed()
