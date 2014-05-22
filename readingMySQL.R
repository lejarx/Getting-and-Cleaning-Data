library(RMySQL)
# http://genome.ucsc.edu/goldenPath/help/mysql.html
# access database
ucscDB <- dbConnect(MySQL(), user="genome"
                    , host = "genome-mysql.cse.ucsc.edu")
# run query command on ucscDB database
# show all databases 
result <- dbGetQuery(ucscDB,"show databases;")
hg19 <- dbConnect(MySQL(), user="genome", db="hg19",
                  host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
head(result)
head(allTables)
length(allTables)
# get dimensions of a specific table
# get column names from table hg19
dbListFields(hg19,"affyU133Plus2")
# get rows 
dbGetQuery(hg19, "select count(*) from affyU133Plus2")
# read from table
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

# subsetting
query <- dbSendQuery(hg19, "select * from affyU133Plus2   
                     where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)
dim(affyMis)
affyMisSmall <- fetch(query, n=10);
dim(affyMisSmall)
# clear query
dbClearResult(query)
# close the connection!!
dbDisconnect(ucscDB);
