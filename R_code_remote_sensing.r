# R code for remote sensing data analysis to monitor ecosystem changes in space and time

install.packages(c("raster", "RStoolbox"))

library(raster)
library(RSyoolbox)

setwd("C:/lab")

p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011

plot(p224r63_2011)

# change color to all bands

cl <- colorRampPalette(c('black', 'grey', 'light grey'))(100)
plot(p224r63_2011, col=cl)

par(mfrow=c(2,2))

# change color to the first band (BLUE)
clb <- colorRampPalette(c('dark blue', 'blue', 'light blue'))(100)

plot(p224r63_2011$B1_sre, col=clb)

# change color to the second band (green)
clg <- colorRampPalette(c('dark green', 'green', 'light green')) (100)

plot(p224r63_2011$B2_sre, col=clg)

# change color to the third band (red)
clr <- colorRampPalette(c('dark red', 'red', 'pink')) (100)

plot(p224r63_2011$B3_sre, col=clr)

# change color to the fourth band (NIR)
clNRI <- colorRampPalette(c('red', 'orange', 'yellow') (100)
#
plot(p224r63_2011$B4_sre, col=clNRI)
                          
