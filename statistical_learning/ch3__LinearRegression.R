library(MASS)
library(ISLR)

attach(Boston)
ggplot(Boston, aes(x=lstat, y=medv)) + geom_point()
lm.fit=lm(medv~lstat)
summary(lm.fit)

c<-coef(lm.fit)

