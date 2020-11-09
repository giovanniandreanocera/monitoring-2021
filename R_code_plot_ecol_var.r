# R code for plotting the relationship among ecological variables

install.packages("sp")
library(sp)

# data is used to recall datasets
data(meuse)
meuse

# View is used to invoke a spreadsheet-style data viewer on a matrix-like R object
View(meuse)

# head is used to returns the first or last parts of a vector, matrix, table, data frame or function
head(meuse)

# Exercise: meaning of all of the variables?
summary(meuse)

# Excercise: plot zinc (y) against cadmium (x)
plot(zinc, cadmium)

# or using $
plot(meuse$cadmium, meuse$zinc)

# or using attach function (without using the c <-[function])
attach(meuse)
plot(cadmium, zinc)

# how to impress your supervisor! Scatterplot Matrices
pairs(meuse)

# Question!!!
# pairing only the elements part of the dataset: how to do that?
# only with cadmium, copper, lead, zinc...

# Lecture #2 on ecological variables
# cadmium copper lead zinc
# pairs with soil variables
# from column 3 to column 6
pairs(meuse[,3:6])

# Let's use the names of the columns:
# tilde Alt + 126: ~
pairs(~ cadmium + copper + lead + zinc, data=meuse)

# let's prettify the graph
# Excercise: just use cadmium, lead and zinc
pairs(~ cadmium + lead + zinc, data=meuse)

# Excercise: change the color [col=""]
pairs(~ cadmium + lead + zinc, data=meuse, col="green")

#Excercise: change the forms/symbols of the dataset; use a filled triangle [pch=]
pairs(~ cadmium + lead + zinc, data=meuse, col="green", pch=17)

# Excercise: increase the sizes of the triangles [cex=]
pairs(~ cadmium + lead + zinc, data=meuse, col="green", pch=17, cex=3)

# Excercise: write a name on top of the graph [main=""]
pairs(~ cadmium + lead + zinc, data=meuse, col="green", pch=17, cex=3, main="my second ecograph")




