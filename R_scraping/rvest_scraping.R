##install.packages("rvest")
##install.packages("XML")
library(rvest)
library(XML)
library(plyr)


data_url <- "http://score.sports.media.daum.net/record/soccer/epl/trnk.daum"
data_html <- read_html(data_url, encoding='UTF-8')

data_table = html_node(data_html, '#table1')
data_finish <- html_table(data_table)
