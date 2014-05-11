# Q1
# apply strsplit to split all the names of the data frame on 
# the characters wgtp
fileurl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl,destfile="fss06hid.csv",method="curl")
dat <- read.csv("fss06hid.csv")
wgtp <- names(dat)[grep("^wgtp", names(dat))]
strsplit(names(dat),"wgtp")[[123]]

gdp.url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(gdp.url,destfile="gdp.csv")
gdp <- read.csv("gdp.csv",skip=4)
gdp <- gdp[1:190,] # without non-countries
gdp.sub <- gdp[,c(1,2,4,5)]
names(gdp.sub) <- c("id","ranking","countryNames","gdp")
gdp.sub$gdp <- as.numeric(str_trim(gsub(",","",gdp.sub$gdp)))
head(gdp.sub)
tail(gdp.sub)
mean(gdp.sub$gdp)
head(gdp)
# Q.3 how many countries start with united
grep("^United",gdp.sub$countryNames, value=T)

# Q.4
edu.url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(edu.url,destfile="edu.csv")
edu <- read.csv("edu.csv",stringsAsFactors=T)     
edu.sub <- edu[,c(1,2,3,10)]
names(edu.sub) <- c("id","long.name","income.group","special.note")
head(edu.sub)
tail(edu.sub)
names(edu.sub)
str(edu.sub)
names(gdp.sub)
m.data <- merge(gdp.sub,edu.sub,by="id")
contain.fiscal <- grep("^Fiscal",m.data$special.note, value=T)
length(grep("June",contain.fiscal, value=T))


# Q.5
library(quantmod)
amzn <- getSymbols("AMZN", auto.assign=FALSE)
sampleTimes <- index(amzn)
amzn.2012 <- grep("^2012",sampleTimes, value=T)
length(amzn.2012)
amzn.2012.days <- format(as.Date(amzn.2012), format="%A")
length(grep("^Monday", amzn.2012.days, value=T))
