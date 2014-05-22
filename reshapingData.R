
library(reshape2)
head(mtcars)

# melting data frame
?melt
head(mtcars)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname","gear","cyl")
                , measure.vars=c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)
cylData <- dcast(carMelt, cyl ~ variable)
cylData
cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData

# averaging values
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)
# another way
spIns <- split(InsectSprays$count, InsectSprays$spray)
sprCount <- lapply(spIns, sum)
unlist(sprCount)
sapply(spIns, sum)

# with plyr package
library(plyr)
ddply(InsectSprays,.(spray),summarise,sum=sum(count))
spraySums <- ddply(InsectSprays,.(spray),summarise,sum=ave(count,FUN=sum))
head(spraySums)
