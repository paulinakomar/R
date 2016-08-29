rm(list = ls())
setwd("C:/Users/pauli/Documents/Visual Studio 2015/Projects")

f1 <- file("Assignment5.dat", open = "r")
my.data.part1 <- read.table(f1, skip = 4, comment.char = "%", nrows = 7)
my.data.part2 <- read.table(f1, skip = 3, sep = ";", dec = ",", nrows = 2)
my.data.part3 <- read.table(f1, skip = 5, sep = ",", na.strings = "-9999", nrows = 2)
close(f1)

my.all.data <- rbind(my.data.part1, my.data.part2, my.data.part3)