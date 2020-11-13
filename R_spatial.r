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
