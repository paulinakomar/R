rm(list = ls())

library(RODBC)

connStr <- paste("Server=msedxeus.database.windows.net",
                 "Database=DAT209x01",
                 "uid=RLogin",
                 "pwd=P@ssw0rd",
                 "Driver={SQL Server}",
                 sep=";"
)
conn <- odbcDriverConnect(connStr)

my.data.frame <- sqlQuery(conn,
                         "SELECT SUM(Revenue), SUM(Units), ProductID
                         FROM bi.salesFact
                         WHERE Date > '2013-12-31' AND Date < '2015-01-01'
                         GROUP BY ProductID"
)

names(my.data.frame)<-c("SUM(Revenue)","SUM(Units)","ProductID") 
top.units <- my.data.frame$ProductID[order(my.data.frame$"SUM(Units)",decreasing=TRUE)][1:5]
top.rev   <- my.data.frame$ProductID[order(my.data.frame$"SUM(Revenue)",decreasing=TRUE)][1:5]