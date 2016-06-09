#built in data sets
str(mtcars)
str(pressure)
str(BOD)

#and a data set on car fuel efficiency from 1984-2017
data <- read.csv('/Users/stevenfutter/dropbox/R/r_graphics_cookbook/vehicles.csv')
str(data)
library(ggplot2)
qplot(year, fuelCost08, data=data)

# Creating a Scatterplot
plot(mtcars$wt, mtcars$mpg)

#for more advanced graphics use the ggplot2 library:
library(ggplot2)
qplot(mtcars$wt, mtcars$mpg)

#if the two vectors are already in the same data frame, you can use following:
qplot(wt, mpg, data=mtcars)
#which is equivalent to:
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()


# Creating a Line Graph
plot(pressure$temperature, pressure$pressure, type='l')

#add points with points
plot(pressure$temperature, pressure$pressure, type='l')
points(pressure$temperature, pressure$pressure)

#to add additional line
lines(pressure$temperature, pressure$pressure/2, col='red')
points(pressure$temperature, pressure$pressure/2, col='red')

#with ggplot2 you can get similar results to using qplot() with geom='line'

library(ggplot2)
qplot(pressure$temperature, pressure$pressure, geom='line')

#if two vectors in same data frame use:
qplot(temperature, pressure, data=pressure, geom='line')
#equivalent to
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line()

#line and points together 
qplot(temperature, pressure, data=pressure, geom=c('line', 'point'))
#equivalent to
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point()

# Creating a Bar Graph
barplot(BOD$demand, names.arg=BOD$Time)

# To count the unique values in a vector:
# Here you see there are 11 cases of the value 4, 7 cases of 6, and 14 cases of 8.
table(mtcars$cyl)

#generate a table of counts
barplot(table(mtcars$cyl))

# comparing continuous x variable to a discrete factor variable
library(ggplot2)
qplot(BOD$Time, BOD$demand, geom='bar', stat='identity')
#as compared to discrete factor variable: notice no 6 x-value.
qplot(factor(BOD$Time), BOD$demand, geom='bar', stat='identity')

#Plots count on y-axis
#cyl is continous here
qplot(mtcars$cyl)
#Treat cyl as discrete
qplot(factor(mtcars$cyl))

#if Vector is a data frame:
qplot(Time, demand, data=BOD, geom='bar', stat='identity')
# which is equivalent to:
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat='identity')

# Bargraph of couts
qplot(factor(cyl), data=mtcars)
# equivalent to:
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar()

# Create a histogram
hist(mtcars$mpg)
#specify approx number of bins with breaks
hist(mtcars$mpg, breaks=10)

library(ggplot2)
qplot(mpg, data=mtcars, binwidth=4)
#equivalent to
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=4)

#Creating a Box Plot
str(ToothGrowth)
plot(ToothGrowth$supp, ToothGrowth$len)
# when x is a factor (as opposed to numeric vector), it will automatically create a box plot.

#when two vectors in same data frame
boxplot(len ~ supp, data = ToothGrowth)

#put interaction of two variables on x-axis
boxplot(len ~ supp + dose, data = ToothGrowth)

# with ggplot2 package, you get similar results with qplot()
library(ggplot2)
qplot(ToothGrowth$supp, ToothGrowth$len, geom='boxplot')

# if the two vectors are in the same data frame
qplot(supp, len, data=ToothGrowth, geom='boxplot')
# equivalent to
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()


# Plotting a Function Curve
curve(x^3 - 5*x, from=-4, to=4)

#plot a User-defined function
myfun <- function(xvar) {
  1/(1+exp(-xvar + 10))
}
curve(myfun(x), from=0, to=20)
# add a line
curve(1-myfun(x), add=TRUE, col='red')

library(ggplot2)
qplot(c(0,20), fun=myfun, stat='function', geom='line')
# this is equivalent to
ggplot(data.frame(x=c(0,20)), aes(x=x)) + stat_function(fun=myfun, geom='line') 