# Q.1:  households on greater than 10 acres who sold 
#       more than $10,000 worth of agriculture products. 
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
              , destfile="getdata-data-ss06hid.csv")
ss06hid <- read.csv("getdata-data-ss06hid.csv")
clean.ss06 <- ss06hid[complete.cases(ss06hid[,c("ACR","AGS")]),][,c("ACR","AGS")]
head(clean.ss06[clean.ss06$ACR == 3 & clean.ss06$AGS == 6,])
install.packages("jpeg")
library(jpeg)

# Q.2 : Using the jpeg package read in the following picture of 
#   your instructor into R 
# Use the parameter native=TRUE. 
# What are the 30th and 80th quantiles of the resulting data?
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
              , destfile="getdata-Fjeff.jpg", method="curl")
img <- jpeg::readJPEG("getdata-Fjeff.jpg",native=TRUE)
img
quantile(img, probs=c(0.3,0.8))

# Q.3 : merge datasets
# sort the data frame in descending order by GDP rank
# what is the 13th country?
gdp.url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
edu.url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(gdp.url,destfile="gdp.csv")
download.file(edu.url,destfile="edu.csv")
gdp <- read.csv("gdp.csv",skip=4)
gdp <- gdp[1:190,] # without non-countries
edu <- read.csv("edu.csv",stringsAsFactors=T)     
gdp.sub <- gdp[,c(1,2,5)]
names(gdp.sub) <- c("id","ranking","gdp")
edu.sub <- edu[,c(1,2,3)]
names(edu.sub) <- c("id","long.name","income.group")
m.data <- merge(gdp.sub, edu.sub)
head(m.data)
tail(m.data)
# get number of rows from join
nrow(m.data)
library(stringr)
# clean up gdp column to get a clean gdp 
m.data$gdp <- as.numeric(str_trim(gsub(",","",m.data$gdp)))
head(m.data)
m.data$ranking <- as.numeric(as.character(m.data$ranking))
# return the 13th row
m.data[order(m.data$ranking, decreasing=T),][13,]
m.data
# Q.4
spGrp <- split(m.data$ranking, m.data$"income.group")
mean(spGrp$"High income: OECD", na.rm=T)
mean(spGrp$"High income: nonOECD", na.rm=T)
# Q.5
m.data.lowmid <- m.data[m.data$income.group =="Lower middle income",]
m.data.lowmid <-m.data.lowmid[,c("id","ranking","gdp")]
highest.gdp38 <- m.data[order(m.data$ranking),][,c("id","ranking","gdp")][1:38,]
merge(highest.gdp38, m.data.lowmid)
