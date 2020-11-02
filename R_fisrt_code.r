# write whatever you want

# this is an array
primates <- c(3, 5, 9, 15, 40)
primates

# new set:
crabs <- c(100, 70, 30, 10, 5)

# first plot in R
plot(primates, crabs)

plot(primates, crabs, col="red")

plot(primates, crabs, col="red", pch=8)

plot(primates, crabs, col="red", pch=8, cex=2)

plot(primates, crabs, col="red", pch=8, cex=6)

plot(primates, crabs, col="red", pch=8, cex=6, main="my first eco graph")

# create a dataframe
ecoset <- data.frame(primates, crabs)

# ecological numbers
# mean number of individuals for site
(3+5+9+15+40)/5

# summary of the dataframe
summary(ecoset)
