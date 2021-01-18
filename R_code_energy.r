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


###### deforestation

setwd("C:/lab")
library(raster)
library(RStoolbox)

# brick function cause we are working on many layers
defor1 <- brick("defor1_.jpg")
defor1
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin") # 1=NIR; 2=red; 3=green

plotRGB(defor1, 2, 1, 3, stretch="Lin") # changing color

defor2 <- brick("defor2_.jpg")
defor2
plotRGB(defor2, 1, 2, 3, stretch="Lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, 1, 2, 3, stretch="Lin")

# dvi for the first period
dev.off()
dvi1 <- defor1$defor1_.1-defor1$defor1_.2
plot(dvi1)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)

# dvi2 after the cut
dvi2 <- defor2$defor2_.1-defor2$defor2_.2
plot(dvi2, col=cl)

# deforestation effect
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

#difference biomass before cut and after cut
dev.off()
difdvi <- dvi1 - dvi2
plot(difdvi)
cldif <- colorRampPalette(c('blue','white','red'))(100)
plot(difdvi, col=cldif)
plot(difdvi, col=cldif, main="amount of energy lost!")

# histogram function
hist(difdvi, col="red")

## final par
dev.off()
par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")
hist(difdvi, col="red", main="deforestation levels")
