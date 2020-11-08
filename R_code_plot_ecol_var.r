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
cadmium <-(11.7, 8.6, 6.5, 2.6, 2.8, 3.0)
zinc (<-1022, 1141, 640, 257, 269, 281)
plot(zinc, cadmium)
