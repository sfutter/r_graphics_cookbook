#most common way to read a file
data <- read.csv('/Users/stevenfutter/dropbox/kaggle/titanic/train.csv')
data
str(data)

#create a scatterplot
plot(mtcars$wt, mtcars$mpg)

#for more advanced graphics use the ggplot2 library:
library(ggplot2)
qplot(mtcars$wt, mtcars$mpg)

#if the two vectors are already in the same data frame, you can use following:
qplot(wt, mpg, data=mtcars)
#which is equivalent to:
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()



