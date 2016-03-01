install.packages("ggplot2")
library(ggplot2)

data(diamonds)
head(diamonds)
View(diamonds)
summary(diamonds)
help(diamonds)


p <- ggplot(diamonds, aes(x=clarity, fill=cut))
p + geom_bar() + labs(title="Counts of diamond clarities filled by cut count")

p <- ggplot(diamonds, aes(color))
p + geom_bar()

reorder_size <- function(x) {
  factor(x, levels = names(sort(table(x))))
}

ggplot(diamonds, aes(reorder_size(color))) + geom_bar() + labs(title="Diamonds color count filled by cut count")


ggplot(diamonds, aes(x=carat, y=price)) + geom_point()

ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point()

ggplot(diamonds, aes(x=carat, y=price, color=color)) + geom_point()

ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point()

ggplot(diamonds, aes(x=carat, y=price, color=clarity, size=cut)) + geom_point()

ggplot(diamonds, aes(x=carat, y=price, color=clarity, shape=cut)) + geom_point()

ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth()

ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth(se=FALSE)

ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth(se=FALSE, method="lm")

ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point() + geom_smooth(se=FALSE)

ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_smooth(se=FALSE) + labs(title="Smoothing trends of diamond carat prices by clarity of diamond")



data("mtcars")
head(mtcars)
View(mtcars)
summary(mtcars)
help(mtcars)

mtcars$mpg

t.test(mpg ~ am, data=mtcars)

tt = t.test(mpg ~ am, data=mtcars)

tt

tt$p.value

tt$conf.int

ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()

mtcars$mpg

mtcars$wt

cor.test(mtcars$mpg, mtcars$wt)

ct = cor.test(mtcars$mpg, mtcars$wt)

ct

ct$p.value

ct$estimate

ct$conf.int



fit = lm(mpg ~ wt, mtcars)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)

37.2851 + (-5.3445) * 4.5

newcar = data.frame(wt=4.5)

predict(fit, newcar)

ggplot(mtcars, aes(wt, mpg)) + geom_point() + geom_smooth(method="lm")
