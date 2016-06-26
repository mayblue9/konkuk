install.packages("twitterR")
install.packages("ROAuth")
install.packages("base64enc")
library(twitteR)
library(ROAuth)
library(base64enc)


consumer_key <- '5sskghkTdKvhNxoFAkUqwHg7F'
consumer_secret <- 'rGIXEWWNhwPhlh9WsIlMQ2pOrF4ypYxpIv5ATC1MyS2SFNnLaN'
access_token <- '2260968660-ynTqLkdpUfTTvUHqpWkZ86ULPLEsCu0foaPfTsf'
access_secret <- 'VdG3QSp2iyYzcz2exPMzNnRETRtBwOIt3cCSLaOHI3DFg'

setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)
##select 1

searchTwitter("#d3js", n=100)

data <- searchTwitter("#건국대학교", n=100)
data2 <- twListToDF(data)
View(data2)
