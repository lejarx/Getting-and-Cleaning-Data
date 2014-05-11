# q1
# How many housing units in this survey were 
# worth more than $1,000,000?
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url=fileUrl,destfile="housing.csv",method="curl")
houseDat <- read.csv("housing.csv")
houseDat <- data.table(houseDat)
class(houseDat)
nrow(houseDat[houseDat$VAL == 24])
houseDat$FES
houseDat[1,]

# q3
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url=fileUrl,destfile="natGas.xlsx",method="curl")
colInd <- 7:15
rowInd <- 18:23
dat <- read.xlsx("natGas.xlsx", 
                         sheetIndex=1,
                         colIndex=colInd, rowIndex=rowInd)
dat
sum(dat$Zip*dat$Ext, na.rm=T)

# q4
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
## get zipcode
## How many restaurants have zipcode 21231?
sum(xpathSApply(rootNode, "//zipcode", xmlValue) == "21231")
# q5 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url=fileUrl,destfile="housing2.csv",method="curl")
DT <- data.table(read.csv(file="housing2.csv"))
tapply(DT$pwgtp15,DT$SEX,mean)
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
DT[,mean(pwgtp15),by=SEX]
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
mean(DT$pwgtp15,by=DT$SEX)
sapply(split(DT$pwgtp15,DT$SEX),mean)
