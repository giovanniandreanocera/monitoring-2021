# Species Distribution Modelling

setwd("C:/lab")

# install.packages("sdm")
# install.packages("rgdal", dependencies=T)

library(sdm)
library(raster) # predictors
library(rgdal) # species

file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file)

# looking at the set
species

# plot
plot(species)
# change the point symbol
plot(species, pch=17)

# looking at the occurrences
species$Occurrence

# plotting species relating to occurrence [SQL language]:
plot(species[species$Occurrence == 1,],col='blue',pch=17)
# adding points to the previews plot:
points(species[species$Occurrence == 0,],col='red',pch=17)

# predictors: look at the path
path <- system.file("external", package="sdm") 

# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

# stack all the predictors
preds <- stack(lst)

# plot preds
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

# plot predictors and occurrences
plot(preds$elevation, col=cl, main="elevation")
points(species[species$Occurrence == 1,], pch=17)

plot(preds$temperature, col=cl, main='temperature')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$precipitation, col=cl, main='precipitation')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$vegetation, col=cl, main='vegetation')
points(species[species$Occurrence == 1,], pch=17)

# model

# set the data for the sdm
datasdm <- sdmData(train=species, predictors=preds)
datasdm

# model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

# make the raster output layer
p1 <- predict(m1, newdata=preds) 

# plot the output
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=17)

# add to the stack
s1 <- stack(preds,p1)
plot(s1, col=cl)
