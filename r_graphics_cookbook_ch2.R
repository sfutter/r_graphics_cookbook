#built in data sets
str(mtcars)
str(pressure)

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

