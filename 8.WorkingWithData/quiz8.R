rm(list = ls())


dat1 <- data.frame(name = c("Cat", "Vic", "Osc"),
                   age  = c(9,7,4))

dat2 <- data.frame(name   = c("Vic", "Jon", "Cat"),
                   gender = c("male", "male", "female"))

all  <- merge(dat1, dat2)
all2 <- merge(dat1, dat2, all = TRUE)