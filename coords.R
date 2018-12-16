library(ggplot2)
library(ggmap)
library(RColorBrewer)

coords.data <- read.csv(file="./locations.csv")
# Germany bounds
map_bounds <- c(left = 5, bottom = 47, right = 16, top = 56)
coords.map <- get_stamenmap(map_bounds, zoom = 7, maptype = "toner-lite")
coords.map <- ggmap(coords.map, extent="device", legend="none")
# heat map layer: Polygons with fill color based on relative frequency of coordinates
coords.map <- coords.map + stat_density2d(data=coords.data, aes(x=Longitude, y=Latitude, fill=..level.., alpha=..level..), geom="polygon")
# fill the density contours
coords.map <- coords.map + scale_fill_gradientn(colours=rev(brewer.pal(7, "Spectral")))
# Add the coords,color red and define shape
# Shapes: http://sape.inf.usi.ch/quick-reference/ggplot2/shape
coords.map <- coords.map + geom_point(data=coords.data, aes(x=Longitude, y=Latitude), fill="red", shape=23, alpha=0.8)

coords.map <- coords.map + theme_bw()
ggsave(filename="./coords.png")

