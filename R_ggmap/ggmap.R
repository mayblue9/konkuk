##install.packages("ggmap")
library(ggmap)

data <- read.csv("places.csv", header = TRUE, fileEncoding = "utf-8")  ## csv loading
class(data)
data$address <- enc2utf8(data$address)
data$address <- as.character(data$address) ## make character data$address
data_lonlat <- mutate_geocode(data, address, source='google') ## mutate_geocode | address -> lon/lat
write.csv(data_lonlat, "cleaning_data.csv", row.names = TRUE)
