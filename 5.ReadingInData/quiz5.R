rm(list = ls())

# q3
vec <- readLines("dat.txt")
vec <- strsplit(vec[2], " ")
vec <- as.numeric(vec[[1]])

# q4
f1 <- file("reading.txt", open = "r")
scan(f1, what = "", nlines = 2)
