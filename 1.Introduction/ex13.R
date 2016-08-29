rm(list = ls())

x <- rnorm(100, mean = .5, sd = .3)

m = mean(x)
sdev = sd(x)

cat("mean:", m, "standard deviation:", sdev)

#plot a histogram
par(mar = c(5, 4, 4, 8) + 0.01)
hist(x, breaks = 8, axes = FALSE, labels = FALSE, xlab = "", ylab = "")
	axis(1)
	mtext("x", side = 1)
	axis(4)
	mtext("right y axis", side = 4)
