
library(raster)
library(animation)
library(installr)
library(threadr)

# setwd("C:/RICARDO-AEA/pcm_1km_mapping/data_pcm_PM10_output")
setwd("C:/RICARDO-AEA/animations_R/pcm_PM10")

filenames <- list.files(pattern = "\\.png$")
filenames_pure <- str_sub(filenames, start = 1, end = -5)

ani.options("convert")
ani.options(interval=.05)

## filenames with a wildcard *
im.convert(filenames, output = "animation.gif", convert = "convert")

