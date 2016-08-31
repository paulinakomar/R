rm(list = ls())

library(R330)
data(wine.df)
  analysis <- lm(price~year + temp + h.rain + w.rain + h.rain:w.rain, data=wine.df)
  
  plot(wine.df$w.rain, wine.df$price, "p", xlab='', ylab='price', xlim = c(0,900))
  lines(wine.df$h.rain, wine.df$price, "p", xlab='', ylab='price', col = "red")

  dtest    <- drop1(analysis,test="F")
  
  # q3
  coef(analysis)
  hrain <- coef(analysis)[4]+800*coef(analysis)[6]
  
  # q4
    # Predict the price of a Bordeaux vintage in 1985 with the predict() function, 
    # if the temperature and precipitation in the harvest period and the preceding 
    # winter have values equal to the averages from the wine.df dataset, disregarding 
    # variation of the estimator.
  
  ndata <- data.frame(year = 1985, 
                      temp = mean(wine.df$temp), 
                      h.rain = mean(wine.df$h.rain), 
                      w.rain = mean(wine.df$w.rain))
  predicted.price <- predict(analysis, newdata = ndata)
  
  
  # q5
  log.analysis <- lm(log(price)~year + temp + h.rain + w.rain + h.rain:w.rain, data=wine.df)
  
  # q6
  d.logtest    <- drop1(log.analysis,test="F")
  
  # q7
  log.analysis.wointeraction <- lm(log(price)~year + temp + h.rain + w.rain, data=wine.df)
  
  # q8
    # Predict the price of a Bordeaux vintage in 1985 with the predict() function, if the 
    # temperature and precipitation in the harvest period and the preceding winter have values 
    # equal to the averages from the wine.df dataset, disregarding variation of the estimator.
  predicted.price2 <- exp(predict(log.analysis.wointeraction, newdata = ndata))
  
  par(mfrow=c(1,2)) 
  g<-function(x){dnorm(x,sd=sd(analysis$res))} 
  hist(analysis$res,probability=TRUE) 
  curve(g,col="red",lwd=3,add=TRUE) 
  hist(log.analysis.wointeraction$res,probability=TRUE) 
  g<-function(x){dnorm(x,sd=sd(log.analysis.wointeraction$res))} 
  curve(g,col="red",lwd=3,add=TRUE)
  
  
  