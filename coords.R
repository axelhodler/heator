library(ggplot2)
library(ggmap)
library(RColorBrewer)

coords.data <- read.csv(file="./coords.csv")
map_bounds <- c(left = -170, bottom = -80, right = 170, top = 80)
coords.map <- get_stamenmap(map_bounds, zoom = 1, maptype = "toner-lite")
coords.map <- ggmap(coords.map, extent="device", legend="none")
## heat map layer: Polygons with fill color based on relative frequency of events
coords.map <- coords.map + stat_density2d(data=coords.data, aes(x=Longitude, y=Latitude, fill=..level.., alpha=..level..), geom="polygon")
## fill the density contours
coords.map <- coords.map + scale_fill_gradientn(colours=rev(brewer.pal(7, "Spectral")))
## Add the coords , color them red and define round shape
coords.map <- coords.map + geom_point(data=coords.data, aes(x=Longitude, y=Latitude), fill="red", shape=21, alpha=0.8)
## Remove any legend
coords.map <- coords.map + guides(size=FALSE, alpha = FALSE)
coords.map <- coords.map + ggtitle("A map")

coords.map <- coords.map + theme_bw()
print(coords.map)
ggsave(filename="./coords.png")

