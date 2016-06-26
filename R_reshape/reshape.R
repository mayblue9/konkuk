install.packages("tidyr")
#install.packages("reshape")
library(tidyr)
library(reshape)

#데이터셋 불러오기
dataset <- read.csv("sample.csv", fileEncoding = "utf-8", stringsAsFactors = FALSE)
View(dataset)

#먼저 wide_data를 long_data로
gather_data <- gather(dataset, "country", "number", 2:8, convert=TRUE)
View(gather_data)


#long_data를 wide_data로
spread_data <- spread(gather_data, country, number)
View(spread_data)
