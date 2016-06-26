
#===wordcloud를 만들기 위해 필요한 패키지===
install.packages("KoNLP") 
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("tm")
install.pacakges("ggplot2")
install.packages("dplyr")
install.packages("rJava") #wordcloud package needed
install.packages("Rcpp")  #wordcloud package needed
install.packages("grDevices")


#===패키지 불러오기
library(KoNLP)          #한글인식 패키지
library(wordcloud)      #wordcloud를 만들어 주는 패키지
library(RColorBrewer)   #워드클라우드 디자인 팔레트
library(tm)             #텍스트 마이닝 패키지
library(ggplot2)        #데이터시각화 패키지
library(dplyr)          #데이터 정제 패키지


useSejongDic()          #명사추출시 참고할 한국어 사전

#===작업 코드
#data <- read.csv("jung.csv", fileEncoding = "utf-8", stringsAsFactors = FALSE)
sample <- read.csv("infogram.csv", fileEncoding = "utf-8", stringsAsFactors = FALSE)
data_noun <- data$quotation

View(data)

#데이터 중 명사만 추출
data_noun2 <- sapply(data_noun, extractNoun, USE.NAMES = F)
head(unlist(data_noun2), 20)

#"한", "그" 와 같은 한 글자 단어와 다섯 글자 단어 미만의 단어만 다시 한번 필터링
data.trim <- unlist(data_noun2)
data.trim <- Filter(function(x) {nchar(x) >1 && nchar(x) <= 5}, data.trim)
data.trim

#분석할 단어를 gsub 함수를 통해 삭제하자
data.trim <- gsub("이번", "", data.trim)
data.trim <- gsub("하기", "", data.trim)
data.trim <- gsub("대한", "", data.trim)
data.trim <- gsub("민국", "", data.trim)
data.trim <- gsub("26", "", data.trim)
data.trim <- gsub("지금", "", data.trim)
data.trim <- gsub("하기", "", data.trim)
data.trim <- gsub("26", "", data.trim)
data.trim <- gsub("계속", "", data.trim)
data.trim <- gsub("우리", "", data.trim)
data.trim <- gsub("들이", "", data.trim)
data.trim <- gsub("성사", "", data.trim)
data.trim <- gsub("하게", "", data.trim)
data.trim <- gsub("해서", "", data.trim)
data.trim <- gsub("앞장", "", data.trim)
data.trim <- gsub("\\d+","", data.trim) 





#txt transforming & count words
write(unlist(data.trim), "jung.txt")
jung.tab <- read.table("jung.txt")
jung.count <- table(jung.tab)

#data.frame으로 변환
#histogram을 만들기 위해 따로 저장
data_frame_jung <- data.frame(sort(jung.count, decreasing = T))  
write.csv(data_frame_jung, "dataframe_jung.csv")                 

#View top 50 words
head(sort(jung.count, decreasing = T), 5)

#setting pallete
pal <- brewer.pal(9, "Blues")
display.brewer.all()

#making wordcloud
wordcloud <- wordcloud(names(jung.count), 
          freq = jung.count, 
          scale = c(5, 0.9),
          rot.per = 0.2,
          colors = pal,
          random.order = F,
          min.freq = 5,
          max.words = 70,
          family= "AppleGothic")

#find font
postscriptFonts()

#barcgart making
histo_data <- read.csv("dataframe_jung.csv", fileEncoding = "utf-8", header = TRUE, stringsAsFactors = FALSE)
View(histo_data)
histo_data <- filter(histo_data, count>5)
View(histo_data)

#add colname (만약 칼럼 이름이 없다면)
colnames(histo_data)[1] <- "word"
colnames(histo_data)[2] <- "count"

histo_data <- filter(histo_data, count>5)
View(histo_data)

#csv로 빼기
write.csv(histo_data, "infogram.csv")
#making graph_order
ggplot(histo_data, aes(x=reorder(word, -count), y=count)) + geom_bar(stat="identity") + theme(text=element_text(size=10, family="AppleGothic"))
