#필요한 패키지
install.packages("networkD3")
library(networkD3)

#데이터 불러오기
node_data <- read.csv("node.csv", fileEncoding = "utf-8", stringsAsFactors = FALSE)
edge_data <- read.csv("edge.csv", fileEncoding = "utf-8", stringsAsFactors = FALSE)
View(edge_data)


#데이터 화인해보기
View(node_data)
View(edge_data)

#그래프 만들어보기
forceNetwork(Links = edge_data, Nodes = node_data, 
             Source = 'Source', Target = 'Target', 
             NodeID = 'name', Group = 'group', opacityNoHover = TRUE)

#줌 만들기
forceNetwork(Links = edge_data, Nodes = node_data, 
             Source = 'source', Target = 'target', 
             NodeID = 'name', Group = 'group', opacityNoHover = TRUE, zoom = TRUE)

#부가기능 만들기
forceNetwork(Links = edge_data, Nodes = node_data, 
             Source = 'Source', Target = 'Target', 
             NodeID = 'name', Group = 'group', 
             opacityNoHover = TRUE, zoom = TRUE, fontSize = 15, 
             fontFamily = "AppleGothic", opacity = 0.9, linkDistance = 75)


##############Chapter2###########################

#반기문 관련 복잡한 네트워크 (샘플데이터 node.csv, edge2.csv)
node_data2 <- read.csv("node2.csv", fileEncoding = "utf-8", stringsAsFactors = FALSE)
edge_data2 <- read.csv("edge2.csv", fileEncoding = "utf-8", stringsAsFactors = FALSE)

View(node_data2)
View(edge_data2)

forceNetwork(Links = edge_data2, Nodes = node_data2, 
             Source = 'fromID', Target = 'toID', 
             NodeID = 'name', Group = 'weight', 
             opacityNoHover = TRUE, zoom = TRUE, fontSize = 10, 
             fontFamily = "AppleGothic", opacity = 0.9, linkDistance = 75)

