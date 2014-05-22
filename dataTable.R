library(data.table)
df <- data.frame(x=rnorm(9), y=rep(c("a","b","c"), each=3),z=rnorm(9))
df
dt <- data.table(x=rnorm(9), y=rep(c("a","b","c"), each=3),z=rnorm(9))
dt
tables()
df[1,]
dt[1,]
df[c(1,2),]
dt[c(1,2),]
df[,c(1,2)]
dt[,c(1,2), with=F]
?data.table
