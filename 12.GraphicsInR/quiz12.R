rm(list = ls())

library(ggplot2)
data(mtcars)

# q1
# qplot(hp, qsec, data=mtcars, geom=c("point","smooth"), method="lm") 


# q3
p <- ggplot(data = mtcars)
p <- p + aes(x = qsec, y = hp)
p <- p + geom_point() + geom_smooth(method = lm)
p


# q4
hist(airquality$Temp, breaks=10)
qplot(Temp, data=airquality, binwidth=5) 


# q5
x<-rnorm(1000, mean=-5) 
plot(density(x))
ggplot() + aes(x = x) + geom_density() 