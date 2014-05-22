
fileurl <- "http://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileurl, destfile="cameras.csv", method="curl")
cameraData <- read.csv("cameras.csv")
names(cameraData)
tolower(names(cameraData))

# separate variables
# split by .
splitNames <- strsplit(names(cameraData),"\\.")
unlist(splitNames)

mylist <- list(letters = c("A","b","c"), numbers =1:3, matrix(1:25, ncol =5))
head(mylist)
mylist[1]
splitNames[[6]][1]


fileurl1 <- "http://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileurl2 <- "http://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileurl1, destfile="reviews.csv",method="curl")
download.file(fileurl2, destfile="solutions.csv",method="curl")
reviews <- read.csv("reviews.csv")
solutions <- read.csv("solutions.csv")
head(reviews,2)
head(solutions,2)

sub("_","",names(reviews))

# fixing character
testName <- "this_is_a_test"
sub("_"," ",testName)
# repeat
gsub("_"," ",testName)

# finding values
grep("Alameda", cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))
cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]
grep("Alameda", cameraData$intersection, value=T)
length(grep("Alameda", cameraData$intersection))

