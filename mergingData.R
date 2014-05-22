# peer review experiment data

fileurl1 <- "http://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileurl2 <- "http://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileurl1, destfile="reviews.csv",method="curl")
download.file(fileurl2, destfile="solutions.csv",method="curl")
reviews <- read.csv("reviews.csv")
solutions <- read.csv("solutions.csv")
head(reviews,2)
head(solutions,2)

# merging data 
names(reviews)
names(solutions)
mergedData <- merge(reviews,solutions, by.x="solution_id", by.y="id",all=TRUE)
head(mergedData)
names(mergedData)

# using plyr
library(plyr)
df1 <- data.frame(id=sample(1:10), x=rnorm(10))
df2 <- data.frame(id=sample(1:10), y=rnorm(10))
arrange(join(df1,df2),id)

df1 <- data.frame(id=sample(1:10), x=rnorm(10))
df2 <- data.frame(id=sample(1:10), y=rnorm(10))
df3 <- data.frame(id=sample(1:10), z=rnorm(10))
dfList <- list(df1,df2,df3)
join_all(dfList)
