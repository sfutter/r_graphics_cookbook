library(gcookbook)
simpledat
barplot(simpledat, beside=TRUE)

#transpose the matrix
t(simpledat)
barplot(t(simpledat), beside=TRUE)

# ggplot2 requires data in long format, as opposed to wide format used previously
# here is simpledat converted to long format
simpledat_long

# ggplot barchart
library(ggplot2)
ggplot(simpledat_long, aes(x=Aval, y=value, fill=Bval)) + 
  geom_bar(stat='identity', position='dodge')

# note how easy it is to change the x and y axis values in the above. 
# to build a line chart 
ggplot(simpledat_long, aes(x=Aval, y=value, colour=Bval, group=Bval)) + 
  geom_line()

# ggplot has a simple requirement -- data must be stored in data frames
# ex.
# make data frame with some sample data

dat <- data.frame(xval=1:4, yval=c(3,4,5,9), group=c("A","B","A","B"))
dat

# basic ggplot object looks like this:
ggplot(dat, aes(x=xval, y=yval)) + geom_point()

# if going to reuse some components can store above into a variable e.g. 
p <- ggplot(dat, aes(x=xval, y=yval))
p + geom_point()

# by putting the aesthetic setting into geom_point we can alter the specific 
# geom_point without affecting the p variable ggplot. e.g. 
p + geom_point(aes(colour=group))

# in comparison to the aes setting, can also set the value colour directly
p + geom_point(colour="blue")

# Modify scale 
p + geom_point() + scale_x_continuous(limits=c(0,8))

# can also modify the colour scale
p + geom_point() + 
  scale_colour_manual(values=c("orange","forestgreen"))