# API: application programming interface
library(httr)
myapp <- oauth_app("github", "56b637a5baffac62cad9")

pg2 <- GET("https://api.github.com/users/jtleek/repos"
           , authenticate("645e9bbe0d1b7effd077","294f1a57c16551591bc77b717273d222e472dbc1"))
pg2

names(pg2)
content2 <- content(pg2)
library(jsonlite)
jsoncontent <- jsonlite::fromJSON(toJSON(content(pg2)))
jsoncontent$created_at
names(jsoncontent)
