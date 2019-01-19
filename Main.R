#Load data from csv file
#setwd("C:/Users/edwardsun/ClassifyTextWithR")

install.packages("e1071")
install.packages("RTextTools")

library(e1071)
library(RTextTools)

#Load data from csv
dataDirectory <- "C:/ClassifyTextWithR/"
data1 <- read.csv(paste(dataDirectory, "sunnyData.csv", sep=""), header = TRUE)  

#Create the document term matrix
dtMatrix <- create_matrix(data1.class("Text"))

#Create and train SVM model. Configure training data. Virgin flag = false 
#indicates all data in training and testing sets have same labels.
container <- create_container(dtMatrix, data1$IsSunny, trainSize=1:11, virgin=FALSE)

#Note: beware of keyword data() for built-in datasets. (closure=function)

#train SVM Model
model <- train_model(container, "SVM", kernel="linear", cost=1)

# new data
predictionData <- list("sunny sunny sunny rainy rainy", "rainy sunny rainy rainy", "hello", "", "this is another rainy world")

# create a prediction document term matrix
predMatrix <- create_matrix(predictionData, originalMatrix=dtMatrix)

# create the corresponding container
predSize = length(predictionData);
predictionContainer <- create_container(predMatrix, labels=rep(0,predSize), testSize=1:predSize, virgin=FALSE)

# predict
results <- classify_model(predictionContainer, model)
results
