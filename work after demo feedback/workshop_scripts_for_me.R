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
# the two groups could appear by chance. This is a low p-value.
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


# A t-test examined whether a numeric variable differed between two categories.
# Another common statistical task is to test whether two numeric variables are 
# related. For example, we might be interested in testing whether a car's weight 
# affects fuel efficiency. We'll want to create a scatterplot before performing this test. 
# In this case, we can do that with:
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()

# Immediately you can see a negative relationship: a higher weight means a higher mpg
# and therefore a lower fuel efficiency in. This makes intuitive sense: a heavier car 
# requires more fuel. But is it possible that this trend happened by chance? Maybe it 
# just so happened that the cars we chose with heavier weights happened to have lower 
# fuel efficiency, and vice versa, even though there was no underlying relationship.
# 
# To test that, we need more than a graph: we need to perform a statistical test. 
# We're comparing two vectors here: the column describing the miles-per-gallon fuel 
# efficiency of each car, and the column describing the weight in pounds. Recall that 
# we can access a single column of the data using a dollar sign:

mtcars$mpg

mtcars$wt


# The simplest way to test for a relationship between two variables is with a 
# correlation test. This can be done with the cor.test function:
cor.test(mtcars$mpg, mtcars$wt)

# Just like the t-test, we produce a lot of information, so let's walk through it. 
# Most notable is the p-value. This value reads as 1.294 times 10 to the power of 
# negative ten- an extremely small number, smaller than one out of a billion. This 
# is the probability that this data would appear to be this strongly correlated by 
# chance alone. The smaller the p-value, the more significant the correlation, so 
# here we can be very confident that a correlation exists.

# We can also find the estimate of the correlation coefficient. This value varies 
# from -1 to 1, where 1 represents a perfectly linear positive relationship, 
# and -1 represents a perfectly linear negative relationship. 0 would indicate that 
# the two are not correlated. These values can be extracted individually from a 
# correlation test just like they could be from a t-test, by using a dollar sign. 
# For example, let's save it into a variable ct.
ct = cor.test(mtcars$mpg, mtcars$wt)

# Now ct contains the entire correlation test.
ct

#We can extract the p-value:
ct$p.value

# Similarly, we can extract the estimate by doing $estimate:
ct$estimate


# And much like the t-test, we can get a confidence interval:
ct$conf.int



# LINEAR REGRESSION

# In our example, we were able to test whether the fuel efficiency 
# of a car was related to its weight. But what if you want to turn this 
# relationship into a prediction: for instance, what would be the fuel 
# efficiency of a 4500 pound car?

# We can do this by fitting a linear model, or linear regression, which is 
# done in R with the lm function. Let's save linear model to a variable we call fit.
fit = lm(mpg ~ wt, mtcars)


# Here we put the formula we're testing, which is miles per gallon 
# explained by weight (recall that the tilde (~) means "explained by").
# 
# Now we can look at the details of this fit with the summary function:
summary(fit)


# This output contains a lot of information, even more than the t-test or 
# correlation test did. Let's look at a few parts of it. Briefly, it first 
# shows the call that's the way that the function was called; miles per 
# gallon explained by weight using the mtcars data. This next part summarizes 
# the residuals: that's how much the model got each of those predictions wrong- 
# how different the predictions were from the actual results. This table, the 
# most interesting part, is the coefficients- this shows the actual predictors 
# and the significance of each.

# We can extract this matrix of coefficients using the coef function:
coef(summary(fit))

# From that we get a matrix. If we want to extract out just the estimates- 
# just the y-intercept and the slope(the coefficient of weight)- we want to 
# get just the first column of the matrix. To do that, we can save it to a matrix:
co = coef(summary(fit))

# Then we get the first column:
co[, 1]

# If we wanted to get the p-values, we would extract the fourth column:
co[, 4]

# One advantage of a linear model is that it can be used not only for 
# statistical testing, but also for prediction. This model predicts a gas 
# mileage for each of our existing cars, using the predict function.
predict(fit)


# But these predictions aren't that useful to us, as we already have the 
# actual gas mileage of each. What if we wanted to predict the gas mileage 
# of a car that has a weight of, say, 4500 pounds? We could do this by adding 
# together the intercept term and the coefficient estimate times the weight. 
# So if we first see the summary of the fit:
summary(fit)


# We can then add together the intercept term (37.2851) and the weight 
# coefficient (-5.3445) times our new weight, which is 4.5 thousands of pounds:
37.2851 + (-5.3445) * 4.5


# This predicts a fuel efficiency of 13.2 miles per gallon. This is what a linear 
# model actually means: this is a linear combination of the intercept and the slope.

# There is a shortcut for producing this value from the fit, using the predict 
# function. First we create a data frame containing the predictors we wish to use. 
# In this case, imagine we had a new car that weighed 4500 pounds:
newcar = data.frame(wt=4.5)

# Now that we have this data frame, we can do
predict(fit, newcar)

# This calculates the same estimate, 13.235, predicting this car's miles per 
# gallon using this fit.

# Finally, note that we can show a linear model on our plot using a method built 
# into ggplot2, geom_smooth. We tell it that the method to use is "lm", a linear 
# model, the same one we've been learning.
ggplot(mtcars, aes(wt, mpg)) + geom_point() + geom_smooth(method="lm")

# Now we get a linear trend on our ggplot. The grey area shown is the uncertainty 
# in the fit: it's a 95% confidence interval of where the true trend line could be.

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
data <- read.csv("myData.csv", header = T)


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