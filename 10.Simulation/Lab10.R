rm(list = ls())
setwd("//uni-mainz.de/dfs/profiles/settings/holuj/Desktop/R/")

my.data <- read.csv("Lab10.csv")

data1<-my.data$systolic.bp[my.data$Genotype=="BA"] 
data2<-my.data$systolic.bp[my.data$Genotype=="BB"] 

testResult <- t.test(data1,data2)

par(mfrow=1:2)
plot(density(data1))
lines(density(data2), type="l", lty=3, lwd=2)

n1 <- length(data1)

set.seed(1234)
my.new.data<-my.data
my.new.data$Genotype<-"BB"
index.temp<-sample(1:50,n1)  
my.new.data$Genotype[index.temp]<-"BA"
new.data1 <- my.new.data$systolic.bp[my.new.data$Genotype=="BA"]
new.data2 <- my.new.data$systolic.bp[my.new.data$Genotype=="BB"]
t1 <- t.test(new.data1,new.data2)$statistic



  my.new.data<-my.data
  my.new.data$Genotype<-"BB"
  
ptest <- function(){
  index.temp<-sample(1:50,n1)  
  my.new.data$Genotype[index.temp]<-"BA"
  new.data1<-my.new.data$systolic.bp[my.new.data$Genotype=="BA"]
  new.data2<-my.new.data$systolic.bp[my.new.data$Genotype=="BB"]
  return(t.test(new.data1,new.data2)$statistic)
}

set.seed(554)
my.t.values <- replicate(100000, ptest())
hist(my.t.values, breaks=30)
     m<-mean((1*(my.t.values)^2>1*(testResult$statistic)^2))
     cat(m)
     
