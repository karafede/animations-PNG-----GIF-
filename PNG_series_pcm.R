
library(webshot)
library(leaflet)
library(htmlwidgets)
library(ggmap)
library(RColorBrewer)
library(raster)

setwd("C:/RICARDO-AEA/animations_R/pcm_PM10")
# Load data
mappm102001 <- raster::raster("pm102001.tif")
mappm102002 <- raster::raster("pm102002.tif")
mappm102003 <- raster::raster("pm102003s15a.tif")
mappm102004 <- raster::raster("pm102004g.tif")
mappm102005 <- raster::raster(("pm1005ac.tif"))
mappm102006 <- raster::raster("pm102006gh.tif")
mappm102007 <- raster::raster("pm102007g.tif")
mappm102008 <- raster::raster ("pm102008g.tif")
mappm102009 <- raster::raster("pm102009g.tif")
mappm102010 <- raster::raster ("pm102010g.tif")
mappm102011 <- raster::raster("pm102011g.tif")
mappm102012 <- raster::raster("pm102012g.tif")
mappm102013 <- raster::raster("pm102013g.tif")
mappm102014 <- raster::raster("pm102014g.tif")


for (i in seq(14)) {
  pal_PM10 <- colorNumeric(c("#9999ff", "#ffffcc", "#ff0000"), 
                           getValues(get(as.vector(sprintf('mappm1020%02d', i)))),
                                     na.color = "transparent")


map <- leaflet() %>% 
  addTiles() %>% 
  setView(-2, 53.5, 6) %>%
  addRasterImage(get(as.vector(sprintf('mappm1020%02d', i))), 
                 colors = pal_PM10, 
                 opacity = 0.6) %>%
  addLegend("bottomright", pal = pal_PM10, values = getValues(get(as.vector(sprintf('mappm1020%02d', i)))),
            title = "<br><strong>PM<sub>10</sub> (<font face=symbol>m</font>g/m<sup>3</sup>): </strong>",
            labFormat = labelFormat(prefix = ""),
            opacity = 0.6)

map



## This is the png creation part
saveWidget(map, 'pcm_PM10.html', selfcontained = FALSE)
webshot('pcm_PM10.html', file=sprintf('pm1020%02d.png', i),
        cliprect = 'viewport')

}

# to use with ImageMagik

# convert Rplot%02d.png[1-5] -duplicate 1,-2-1, -resize "%50" gif:- | convert - -set delay "%[fx:(t==0||t==4)?240:40]" -quiet -layers OptimizePlus -loop 0 cycle.gif
# convert -delay 120 -loop 0 *.png animated.gif
###############################################################################
###############################################################################
###############################################################################
