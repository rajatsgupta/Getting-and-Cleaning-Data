activity_labels <- read.table("activity_labels.txt", quote="\"")

features <- read.table("features.txt", quote="\"")

subject_test <- read.table("test/subject_test.txt", quote="\"")

X_test <- read.table("test/X_test.txt", quote="\"")

y_test <- read.table("test/y_test.txt", quote="\"")

subject_train <- read.table("train/subject_train.txt", quote="\"")

X_train <- read.table("train/X_train.txt", quote="\"")

y_train <- read.table("train/y_train.txt", quote="\"")

colnames(X_test)<-features$V2

colnames(X_train)<-features$V2

library(plyr)

y_test<-data.frame(merge(y_test, activity_labels, by.x="V1", by.y="V1", sort=F, stringsAsFactors=F)[,"V2"],stringsAsFactors=F)

colnames(y_test)<-"activity_names"

y_train<-data.frame(merge(y_train, activity_labels, by.x="V1", by.y="V1", sort=F, stringsAsFactors=F)[,"V2"],stringsAsFactors=F)

colnames(y_train)<-"activity_names"

colnames(subject_test)<-"SubjectId"

colnames(subject_train)<-"SubjectId"

test_Combined<-cbind(subjectid= subject_test$SubjectId, activityname= y_test$activity_names,  X_test)

train_Combined<-cbind(subjectid= subject_train$SubjectId, activityname= y_train$activity_names,  X_train)

val<-join_all(list(train_Combined, test_Combined),type="full", match="all")

indexes<-grep("mean()", x=features$V2, fixed=T)

meanCols2Retrieve<-as.character(features[(features$V1 %in% (indexes)),"V2"])

indexes<-grep("std()", x=features$V2, fixed=T)

stdCols2Retrieve<-as.character(features[(features$V1 %in% (indexes)),"V2"])

col2Retrieve<-c(meanCols2Retrieve, stdCols2Retrieve)

val<- val[,c("subjectid","activityname", col2Retrieve)]

library(reshape2)

temp_tidy<-melt(data=val, na.rm=T, id.vars=c("subjectid", "activityname"), measure.vars=col2Retrieve)

tidyData<-dcast(temp_tidy, subjectid+activityname~variable, mean)

write.table(tidyData, file="tidyData.txt", sep=",", eol="\r\n",row.names=F)

rm("train_Combined","test_Combined", "y_train", "X_train", "subject_train", "y_test", "X_test", "subject_test", "val", 
   "temp_tidy", "activity_labels", "features", "col2Retrieve", "indexes", "meanCols2Retrieve", "stdCols2Retrieve")
