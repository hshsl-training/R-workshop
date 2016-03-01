# This file provides the code for the hands-on portion of the HSHSL workshop
# Introduction to Data Analysis and Visualization with R.
#
# It was created by Brian Zelip, Emerging Technologies Librarian, bzelip@hshsl.umaryland.edu.
#
# 2016-03-01


#
# Section 1, visualizations with ggplot2
#


# install ggplot2
install.packages("ggplot2")

# load ggplot2 into the current workspace
library(ggplot2)

# load the diamonds dataset into the current workspace
data(diamonds)

# show the first few lines of diamonds data
head(diamonds)
# view the diamonds data
View(diamonds)
# show the documentation for the diamonds data
help(diamonds)
# summarize the diamonds data
summary(diamonds)

# use ggplot2 to show the distribution of diamond clarity types
bar1 <- ggplot(diamonds, aes(x=clarity)) + geom_bar() + labs(title="Counts of diamond clarities")
# show plot
bar1

# plot the amount of each type of diamond cut within each type of diamond clarity
bar2 <- ggplot(diamonds, aes(x=clarity, fill=cut)) + geom_bar() + labs(title="Counts of diamond clarities filled by cut count")
# show plot
bar2

# create a scatterplot showing the relationship between a diamond's weight and price
plot1 <- ggplot(diamonds, aes(x=carat, y=price)) + geom_point()
# show plot
plot1

# use the color of each dot to show a third variable, diamond clarity
plot2 <- ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point()
# show plot
plot2

# replace the third variable with color
plot3 <- ggplot(diamonds, aes(x=carat, y=price, color=color)) + geom_point()
# show plot
plot3

# use the size of each dot to plot a fourth variable, diamond cut
plot4 <- ggplot(diamonds, aes(x=carat, y=price, color=clarity, size=cut)) + geom_point()
# show plot
plot4

# or use the shape of each dot to plot a fourth variable
plot5 <- ggplot(diamonds, aes(x=carat, y=price, color=clarity, shape=cut)) + geom_point()
# show plot
plot5

# show a smoothing trend of the relationship between two variables
plot6 <- ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth()
# show plot
plot6

# remove the confidence interval
plot7 <- ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth(se=FALSE)
# show plot
plot7

# show the linear model instead of the curve
plot8 <- ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth(se=FALSE, method="lm")
# show plot
plot8

# add a third variable to create smoothing curves for each category of the new variable
plot9 <- ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point() + geom_smooth(se=FALSE)
# show plot
plot9

# show only the layer of the different smoothing curves
plot10 <- ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_smooth(se=FALSE)
# show plot
plot10

# facet three variables over the different categories of a fourth variable
# start with three variables
plot11 <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point()
# show plot
plot11
# add the facet function for the fourth variable, clarity
plot11 <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + facet_wrap(~ clarity)
# show plot
plot11

# give the plot a title
plot11 <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + facet_wrap(~ clarity) + ggtitle("Diamond carat, price, and cut by level of diamond clarity")
# show plot
plot11

# save the plot as a .png in your current working directory
ggsave(filename="diamonds.png", plot11)
# save the plot as a .jpg in your current working directory
ggsave(filename="diamonds.jpg", plot11)
# save the plot as a .pdf in your current working directory
ggsave(filename="diamonds.pdf", plot11)




#
# Section 2, statistical analysis
#


# load the dataset called mtcars into your current workspace (it comes with R by default)
data("mtcars")

# show the first few lines of mtcars data
head(mtcars)
# view the mtcars data
View(mtcars)
# show the documentation for the mtcars data
help(mtcars)
# summarize the mtcars data
summary(mtcars)

# access a single column of data, the mpg column
mtcars$mpg
# access a single column of data, the wt column
mtcars$wt

# perform a T-test comparing two variables
# the tilde "~" means "explained by", so the following tests for 
# an explanation of mpg by the car's transmission type
t.test(mpg ~ am, data=mtcars)
# assign the T-test result into a variable
tt = t.test(mpg ~ am, data=mtcars)
# show the T-test on demand
tt
# extract only the p-value
tt$p.value
# extract only the confidence interval
tt$conf.int


# perform a correlation test over two variables, mpg and wt
cor.test(mtcars$mpg, mtcars$wt)
# assign the correlation test result into a variable
ct = cor.test(mtcars$mpg, mtcars$wt)
# show the correlation test on demand
ct
# extract only the p-value
ct$p.value
# extract only the estimate
ct$estimate
# extract only the confidence interval
ct$conf.int


# Linear regression

# create a linear model showing mpg explained by wt
fit = lm(mpg ~ wt, mtcars)
# summarize the fit
summary(fit)
# extract the matrix of coefficients
coef(summary(fit))
# extract just the estimates of the matrix
co = coef(summary(fit))
# get the first column
co[, 1]
# get the fourth column
co[, 4]
# use the predict function for our existing cars
predict(fit)

# predict for a car at 4500 pounds
# summarize the fit
summary(fit)
# add together the intercept term (37.2851) and the weight coefficient
# (-5.3445) times our new weight, which is 4.5 thousands of pounds
37.2851 + (-5.3445) * 4.5

# use the built in predict function to get same answer as above
# create a data frame containing the predictors we wish to use (4500 lbs)
newcar = data.frame(wt=4.5)
# pass the predict function the new data frame
predict(fit, newcar)

# plot out the linear model with a smoothing curve
plot12 <- ggplot(mtcars, aes(wt, mpg)) + geom_point() + geom_smooth(method="lm") + ggtitle("Linear model of the relationship between a car's weight and efficiency")
# show plot
plot12
# save the plot as a .png in your current working directory
ggsave(filename="cars.png", plot12)
