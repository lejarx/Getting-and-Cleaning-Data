set.seed(13435)
x <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
x
## scramble the order of the rows
x <- x[sample(1:5),]
## put missing values
x$var2[c(1,3)] <- NA
x

## subset column
x[,1]
x[,"var1"]
## subset rows and columns
x[1:2,"var2"]

# logical statemnt
x[(x$var1 <= 3 & x$var3 > 11),]
x[(x$var1 <= 3 | x$var3 > 15),]

# dealing with missing values
x[which(x$var2 > 8),]

# sort
sort(x$var1)
sort(x$var1, decreasing=T)
sort(x$var2, na.last=T)
# sort by the order of variable 1
x[order(x$var1),]
x[order(x$var2,x$var3),]

# ordering with plyr package
library(plyr)
arrange(x,var1)
arrange(x,desc(var1))

# adding rows and columns
x$var4 <- rnorm(5)
x
y <- cbind(x, rnorm=rnorm(5))
y
