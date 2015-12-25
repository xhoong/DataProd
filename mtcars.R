

data("mtcars")


bestfit <- lm(mpg ~ factor(am) + hp + wt, data = mtcars)

