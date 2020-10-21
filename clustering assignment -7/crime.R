crime <- read.csv(file = "C:\\Users\\Sony\\Downloads\\clustering assignment -7\\crime_data.csv")

View(crime)

# Normalizing continuous columns to bring them under same scale

normalized_data<-scale(crime[2:5]) #excluding the university name columnbefore normalizing

d <- dist(normalized_data, method = "euclidean") # distance matrix

fit <- hclust(d, method="complete")

plot(fit) # display dendrogram
plot(fit, hang=-1,labels = crime$X)


library(NbClust)
NbClust(data =crime[,-1],min.nc = 2,max.nc = 10,method = "average")

par(mfrow = c(1,1))
plot(fit, hang=-1,labels = crime$X)

rect.hclust(fit, k=3, border="red")


groups <- cutree(fit, k=3) # cut tree into 3 clusters

membership <- as.matrix(groups) # groups or cluster numbers
final <- data.frame(crime, membership)

View(final)


aggregate(crime[,-1],by=list(final$membership),mean)

final[groups == "2",]
