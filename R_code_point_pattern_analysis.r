# Point pattern analysis

install.packages("spatstat")
library(spatstat)

# Use covid dataset
setwd("C:/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
covid
head(covid)

# Now, let's see the density of covid daa
# let's make a planar point pattern in spatstat
attach(covid)
# x, y, ranges
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

density_map <- density(covid_planar)

plot(density_map)
points(covid_planar)

cl <- colorRampPalette(c('yellow','orange','red'))(100)
plot(density_map, col = cl)
points(covid_planar)

# Excercise: change the colors of the map
cl <- colorRampPalette(c('green','blue','magenta','yellow'))(100)
plot(density_map, col = cl)
points(covid_planar)

# Putting the countries 
install.packages("rgdal")

library(rgdal)

# Recall coastline data in the (C:/lab/) folder
coastline <- readOGR("ne_10m_coastline.shp")

# cl <- colorRampPalette(c('green','blue','magenta','yellow'))(100)
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastline, add = TRUE) # add = TRUE is used to join the two set

# Export maps png
png("figure1.png")
cl <- colorRampPalette(c('green','blue','magenta','yellow'))(100)
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastline, add = TRUE)
devoff()

# pdf
pdf("figure1.pdf")
cl <- colorRampPalette(c('green','blue','magenta','yellow'))(100)
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastline, add = TRUE)
devoff()



##########
head(covid)


########## Interpolate case data
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)
    
plot(cases_map, col = cl)
points(covid_planar)
plot(coastline, add = TRUE)


###### Plotting points with different size related to covid data together with the interpolated map
# lab

setwd("C:/lab/")

library(spatstat)
library(rgdal)

covid <- read.table("covid_agg.csv", header=TRUE)
head(covid)

attach(covid)
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)

# 0:25:01 del 27 Nov 






################################################################
install.packages("sf")
library(sf)

Spoints <- st_as_sf(covid, coords = c("lon", "lat"))

cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col = cl)
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd = 3, add=T)

library(rgdal)
# put a smoother to the coastlines by resampling
coastline <- readOGR("ne_10m_coastline.shp")
plot(coastline, add=T)

