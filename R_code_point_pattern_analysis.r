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


############ Code of norma
# install.packages("sf")
library(sf)

cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
density_map <- density(covid_planar)
plot(density_map)
plot(cases_map, col = cl)

Spoints <- st_as_sf(covid, coords = c("lon", "lat"))
plot(Spoints, cex=Spoints$cases, col = 'purple3', lwd = 3, add=T) #Spoints are too big: divide for 10000

cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col = cl)
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd = 3, add=T)

# put a smoother to the coastlines by resampling
coastline <- readOGR("ne_10m_coastline.shp")
plot(coastline, add=T)


https://www.youtube.com/watch?v=Q6RrzJ7u_UU




#################### Leo Zabotti data
setwd("C:/lab/")
leo <- read.table("dati_zabotti.csv", header=T, sep=",")
head(leo)
attach(leo)
library(spatstat)
summary(leo)
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))
plot(leo_ppp)
density_map <- density(leo_ppp)
plot(density_map)
points(leo_ppp)




####### Save r works



########## Interpolation of students' data

setwd("C:/lab/")

load("point_pattern_analysis.RData")
ls() # list of file inside data

head(leo)

library(spatstat)
attach (leo)
marks(leo_ppp) <- chlh

chlh_map <- Smooth(leo_ppp)
plot(chlh_map)
points(leo_ppp)

# change the color with cl <- colorRampPalette(c('col','col','col'))(100)
cl <- colorRampPalette(c('yellow','orange','red', 'green'))(100)
plot(chlh_map, col=cl)
points(leo_ppp)











