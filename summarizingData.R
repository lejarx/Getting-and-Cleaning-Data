csvUrl <-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(csvUrl, destfile="restaurants.csv", method="curl")
restData <- read.csv("restaurants.csv")
restData
head(restData, n=3)
tail(restData, n=3)
summary(restData)
str(restData)
restData$neighborhood[grep("Hil",unique(restData$neighborhood))]
quantile(restData$councilDistrict, probs=c(0.5,0.75,0.9))
table(restData$zipCode, useNA="ifany")
table(restData$councilDistrict, restData$zipCode)
table(restData$zipCode,restData$councilDistrict)

# check for missing values
colSums(is.na(restData))
all(colSums(is.na(restData))==0)
all(restData$zipCode > 0)
# cross tables
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212", "21213"))
data(UCBAdmissions)
UCBAdmissions
df <- as.data.frame(UCBAdmissions)
df
summary(df)
summary(UCBAdmissions)
xt <- xtabs(Freq ~ Gender + Admit, data=df)
xt

# flat tables
warpbreaks$replicate <- rep(1:9, len = 54)
xt <- xtabs(breaks ~., data=warpbreaks)
xt
ftable(xt)

# size of a data set
fakeData <- rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units="Mb")
