# R code for exam simulation

# We need a library capable to read nc files
install.packages("ncdf4")
library(ncdf4)

# Recall the workong directory
setwd("C:/lab")


# Recall the raster library to use the raster function
library(raster)

# Use of raster function fot land surface temperature of january
tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
plot(tjan)

# Change color to tjan graph
cltjan <- colorRampPalette(c('orange', 'red', 'dark red'))(100)
plot(tjan, col=cltjan)

# Doing the same for LST of october
toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
cltoct <- colorRampPalette(c('orange', 'red', 'dark red'))(100)
plot(toct, col=cltoct)

dift <- tjan - toct
cldift <- colorRampPalette(c('blue', 'white', 'red'))(100)
plot(dift, col=cldift)
