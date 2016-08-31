rm(list = ls())

my.data<-data.frame(Treatment=c(rep("A",4),rep("B",4)),
                    Stone=rep(rep(c("Small","Large"),c(2,2)),2),
                    Success=rep(c(1,0),4),
                    Count=c(81,6,192,71,234,36,55,25))

my.table<-xtabs(Count~Treatment+Success+Stone,data=my.data) 
ftable(my.table)

my.table2<-prop.table(margin.table(my.table, 1:2),1) 

small <- prop.table(my.table[,,2],1)
large <- prop.table(my.table[,,1],1) 
treatA <-  prop.table(my.table[1,,], 2)
treatB <-  prop.table(my.table[2,,], 2)

