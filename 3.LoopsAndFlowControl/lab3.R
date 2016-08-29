my.function<-function(x){
  return(c(min(x),median(x),mean(x),max(x)))
}


k <- 100
r <- 10
set.seed(5556)

x <- as.data.frame(matrix(rnorm(r*k),nrow=r)) 
my.summary <- matrix(nrow=4,ncol=k)

t1 <- as.numeric(Sys.time())
for(i in 1:k){
  my.summary[1,i] <- min(x[,i])
  my.summary[2,i] <- median(x[,i])
  my.summary[3,i] <- mean(x[,i])
  my.summary[4,i] <- max(x[,i])
}
t2 <- as.numeric(Sys.time())
  cat("for loop time:", t2-t1, "s\n")

my.summary2 <- sapply(x,my.function) 

t3 <- as.numeric(Sys.time())
  cat("sapply time:", t3-t2, "s")