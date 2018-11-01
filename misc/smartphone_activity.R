library(tidyverse)

library(randomForest)
library(gmodels)
library(neuralnet)
library(RSNNS)
library(Rcpp)
library(lattice)
library(ggplot2)
library(caret)
set.seed(123)

train_data<-read.table("UCI HAR Dataset/train/X_train.txt")
train_labels<-read.table("UCI HAR Dataset/train/y_train.txt")

test_data<-read.table("UCI HAR Dataset/test/X_test.txt")
test_labels<-read.table("UCI HAR Dataset/test/y_test.txt")

col_names <- readLines("UCI HAR Dataset/features.txt")
colnames(train_data)<-make.names(col_names)
colnames(test_data)<-make.names(col_names)
colnames(train_labels)<-"label"
colnames(test_labels)<-"label"

train_final<-cbind(train_labels,train_data)
test_final<-cbind(test_labels,test_data)
final_data<-rbind(train_final,test_final)
final_data$label<-factor(final_data$label)

final_data_tibble <- as.tibble(final_data)

train_data_tibble <- as.tibble(train_data)
train_labels_tibble <- as.tibble(train_labels)
test_data_tibble <- as.tibble(test_data)
test_labels_tibble <- as.tibble(test_labels)


#Sample histogram
ggplot(data = train_data_tibble) + geom_histogram(aes(x=train_data_tibble$X3.tBodyAcc.mean...Z))


# Machine learning
model_mlp<-caret::train(label~.,data=final_data[ttt,],method="mlp")
pre_mlp<-predict(model_mlp,final_data[-ttt,])
table(model_mlp,final_data[-ttt,1])
