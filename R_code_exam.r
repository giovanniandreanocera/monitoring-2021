# Recall the working directory
setwd("C:/exam_lab")

# We need a library capable to read nc files
# install.packages("ncdf4")
library(ncdf4)

# Recall the raster library to use the raster function
# install.packages("raster")
library(raster)

# Data collected from Copernicus: Leaf Area Index in the period between 1999-2019
# Two dataset for each year: s=summer(june-october), w=winter(november-march)

LAI_1999s <- raster("c_gls_LAI_199908100000_GLOBE_VGT_V2.0.2.nc")
LAI_1999w <- raster("c_gls_LAI_200001100000_GLOBE_VGT_V2.0.2.nc")

LAI_2003s <- raster("c_gls_LAI_200308100000_GLOBE_VGT_V2.0.1.nc")
LAI_2003w <- raster("c_gls_LAI_200401100000_GLOBE_VGT_V2.0.1.nc")

LAI_2007s <- raster("c_gls_LAI_200708100000_GLOBE_VGT_V2.0.1.nc")
LAI_2007w <- raster("c_gls_LAI_200801100000_GLOBE_VGT_V2.0.1.nc")

LAI_2011s <- raster("c_gls_LAI_201108100000_GLOBE_VGT_V2.0.1.nc")
LAI_2011w <- raster("c_gls_LAI_201201100000_GLOBE_VGT_V2.0.1.nc")

LAI_2015s <- raster("c_gls_LAI-RT6_201508100000_GLOBE_PROBAV_V2.0.2.nc")
LAI_2015w <- raster("c_gls_LAI-RT6_201601100000_GLOBE_PROBAV_V2.0.2.nc")

LAI_2019s <- raster("c_gls_LAI-RT6_201908100000_GLOBE_PROBAV_V2.0.1.nc")
LAI_2019w <- raster("c_gls_LAI-RT6_202001100000_GLOBE_PROBAV_V2.0.1.nc")

# Zoom in a restricted area: Sahel region, Africa
ext <- c(-20,50,5,20)

Afr_LAI_1999s <- crop(LAI_1999s, ext)
Afr_LAI_1999w <- crop(LAI_1999w, ext)

Afr_LAI_2003s <- crop(LAI_2003s, ext)
Afr_LAI_2003w <- crop(LAI_2003w, ext)

Afr_LAI_2007s <- crop(LAI_2007s, ext)
Afr_LAI_2007w <- crop(LAI_2007w, ext)

Afr_LAI_2011s <- crop(LAI_2011s, ext)
Afr_LAI_2011w <- crop(LAI_2011w, ext)

Afr_LAI_2015s <- crop(LAI_2015s, ext)
Afr_LAI_2015w <- crop(LAI_2015w, ext)

Afr_LAI_2019s <- crop(LAI_2019s, ext)
Afr_LAI_2019w <- crop(LAI_2019w, ext)

# Using the average function to have an avg of every year LAI in the region
Afr_LAI_1999 <- (Afr_LAI_1999s + Afr_LAI_1999w)/2
Afr_LAI_2003 <- (Afr_LAI_2003s + Afr_LAI_2003w)/2
Afr_LAI_2007 <- (Afr_LAI_2007s + Afr_LAI_2007w)/2
Afr_LAI_2011 <- (Afr_LAI_2011s + Afr_LAI_2011w)/2
Afr_LAI_2015 <- (Afr_LAI_2015s + Afr_LAI_2015w)/2
Afr_LAI_2019 <- (Afr_LAI_2019s + Afr_LAI_2019w)/2

# Better to use different colors: we want to enlight (yellow) the low-medium values 
cl <- colorRampPalette(c('slategray3', 'yellow', 'orange', 'red'))(100)

# Using the par function to visualize all the graph at the same time 
par(mfrow=c(3,2))
plot(Afr_LAI_1999, col=cl, main="avg LAI 1999")
plot(Afr_LAI_2003, col=cl, main="avg LAI 2003")
plot(Afr_LAI_2007, col=cl, main="avg LAI 2007")
plot(Afr_LAI_2011, col=cl, main="avg LAI 2011")
plot(Afr_LAI_2015, col=cl, main="avg LAI 2015")
plot(Afr_LAI_2019, col=cl, main="avg LAI 2019")

# Let’s confront the longest term variation, 20 year: 1999-2019
# clean
dev.off()

# Using the par function to visualize two graph one above the other
par(mfrow=c(2,1))
plot(Afr_LAI_1999, col=cl, main="avg LAI 1999")
plot(Afr_LAI_2019, col=cl, main="avg LAI 2019")

# Using minus ( - ) function to find out the differences
diff_20yr <- (Afr_LAI_2019 - Afr_LAI_1999)
plot(diff_20yr)

# Let’s change colors to evidentiate the differences: using red to represent the desertification (lower LAI values)
clmax <- colorRampPalette(c('red', 'white', 'blue'))(100)

plot(diff_20yr, col=clmax, main="Variation from 1999 to 2019")

# What would we see if confronting 2018 to 2019?
LAI_2018s <- raster("c_gls_LAI-RT6_201808100000_GLOBE_PROBAV_V2.0.1.nc")
LAI_2018w <- raster("c_gls_LAI-RT6_201812100000_GLOBE_PROBAV_V2.0.1.nc")
# Zoom
Afr_LAI_2018s <- crop(LAI_2018s, ext)
Afr_LAI_2018w <- crop(LAI_2018w, ext)
# Average
Afr_LAI_2018 <- (Afr_LAI_2018s + Afr_LAI_2018w)/2

# One above the other
par(mfrow=c(2,1))
plot(Afr_LAI_2018, col=cl, main="avg LAI 2018")
plot(Afr_LAI_2019, col=cl, main="avg LAI 2019")

# Differences between 2018 and 2019
diff_B <- (Afr_LAI_2019 - Afr_LAI_2018)
dev.off()
plot(diff_B, col=clmax, main="Variation from 2018 to 2019")

# Desertification of the Sahel region: it’s actually increasing?
par(mfrow=c(2,1))
plot(diff_20yr, col=clmax, main="Variation from 1999 to 2019")
plot(diff_B, col=clmax, main="Variation from 2018 to 2019")


# Albedo index is higher in desertic areas respect to plant-rich areas
# Is there an increase in the Albedo index in the area during this period?
# Data collected from Copernicus: Albedo in the years 1999-2019
ALB_1999s <- raster("c_gls_ALBH_199907240000_GLOBE_VGT_V1.4.1.nc")
ALB_1999w <- raster("c_gls_ALBH_200001130000_GLOBE_VGT_V1.4.1.nc")
ALB_2019s <- raster("c_gls_ALBH_201907240000_GLOBE_PROBAV_V1.5.1.nc")
ALB_2019w <- raster("c_gls_ALBH_202001130000_GLOBE_PROBAV_V1.5.1.nc")
# Zoom
Afr_ALB_1999s <- crop(ALB_1999s, ext)
Afr_ALB_1999w <- crop(ALB_1999w, ext)
Afr_ALB_2019s <- crop(ALB_2019s, ext)
Afr_ALB_2019w <- crop(ALB_2019w, ext)
# Average
Afr_ALB_1999 <- (Afr_ALB_1999s + Afr_ALB_1999w)/2
Afr_ALB_2019 <- (Afr_ALB_2019s + Afr_ALB_2019w)/2

# Changing colors
clALB <- colorRampPalette(c('black', 'yellow', 'white'))(100)

# Confronting the Albedo index in the years 1999 and 2019: one above the other
par(mfrow=c(2,1))
plot(Afr_ALB_1999, col=clALB, main="avg Albedo 1999")
plot(Afr_ALB_2019, col=clALB, main="avg Albedo 2019")

# Differences in Albedo index between 1999 and 2019
diff_ALB <- (Afr_ALB_2019s - Afr_ALB_1999s)

# Using clmax would enlight in red the lowest values: invert the colors
clmax2 <- colorRampPalette(c('blue', 'white', 'red'))(100)
#clean
dev.off()

plot(diff_ALB, col=clmax2, main="Albedo: variation from 1999 to 2019")

# Let’s put all together
par(mfrow=c(2,1))
plot(diff_20yr, col=clmax, main="LAI")
plot(diff_ALB, col=clmax2, main="Albedo")
title("Variation from 1999 to 2019", line = -1, outer = TRUE)
