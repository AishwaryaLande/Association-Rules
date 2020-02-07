library(arules)
library(arulesViz)

gro <- read.transactions("C:/Users/ADMIN/Desktop/Data_Science_Assig/Association Rules/groceries (2).csv",sep=",")
### groceries<-read.transactions(file.choose(),format="basket")

summary(gro)
itemFrequency(groceries[, 1:5])
inspect(gro[1:5])

itemFrequencyPlot(x = gro,topN=10)
Grules <- apriori(gro,parameter=list(support=0.005, confidence = 0.05,minlen=3)) 
inspect(head(sort(Grules, by = "lift")))
inspect(head(sort(Grules, by = "confidence")))
inspect(head(sort(Grules, by = "support")))
inspect(head(sort(Grules, by = c("count","lift"))))

head(quality(Grules))
colfunc <- colorRampPalette(c("black","red", "yellow"))
plot(Grules,method = "scatterplot",jitter=0,col=colfunc(30))

set.seed(103);plot(Grules,method = "graph")

plot(Grules,method = "paracoord")
plot(Grules,method = "grouped matrix",col=colfunc(300))
plot(Grules,method = "two-key plot",jitter=0)
plot(Grules,method = "matrix",engine = "3d")# iplots
# install.packages("iplots")
plot(Grules,method = "iplots")


yogurtrules <- subset(Grules, items %in% "yogurt")
inspect(yogurtrules[1:5])
                    