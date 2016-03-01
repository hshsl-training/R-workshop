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


#
# Use the diamonds data to show basic exploration of data
# - summary
# - plot to show counts w/ histogram
# - reorder bars in histogram
#

library(ggplot2)
data(diamonds)
head(diamonds)

p <- ggplot(diamonds, aes(x=clarity, fill=cut))
p + geom_bar() + labs(title="Counts of diamond clarities filled by cut count")

summary(diamonds)

p <- ggplot(diamonds, aes(color))
p + geom_bar()

reorder_size <- function(x) {
  factor(x, levels = names(sort(table(x))))
}
ggplot(diamonds, aes(reorder_size(color))) + geom_bar() + labs(title="Diamonds color count filled by cut count")


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

# Now, this plot shows two aesthetics- weight and price- but there are many 
# other attributes of the data we can communicate. For example, we might 
# want to see how the quality of the cut, or the color, or the clarity, 
# affects the price.

# Let's add the clarity attritube, which is a measure of the clarity of 
# each diamond, to color our points.
ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point()

# Notice the legend that appeared on the right of the of plot.
# We can change clarity for color to see how color of diamonds affects the price.
ggplot(diamonds, aes(x=carat, y=price, color=color)) + geom_point()

# Now every item in the color legend is one of the ratings of color. 
# Or we can change it to "cut":
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point()

# This way we can explore the relationship of each of these variables 
# and how it affects the carat/price relationship.
# 
# Now, what if we want to see the effect of both color and cut? 
# We can use a fourth aesthetic, such as the size of the points. 
# So here we have color representing the clarity. Let's add another 
# aesthetic- let's say "size=cut."
ggplot(diamonds, aes(x=carat, y=price, color=clarity, size=cut)) + geom_point()

# Now the size of every point is determined by the cut even while the 
# color is still determined by the clarity. Similarly, we could use 
# the shape to represent the cut:
ggplot(diamonds, aes(x=carat, y=price, color=clarity, shape=cut)) + geom_point()

# Now every shape represents a different cut of the diamond.
# Now, this scatter plot is one "layer", which means we can add 
# additional layers besides the scatter plot using the plus sign. 
# For example, what if we want to add a smoothing curve that shows 
# the general trend of the data? That's a layer called geom_smooth.

# So let's take this plot, take out the color, and add a smoothing trend:
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth()

# The gray area around the curve is a confidence interval, suggesting 
# how much uncertainty there is in this smoothing curve. If we want to 
# turn off the confidence interval, we can add an option to the geom_smooth 
# later; specifically "se=FALSE", where "s.e." stands for "standard error."
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth(se=FALSE)

# This gets rid of the gray area and now we can just see the smoothing curve.
# Similarly, if we would rather show a best fit straight line rather than a 
# curve, we can change the "method" option in the geom_smooth layer. In this 
# case it's method="lm", where "lm" stands for "Linear model".
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth(se=FALSE, method="lm")

# There we fit a best fit line to the relationship between carat and price 
# with this geom_smooth layer.
# If you used a color aesthetic, ggplot will create one smoothing curve for 
# each color. For example, if we add "color=clarity":
ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point() + geom_smooth(se=FALSE)

# Now we see it actually fits one curve for each of these colors. This is 
# a useful way to compare and contrast multiple trends. Note that you can 
# show this smoothing curve layer without showing your scatter plot layer, 
# simply by removing the geom_point() layer:
ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_smooth(se=FALSE) + labs(title="Smoothing trends of diamond carat prices by clarity of diamond")

# This might be a bit clearer: we can see just the fit curves without 
# seeing the actual points.



















###
###
###
### STATISTICAL ANALYSES
###
###
###

data("mtcars")
head(mtcars)
help(mtcars)

mtcars$mpg



# To compare two samples to see if they have different means, 
# or averages, statisticians traditionally use a Student's T-test.
# This can be performed in R with the t.test function:

t.test(mpg ~ am, data=mtcars)

# First we give it the formula: mpg ~ am. In R, a tilde (~) 
# represents "explained by"- so this means "miles per gallon 
# explained by automatic transmission." Secondly we give it the 
# data we're plotting, which is mtcars. So this is saying "Does the 
# miles per gallon depend on whether it's an automatic or manual 
# transmission in the mtcars dataset."

# We get a lot of information from the t-test. Most notably, we get a p-value: 
# this shows the probability that that this apparent difference between 
# the two groups could appear by chance. This is a low p-value, so we 
# can be fairly confident that there is an actual difference between the groups. 
# We can also see a 95% confidence interval. This interval describes how much 
# lower the miles per gallon is in manual cars than it is in automatic cars. 
# We can be confident that the true difference is between 3.2 and 11.3. 
# These other values: such as the T test statistic and the number of degrees of 
# freedom used in the test, have relevance in the actual mathematical formulation 
# of the test.


# Now you're able to see these results manually. 
# But what if you want to extract them in R into its own variable, 
# for instance so that you could graph or report them later? Well, 
# first save the entire t-test into a variable. Recall that in R you 
# can do this by putting tt = at the start of the line:

tt = t.test(mpg ~ am, data=mtcars)

# This assigns the result of the t-test to the variable tt. 
# So now tt contains the result of the t-test.

tt

# We can also extract single values out using the dollar sign.

tt$p.value

# Similarly we can extract the confidence interval.

tt$conf.int


# A t-test examined whether a numeric variable differed ...

ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()

# [READ FROM THE WEBSITE FROM HERE OUT]
# http://varianceexplained.org/RData/code/code_lesson3/#segment2




cor.test(mtcars$mpg, mtcars$wt)


fit = lm(mpg ~ wt, mtcars)

summary(fit)



#
# Basic arithmetic
#

3 + 5        # addition
20 - 5       # subtraction
10 * 10      # multiplication
3 / 4        # division
18 %/% 12    # just the integer part of the quotient
18 %% 12     # just the remainder part (modulo)
10 ^ 2       # exponentiation
log(10)      # natural log (base e)
exp(2.302585)# antilog, e raised to a power
log10(100)   # base 10 logs; log(100, base=10) is the same
sqrt(100)    # square root

#
# More Useful Syntax
#

# Working with variables
x <- 5
y <- 9
y - x
[1] 4
sqrt(y)
[1] 3


# Keyword functions

install.packages("ggplot2")   # Install the ggplot2 library
library("ggplot2")            # Load the ggplot2 library into current workspace
library()                     # List all the packages built in to base R
data()                        # List all the datasets built in to base R
help(mtcars)                  # Show the description of the mtcars dataset
example("ggplot2")            # Show examples of using the ggplot2 library
getwd()                       # Get the current working directory for current workspace
setwd()                       # Set the current working directory for current workspace
list.files()                  # List the files in the working directory



# ---------------------------------------

# Show all datasets in the base R datasets library
data()

# Show all datasets in all installed libraries
data(package = .packages(all.available = TRUE))


# ---------------------------------------

# Vector and other misc practice

ma = matrix(1:6, nrow=3, ncol=2)
ma


# "example" is a function keyword, shows examples of an action
example("read.csv")

getwd()
setwd()
list.files()



newV <- 1:10
newV
# [1]  1  2  3  4  5  6  7  8  9 10

class(newV)
# [1] "integer"

newV * 2
# [1]  2  4  6  8 10 12 14 16 18 20

newW <- c(1:10, 4)
newW
# [1]  1  2  3  4  5  6  7  8  9 10  4

write.csv(newW, file="newW.csv")

# You can view a file not in use by R, in R
View("./newW.csv")

newV
# [1]  1  2  3  4  5  6  7  8  9 10

write.csv(newV, file="newV.csv")

matrix(newV)
#       [,1]
# [1,]    1
# [2,]    2
# [3,]    3
# [4,]    4
# [5,]    5
# [6,]    6
# [7,]    7
# [8,]    8
# [9,]    9
# [10,]   10

newMatrixV <- matrix(newV)

write.csv(newMatrixV, file="newV.csv")

View(newMatrixV)

write.csv(newMatrixV, file="newV.csv", col.names = NA, row.names = FALSE)
# Warning message:
#   In write.csv(newMatrixV, file = "newV.csv", col.names = NA, row.names = FALSE) :
#   attempt to set 'col.names' ignored