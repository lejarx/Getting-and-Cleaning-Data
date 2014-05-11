# Q.1 What time was the datasharing repo created?
library(httr)

# read api
request <- GET("https://api.github.com/users/jtleek/repos"
           , authenticate("645e9bbe0d1b7effd077","294f1a57c16551591bc77b717273d222e472dbc1"))
# retrieve request content and convert it to JSON format
library(jsonlite)
jsoncontent <- jsonlite::fromJSON(toJSON(content(request)))
# list all `attributes`
names(jsoncontent)
jsoncontent$name[[4]] ## datasharing!!
jsoncontent$created_at[[4]] ## retrieve its date

# Q.2 
acs <- read.csv("getdata-data-ss06pid.csv")
names(acs)
head(acs)
install.packages("sqldf",dependencies=T)
library(sqldf)
sqldf("select pwgtp1 from acs where AGEP < 50")

# Q.3
identical(sqldf("select distinct AGEP from acs")[[1]]
          , unique(acs$AGEP))

# Q.4
# How many characters are in the 10th, 20th, 30th and 100th lines 
# of HTML from this page: 
page.url <- "http://biostat.jhsph.edu/~jleek/contact.html"
thepage = readLines(page.url)
lapply(thepage[c(10,20,30,100)], nchar)


# Q.5
class(dat)
records <- read.fwf("getdata-wksst8110.for"
                    , widths=c(10,
                               -5,4,4,
                               -5,4,4,
                               -5,4,4
                    )
                    , skip=4)
sum(records[4])
