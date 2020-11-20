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
