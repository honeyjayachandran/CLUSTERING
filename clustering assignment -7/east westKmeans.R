# Kmeans Clustering of airlines Dataset

install.packages('factoextra')
library(rattle)
library(NbClust)
library(factoextra)

# import the data set 
airlines <- read.csv(file = "C:\\Users\\Sony\\Downloads\\clustering assignment -7\\EastWestAirlines.csv")

View(airlines)
 
str(airlines)

# Finding the optimum no of clusters 

df <- airlines[-1]

df <- scale(df)

library(NbClust)
NbClust(data = df,
              min.nc = 2,
              max.nc = 10,
              method = "kmeans")

library(factoextra)

fviz_nbclust(x = df, FUNcluster = kmeans,method = "wss") 

model <- kmeans(x = df,centers = 7,nstart = 25)

fviz_cluster(object = model, data = df)

aggregate(df,by=list(cluster = model$cluster),mean)

airlines$cluster <- model$cluster

t <- table(airlines$cluster, model$cluster)

install.packages("flexclust")
library(flexclust)

randIndex(t)  #ari =1

model$cluster == 1


cluster1 <- as.data.frame(airlines[airlines$cluster == 1,])
View(cluster1)
model$size # 820 140 43 15 1173 977 831
