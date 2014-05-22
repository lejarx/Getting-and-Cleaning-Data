set.seed(2000)
df = data.frame(x=c("b","b","b","a","a"),v=rnorm(5),stringsAsFactors=F)
df
str(df)
set.seed(2000)
dt = data.table(x=c("b","b","b","a","a"),v=rnorm(5))
dt
str(dt)
# convert data.frame to data.table
CARS <- data.table(cars)
head(CARS)
head(cars)

# see all tables in memory
tables()
sapply(dt, class)
sapply(df, class)
rownames(df)
dt[2,]
df[2,]
dt[dt$x=="b"]
df[df$x=="b",]
setkey(dt,x) ## is now reordered according to the key column x
dt["b"] ## we can get rows by using an element of the key
dt ## reordering
tables()
dt["b"]
dt["b", mult="first"] # first element
dt["b", mult="last"] # last element


grpsize = ceiling(1e7/26^2) 
tt=system.time( df <- data.frame(
           x=rep(LETTERS,each=26*grpsize),
           y=rep(letters,each=grpsize),
           v=runif(grpsize*26^2),
         stringsAsFactors=FALSE))
tt
head(df,3)
tail(df,3)
dim(df)
tt=system.time(ans1 <- DF[DF$x=="R" & DF$y=="h",])
head(ans1,3)
dim(ans1)

DT <- as.data.table(DF)
system.time(setkey(DT,x,y)) 
ss=system.time(ans2 <- DT[J("R","h")])
head(ans2,3)
dim(ans2)
tt[3]/ss[3]
system.time(ans2 <- DF[DF$x=="R" & DF$y=="h",])
mapply(identical,ans1,ans2)
dt[data.table("a","b"),]
dt[,c(1,2)]
dt[,list(x,v)]
setnames(dt,c("x","v"))
dt[,sum(v)]
dt[,sum(v), by=x]
DT[,sum(v), by=x]
ttt=system.time(tt <- tapply(DT$v,DT$x,sum)); ttt
sss=system.time(ss <- DT[,sum(v),by=x]); sss
ttt[3]/sss[3]
