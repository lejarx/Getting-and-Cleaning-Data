# download file from the net
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "cameras.csv", method = "curl")
# set downloaded date
dateDownloaded <- date()
list.files()

# reading local files
camera.data <- read.csv("cameras.csv", header=TRUE)
head(camera.data)
str(camera.data)

# reading excel file
install.packages("xlsx")
library(xlsx)
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "cameras.xlsx", method = "curl")
colIndex <- 2:3
rowIndex <- 1:4
camera.data <- read.xlsx("cameras.xlsx", sheetIndex=1,colIndex=colIndex, rowIndex=rowIndex)
camera.data

# reading XML : extensible markup language
install.packages("XML", dependencies=TRUE)
library(XML)
fileUrl <- "http://ww.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
## acces 1st element
rootNode[[1]]
rootNode[[1]][[1]][[1]]

xmlSApply(rootNode, xmlValue)
# get the items on the menu and price
xpathSApply(rootNode, "//name", xmlValue)
xpathSApply(rootNode, "//price", xmlValue)
xpathSApply(rootNode, "//description", xmlValue)
xpathSApply(rootNode, "//food", xmlValue)
xpathSApply(rootNode, "//calories", xmlValue)

## another example
fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl, useInternalNodes=TRUE)
scores <- xpathSApply(doc, "//li[@class='scores']", xmlValue)
teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)


## reading JSON
install.packages("jsonlite", dependencies=T)
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
jsonData$owner$login
myjson <- toJSON(iris, pretty=TRUE)
cat(myjson)
iris2 <- fromJSON(myjson)
head(iris2)
head(iris)
install.packages("data.table", dependencies=T)
library(data.table)
DF <- data.frame(x=rnorm(9), y=rep(c("a","b","c"), each=3),z=rnorm(9))
DF
head(DF,3)
DT <- data.table(x=rnorm(9), y=rep(c("a","b","c"), each=3),z=rnorm(9))
DT
head(DT,3)
## see all the data tables in memory
tables() 
DT[2,]
DT[DT$y=="a"]
## subsettng rows
DT[c(2)]
## subsetting columns
DT[,c(2,3)]
DF[,c(2,3)]

DT[,list(mean(x),sum(z))]
DT[, table(y)]
DT[,w:=z^2]
DT
DT2 <- DT
DT2
DT[,y:=2]
head(DT, n=3)
# multiple operations
DT[, m:={tmp <- (x+z);log2(tmp+5)}]
DT
## plyr like operations
DT[,a:=x>0]
DT
DT[,b:=mean(x+w),by=a]
DT


## special variables
set.seed(123);
(DT <- data.table(x=sample(letters[1:3], 1E1, TRUE)))
DT[, .N, by=x]

## keys
DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300))
DT
setkey(DT,x)
DT['a', mean(y)]
DT['b', mean(y)]

## joins
DT1 <- data.table(x=c('a','a','b','dt1'), y =1:4)
DT2 <- data.table(x=c('a','b','dt2'), y =5:7)
setkey(DT1, x);setkey(DT2, x);
DT3 <- merge(DT1,DT2)

## fast reading
big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile()
write.table(big_df, file=file, row.names=FALSE, col.names=TRUE, 
            sep="T", quote=FALSE)
system.time(fread(file))
system.time(read.table(file, header=TRUE, sep="\t"))
