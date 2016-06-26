#-------------------------------
#install.packages("dplyr")     
#install.packages("ggplot2")
#install.packages("ggthemes")
#-------------------------------

library(dplyr)
library(ggthemes)
library(ggplot2)

#filter_function
data <- diamonds
data_result <- filter(data, cut=="Ideal")
data_result <- filter(data, cut=="Good", color=="E")
View(data_result)

#select_function
head(data)
data_result <- select(data, carat, cut, color, price, clarity) %>% filter(price > 340)
View(data_result)

#Mutate_function
data_resultl <- mutate(data_result, price_per_carat = price/carat)
View(data_result)

#Summurize_function
summarize(data_result, avg_price = mean(price, na.rm = TRUE) )

#Pipe_Operate
data_result <- diamonds %>%
  filter(cut=="Ideal") %>%
  select(carat, cut, color, price, clarity) %>%
  mutate(price_per_carat = price/carat)

#ggplot2
diamonds %>% filter(cut == "Good") %>% ggplot(aes(price)) + geom_histogram() + facet_wrap(~color) + theme_fivethirtyeight()
