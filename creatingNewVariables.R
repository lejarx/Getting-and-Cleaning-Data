csvUrl <-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(csvUrl, destfile="restaurants.csv", method="curl")
restData <- read.csv("restaurants.csv")
restData

# creating sequences
s1 <- seq(1,10,by=2);s1
s2 <- seq(1,10,length=3);s2
x <- c(1,3,8,25,100); seq(along=x)

# subsetting variables
restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

# creating binary variables
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

# creating categorical variables from quantitative
# break zipCode into quantile groups
restData$zipGroups <- cut(restData$zipCode, breaks=quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups, restData$zipCode)
# easier way
library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode, g=4)
table(restData$zipGroups)
# creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)
yesno <- sample(c("yes","no"),size=10,replace=TRUE);yesno;
yesnofac <- factor(yesno)
str(yesnofac)
yesnofac <- factor(yesno, levels=c("yes","no"))
str(yesnofac)
relevel(yesnofac, ref="yes")
str(yesnofac)
as.numeric(yesnofac)
library(plyr)
# creat new variable
restData2 <- mutate(restData, zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)
