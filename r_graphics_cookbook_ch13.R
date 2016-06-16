# Creating correlation plots using the mtcars data set.
mtcars

# Generate correlation coefficients for each pair of columns.
mcor <- cor(mtcars)
# Print mcor and round to 2 digits
round(mcor, digits=2)

# Correlation matrix: use the corrplot package
library(corrplot)
corrplot(mcor)

# To create corrplot with squares instead of circles and rotated axis 45 degrees
corrplot(mcor, method='shade', shade.col=NA, tl.col='black', tl.srt=45)

# Remove colour legend and include numbers in the squares of correlation matrix
# Make colour palette a little lighter
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(mcor, method='shade', shade.col=NA, tl.col='black', tl.srt=45,
         col=col(200), addCoef.col='black', addcolorlabel='no', order='AOE')


# Creating a Network Graph
library(igraph)

# Specify edges for a directed graph
# To create a graph, pass a vector containing pairs of items to graph(), then
# plot the resulting object
# For the directed graph you will see in the case below that an arrow is directed
# from 1 to 2, then 2 to 2 loops back on itself, then 2 point to 3 and so on...
gd <- graph(c(1,2, 2,2, 2,3, 4,5, 6,5, 4,3, 3,4, 3,3, 6,1))
plot(gd)

# An undirected graph
gu <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6), directed=FALSE)
plot(gu, vertex.label=NA)

str(gd)
str(gu)

# Use set.seed(#) to change the output -- otherwise it is randomly set.
set.seed(1)
plot(gd)

# It is possible to create a network graph from a data frame. The first two columns
# of the data frame are used, and each row specifies a connection between two nodes.
library(gcookbook)
madmen2

# Create a graph object from the data set
g <- graph.data.frame(madmen2, directed=TRUE)

# Remove unnecessary margins
par(mar=c(0,0,0,0))

plot(g, layout=layout.fruchterman.reingold, vertex.size=8, edge.arrow.size=0.5,
#plot(g, layout=layout.kamada.kawai, vertex.size=8, edge.arrow.size=0.5)
     vertex.label=NA)

# This time use a circle layout
g <- graph.data.frame(madmen, directed=FALSE)
par(mar=c(0,0,0,0)) 
plot(g, layout=layout.circle, vertex.size=8)
vertex.label=NA)



# To set the labels, pass in a vector of names to vertex.label
library(igraph)
library(gcookbook)

# calculate the number of rows or columns of a data frame
ncol(madmen)
nrow(madmen)

# print out #s 1 to n rows of data frame - mark as 1/0 and true/false to drop rows
madmen[1:nrow(madmen) %% 2 == 1, ]

# Copy madmen and drop every other row
m <- madmen[1:nrow(madmen) %% 2 == 1, ]
g <- graph.data.frame(m, directed=FALSE)

# Print out the names of each vertex
V(g)$name

plot(g, layout=layout.fruchterman.reingold,
     vertex.size        = 5,          #Smaller nodes
     vertex.label       = V(g)$name,  # Set the labels
     vertex.label.cex   = 0.8,        # Slightly smaller font
     vertex.label.dist  = 0.4,        # Offset the labels
     vertex.label.color = "black")

