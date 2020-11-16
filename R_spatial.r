# R spatial

library(sp)
data(meuse)
head(meuse)

# Find the spatial coordinates: explain to R that the coordinates are equal to x and y
coordinates(meuse) = ~x+y

plot(meuse)

# How the zinc is spread in space in our dataset [spplot()]
# spplot is used to plot elements (zinc, lead...) spread in space
spplot(meuse, "zinc")
spplot(meuse, "zinc", main="Concentration of zinc")

# Concentration of copper
spplot(meuse, "copper", main="Concentration of copper")

# Excercise: see copper and zinc [same legend/values]
spplot(meuse, c("zinc", "copper"), main="Concentration of zinc and copper")

# Rather than using colors, let's make use of bubbles [bubbles()]
bubble(meuse, "zinc")

# Do the same for lead
bubble(meuse, "lead")
bubble(meuse, "lead", col="red")


# Installing the ggplot2 library / package

install.packages("ggplot2")
library(ggplot2) # [if no warnings, everything is fine]

# ecological dataframe {biofuels - oxydative enzimes}
biofuels <- c(120, 200, 350, 570, 750) # array of values: c
oxydative <- c(1200, 1300, 21000, 34000, 50000)

# dataframe function 
d <- data.frame(biofuels, oxydative)
d

# Using ggplot function [ggplot(data, aes (x =, y =))] 
ggplot(d, aes (x = biofuels, y = oxydative))
# geom_point()   function
ggplot(d, aes (x = biofuels, y = oxydative)) + geom_point()
# change the color of the points [col=""]
ggplot(d, aes (x = biofuels, y = oxydative)) + geom_point(col="red")
# change the size of the points [cex= or size=]
ggplot(d, aes (x = biofuels, y = oxydative)) + geom_point(col="red", size=5)
# change the forms of the points [pch=]
ggplot(d, aes (x = biofuels, y = oxydative)) + geom_point(col="red", size=5, pch=10)

# Change the points in lines [geom_lines()]
ggplot(d, aes (x = biofuels, y = oxydative)) + geom_line()
# Points + Lines
ggplot(d, aes (x = biofuels, y = oxydative)) + geom_point(col="red", size=5, pch=10) + geom_line()

# Polygons [geom_polygons()]
ggplot(d, aes (x = biofuels, y = oxydative)) + geom_polygon()

########### IMPORT DATA FRON AN EXTERNAL SOURCE

# setwd("path/lab")

# setwd for Windows
# setwd("C:/..../lab/") C:\Users\giova\OneDrive\Desktop\lab\
setwd("C:/Users/giova/OneDrive/Desktop/lab/")
covid <- 

