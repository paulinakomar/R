rm(list = ls())

library(UsingR)

my.data <- father.son
  X <- my.data$fheight
  Y <- my.data$sheight
analysis<-lm(Y~X)

  plot(X, Y, "p", xlab = 'son height', ylab = 'father height')