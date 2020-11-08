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

# Questin!!!
# pairing only the elements part of the dataset: how to do that?
# only with cadmium, copper, lead, zinc...
