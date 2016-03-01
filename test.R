x <- 4
y <- 5
z <- x + y
z
example("read.csv")
help.search("knit")

example("knit")

newV <- 1:10
newV
class(newV)
newV * 2
newW <- c(1:10, 4)
newW
help(c)
write.csv(newW, file="newW.csv")
list.files()
inTheFlesh <- read.csv("newW.csv", header = F)
View(inTheFlesh)


library(ggplot2)
data(diamonds)
head(diamonds)
p <- ggplot(diamonds, aes(x=clarity, fill=cut))
p + geom_bar()


#
# Begin visualization w/ ggplot2
#

# Load the ggplot2 package
library("ggplot2")

# Load the diamonds dataset provided by ggplot2
data("diamonds")

# Show only the first 6 rows of the diamonds data
head(diamonds)

# Show all of the diamonds data
View(diamonds)

# Show metadata about the diamonds data
help(diamonds)

# Create default scatter plot from diamonds data
# This plot will show a relationship between two attributes 
# in the dataset: as weight increases, price increases.

# Now, there are three parts to a ggplot2 graph. The first is the data 
# we'll be graphing. In this case, we are plotting the diamonds data frame, 
# so we type "diamonds". Second, we show the mapping of aesthetics to the 
# attributes we'll be plotting. We type aes- meaning aesthetics- then open 
# parentheses, and now our assignments: we say "x=carat", saying we want to 
# put carat on the x-axis, then "y=price", saying what we want to put on the y-axis.
# 
# Now that we've defined the structure of our graph, we are going to add a 
# "layer" to it: that is, define what time of graph it is. In this case, we 
# want to make a scatter plot: the name for that layer is geom_point. "geom" 
# is a typical start for each of these layers. Now we've defined our graph, 
# and hit return, and we see our scatter plot.


ggplot(diamonds, aes(x=carat, y=price)) + geom_point()



ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point()