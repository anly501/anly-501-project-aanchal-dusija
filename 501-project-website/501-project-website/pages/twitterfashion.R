#install.packages("selectr")
#install.packages("rvest")
#install.packages("xml2")

library("selectr")
library("rvest")
library("xml2")

# install.packages("twitteR")
#install.packages("ROAuth")
# install.packages("rtweet")
library(rtweet)
library(twitteR)
library(ROAuth)
library(jsonlite)

#Reading text file containing twitter codes
# filename="Twitter_code.txt"
# (tokens<-read.csv(filename, header=TRUE, sep=","))

consumerKey="rJ4HdLKIsczoDs8ekzBPCsPZr"
consumerSecret="DKSDLqFVfVBuplUE9azzDIbOKIOwKke9sU2s8hLoGkVsQUUoQJ"
access_Token="1568054733637619712-55EIQz9eL2w91SBZ1Km7Ygacy1c1EX"
access_Secret="pceQFzN71feoJCLuPWY2BjM6wJZBhZhgw3zgRRUqwRk2y"


requestURL='https://api.twitter.com/oauth/request_token'
accessURL='https://api.twitter.com/oauth/access_token'
authURL='https://api.twitter.com/oauth/authorize'

setup_twitter_oauth(consumerKey,consumerSecret,access_Token,access_Secret)
NoSearch1<-twitteR::searchTwitter("#fashion",n=10000, since="2022-03-01")
Search_DF2 <- twListToDF(NoSearch1)

# Search_DF2$text[1]
setwd( "/Users/aanchaldusija/Downloads")

write.csv(Search_DF2,"test_file.csv")

FName = "MyFileExample.txt"
## Start the file
MyFile <- file(FName)
## Write Tweets to file
cat(unlist(Search_DF2), " ", file=MyFile, sep="\n\n\n")
close(MyFile)