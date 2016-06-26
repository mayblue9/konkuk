# ggplot2 examples
#install.packages("ggthemes")

library(ggplot2) 
library(ggthemes)
library(reshape2)

# example1
ggplot(mpg, aes(displ, hwy))+
  geom_point()+
  geom_line(aes(color = factor(cyl))) + theme_fivethirtyeight()

# example2
jean <- read.csv("http://www.ling.upenn.edu/~joseff/data/jean2.csv")
ay <- subset(jean, VClass %in% c("ay","ay0"))
ay$VClass <- as.factor(as.character(ay$VClass))
ay.m <- melt(ay, id = c("Time","RTime", "Word","VClass"), measure = c("F1","F2"))
ggplot(ay.m, aes(RTime, value, color = VClass, group = Word:variable)) + 
  geom_line() + theme_fivethirtyeight()


# create factors with value labels 
mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),
                      labels=c("3gears","4gears","5gears")) 
mtcars$am <- factor(mtcars$am,levels=c(0,1),
                    labels=c("Automatic","Manual")) 
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),
                     labels=c("4cyl","6cyl","8cyl")) 

# Kernel density plots for mpg
# grouped by number of gears (indicated by color)
qplot(mpg, data=mtcars, geom="density", fill=gear, alpha=I(.5), 
      main="Distribution of Gas Milage", xlab="Miles Per Gallon", 
      ylab="Density") + theme_fivethirtyeight()

# Scatterplot of mpg vs. hp for each combination of gears and cylinders
# in each facet, transmittion type is represented by shape and color
qplot(hp, mpg, data=mtcars, shape=am, color=am, 
      facets=gear~cyl, size=I(3),
      xlab="Horsepower", ylab="Miles per Gallon")  + theme_wsj()

# Boxplots of mpg by number of gears 
# observations (points) are overlayed and jittered
qplot(gear, mpg, data=mtcars, geom=c("boxplot", "jitter"), 
      fill=gear, main="Mileage by Gear Number",
      xlab="", ylab="Miles per Gallon") + theme_economist()

