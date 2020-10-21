airlines <- read.csv(file = "C:\\Users\\Sony\\Downloads\\clustering assignment -7\\EastWestAirlines.csv")

View(airlines)

# Normalizing continuous columns to bring them under same scale

normalized_data<-scale(airlines[2:11]) #excluding the university name columnbefore normalizing

d <- dist(normalized_data, method = "euclidean") # distance matrix

fit <- hclust(d, method="complete")

plot(fit) # display dendrogram
plot(fit, hang=-1,labels = airlines$ID.)


library(NbClust)
NbClust(data =airlines[,-1],min.nc = 2,max.nc = 10,method = "average")

par(mfrow = c(1,1))
plot(fit, hang=-1,labels = airlines$ID.)

rect.hclust(fit, k=3, border="red")


groups <- cutree(fit, k=3) # cut tree into 3 clusters

membership <- as.matrix(groups) # groups or cluster numbers
final <- data.frame(airlines, membership)

View(final)


aggregate(airlines[,-1],by=list(final$membership),mean)

final[groups == "2",]
