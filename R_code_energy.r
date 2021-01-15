#R_code_energy.r

setwd("C:/lab")

# install.packages("rasterdiv")
library(rasterdiv)
library(raster)

data(copNDVI)
plot(copNDVI)

# We want to eliminate the blue part [using reclassify() function]
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

# Changing colors; yellow is the best to capture eye attenction
# install.packages("rasterVis")
library(rasterVis)

levelplot(copNDVI)

#clymin <- colorRampPalette(c('yellow', 'red', 'blue'))(100)
#plot(copNDVI, col=clymin)

#clymed <- colorRampPalette(c('red', 'yellow', 'blue'))(100)
#plot(copNDVI, col=clymed)

#clymax <- colorRampPalette(c('red', 'blue', 'yellow'))(100)
#plot(copNDVI, col=clymax)
# make it more clear
clymax <- colorRampPalette(c('blue', 'red', 'yellow'))(100)
plot(copNDVI, col=clymax)

# Comparation

par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red', 'yellow', 'blue'))(100)
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue', 'red', 'yellow'))(100)
plot(copNDVI, col=clymax)

# Zoom on a region
ext <- c(0,20,35,55)
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)
