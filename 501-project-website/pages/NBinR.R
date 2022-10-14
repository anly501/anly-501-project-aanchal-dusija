# Clearing Environment
rm(list=ls())

# Libraries
library(e1071)
library(caTools)
library(caret)
library(dplyr)
library(Hmisc)
library(tidyverse)
library(ggplot2)
library(caret)
library(caretEnsemble)
library(psych)
library(Amelia)
library(mice)
library(GGally)
library(ROSE)
library(rpart)
library(randomForest)

# Loading Data
getwd()
setwd("/Users/aanchaldusija/Desktop/Georgetown University/ANLY 501/Homework/anly-501-project-aanchal-dusija/501-project-website/pages")
macy <- read_csv("macy_mw.csv")
head(macy)
macy<-macy[,c('Rating','Average_Price','C0_stock','C1_stock','C2_stock','C3_stock','C4_stock','C5_stock','Total_stock','Price_type')]

# Balancing Data
macy_balanced <- ovun.sample(Price_type~., data=macy,
                             N=nrow(macy), p=0.5,
                             seed=1, method="both")$data

apply(macy_balanced, 2, table)

# Exploratory data analysis
describe(macy_balanced)

# Splitting test and train
indxTrain <- createDataPartition(y = macy_balanced$Price_type,p = 0.75,list = FALSE)
training <- macy_balanced[indxTrain,]
testing <- macy_balanced[-indxTrain,] #Check dimensions of the split > pro

# Feature Scaling
x = training[,-10]
y = training$Price_type

# Model Building
model = train(x,y,'nb',trControl=trainControl(method='cv',number=10))
model

# Prediction
Predict <- predict(model,newdata = testing ) #Get the confusion matrix to see accuracy value and other parameter values > confusionMatrix(Predict, testing$Outcome )
Predict

# Variable Importance Plot
X <- varImp(model)
plot(X)

# Confusion Matrix 
cm = confusionMatrix(as.factor(testing$Price_type), Predict)
print(cm)

plt <- as.data.frame(cm$table)
plt$Prediction <- factor(plt$Prediction, levels=rev(levels(plt$Prediction)))

ggplot(plt, aes(Prediction,Reference, fill= Freq)) +
  geom_tile() + geom_text(aes(label=Freq)) +
  scale_fill_gradient(low="white", high="#009194") +
  labs(x = "Reference",y = "Prediction") +
  scale_x_discrete(labels=c("Expensive","Reasonable","Expensive","Reasonable")) +
  scale_y_discrete(labels=c("Reasonable","Expensive","Reasonable","Expensive"))
