install.packages("ggplot2")
library(ggplot2)

# load the diamonds data from ggplot2
data(diamonds)

# show first few rows of data
head(diamonds)

# show description of dataset
help(diamonds)

# show summary of data
summary(diamonds)

p <- ggplot(diamonds, aes(x=clarity, fill=cut))
p + geom_bar() + labs(title="Counts of diamond clarity filled by cut count")


data(mtcars)

summary(mtcars)
help(mtcars)

mtcars$mpg


# DATA CLEANING

data(WorldPhones)

summary(WorldPhones)
View(WorldPhones)
help(WorldPhones)

install.packages("reshape2")
library("reshape2")

WorldPhones.m <- melt(WorldPhones)

head(WorldPhones.m)
View(WorldPhones.m)

