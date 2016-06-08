#most common way to read a file
data <- read.csv('/Users/stevenfutter/dropbox/kaggle/titanic/train.csv')
data
str(data)

#strings in data are treated as factors. Makes more sense to tream them as strings
#or characters in R terminology. 
data <- read.csv('/Users/stevenfutter/dropbox/kaggle/titanic/train.csv', stringsAsFactors=FALSE)
str(data)

#to convert to factor
data$Sex <- factor(data$Sex)
str(data)

#to download an excel file
install.packages('xlsx')
library(xlsx)

#load data from sheet 1
data <- read.xlsx('/Users/stevenfutter/downloads/all_alpha_16.xlsx', 1, stringsAsFactors=FALSE)

