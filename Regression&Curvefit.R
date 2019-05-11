x <- c(32,64,96,118,126,144,152.5,158)
y <- c(99.5,104.8,108.5,100,86,64,35.3,15)
#we will make y the response variable and x the predictor
#the response variable is usually on the y-axis
plot(x,y,pch=19)

#linear regression - fit first degree polynomial equation:
fit  <- lm(y~x)

#curve fitting - second degree
fit2 <- lm(y~poly(x,2,raw=TRUE))

xx <- seq(30,160, length=50)
plot(x,y,pch=19,ylim=c(0,150))
lines(xx, predict(fit, data.frame(x=xx)), col="red")
lines(xx, predict(fit2, data.frame(x=xx)), col="green")

#Summary of the multiple R-squared using different degrees of polynomials:
summary(fit)
summary(fit2)

#Analysis of Variance
anova(fit,fit2)

#y=ax + b
coef(fit)

#y=ax^2 + bx + c
coef(fit2)

