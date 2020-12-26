# R_code_multivar.r

setwd("C:/lab")

install.packages("vegan")
library(vegan)

load("biomes_multivar.RData")

ls()

head(biomes)

# DEtrended CORrespodecy ANAlysis

multivar <- decorana(biomes)
multivar

plot(multivar)

# biomes types
biomes_types
head(biomes_types)

# biomes name in the graph:
attach(biomes_types)
ordiellipse(multivar, type, col=c("black", "red", "green", "blue"), kind = "ehull", lwd=3)

# or col=1:4
ordispider(multivar, type, col=c("black", "red", "green", "blue"), label = T)

# export image
pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black", "red", "green", "blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black", "red", "green", "blue"), label = T)
dev.off()
