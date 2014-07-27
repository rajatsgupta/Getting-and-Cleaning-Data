## Read the activity data into a data frame
activity_labels <- read.table("activity_labels.txt", quote="\"")

## Read the features data into a data frame
features <- read.table("features.txt", quote="\"")

## read the subject_test data into a data frame that denotes the subject who performed the activity
subject_test <- read.table("test/subject_test.txt", quote="\"")

## read the X_test data into a data frame
X_test <- read.table("test/X_test.txt", quote="\"")

## read the y_test data into a data frame that denotes the activity perfomed
y_test <- read.table("test/y_test.txt", quote="\"")

## read the subject_train data into a data frame that denotes the subject who performed the activity
subject_train <- read.table("train/subject_train.txt", quote="\"")

## read the X_train data into a data frame
X_train <- read.table("train/X_train.txt", quote="\"")

## read the y_train data into a data frame that denotes the activity performed
y_train <- read.table("train/y_train.txt", quote="\"")

## Change the column names of the X_test data set with that of the features data set's V2 column values
colnames(X_test)<-features$V2

## Change the column names of the X_train data set with that of the features data set's V2 column values
colnames(X_train)<-features$V2

## load the plyr library
library(plyr)

## merge the y_test and activity_labels on the appropriate variables and ensure that original order is retained and strings are not converted to 
## factors. Further, subset the data returned by the merge function on the V2 variable and create a new data frame whilst retaining strings
## store the data to the same y_test data set.
y_test<-data.frame(merge(y_test, activity_labels, by.x="V1", by.y="V1", sort=F, stringsAsFactors=F)[,"V2"],stringsAsFactors=F)

## set the column names of the y_test dataset to "activity_names"
colnames(y_test)<-"activity_names"

## merge the y_train and activity_labels on the appropriate variables and ensure that original order is retained and strings are not converted to 
## factors. Further, subset the data returned by the merge function on the V2 variable and create a new data frame whilst retaining strings
## store the data to the same y_train data set
y_train<-data.frame(merge(y_train, activity_labels, by.x="V1", by.y="V1", sort=F, stringsAsFactors=F)[,"V2"],stringsAsFactors=F)

## set the column names of the y_train dataset to "activity_names"
colnames(y_train)<-"activity_names"

## set the column names of the subject_test dataset to "SubjectId", to maintain uniformity of column names i.e. without underscores
colnames(subject_test)<-"SubjectId"

## set the column names of the subject_train dataset to "SubjectId", to maintain uniformity of column names i.e. without underscores
colnames(subject_train)<-"SubjectId"

## column bind the subjectid column of subject_test and activity_names column of y_test with the columns of the X_test data set. Ensure that the
## newly added columns are placed at the beginning of the resultant data set
test_Combined<-cbind(subjectid= subject_test$SubjectId, activityname= y_test$activity_names,  X_test)

## column bind the subjectid column of subject_train and activity_names column of y_train with the columns of the X_train data set. Ensure that the
## newly added columns are placed at the beginning of the resultant data set
train_Combined<-cbind(subjectid= subject_train$SubjectId, activityname= y_train$activity_names,  X_train)

## join the above 2 created data frames on all rows and by performing a full join
val<-join_all(list(train_Combined, test_Combined),type="full", match="all")

## retrieve the indices of the features data set where the string "mean()" occurs in its V2 column
indexes<-grep("mean()", x=features$V2, fixed=T)

## retrieve the column names that pertains to the above retrieved indices
meanCols2Retrieve<-as.character(features[(features$V1 %in% (indexes)),"V2"])

## retrieve the indices of the features data set where the string "std()" occurs in its V2 column
indexes<-grep("std()", x=features$V2, fixed=T)

## retrieve the column names that pertains to the above retrieved indices
stdCols2Retrieve<-as.character(features[(features$V1 %in% (indexes)),"V2"])

## merge the mean() and std() column names
col2Retrieve<-c(meanCols2Retrieve, stdCols2Retrieve)

## subset the joined data set for the subjectid, activityname and column names for all means and standard deviation
val<- val[,c("subjectid","activityname", col2Retrieve)]

## load the library reshape2
library(reshape2)

## melt the sub set data, by removing the NAs, with the id set to the subjectid and activityname and measures being the remaining columns 
temp_tidy<-melt(data=val, na.rm=T, id.vars=c("subjectid", "activityname"), measure.vars=col2Retrieve)

## decast the melted data set grouped bu the subjectid and activity id and calculate the mean
tidyData<-dcast(temp_tidy, subjectid+activityname~variable, mean)

## write the data into a flat file separated by "," and eol setting set and ensuring that the rownames are note generated
write.table(tidyData, file="tidyData.txt", sep=",", eol="\r\n",row.names=F)

## remove all temporary variables created
rm("train_Combined","test_Combined", "y_train", "X_train", "subject_train", "y_test", "X_test", "subject_test", "val", 
   "temp_tidy", "activity_labels", "features", "col2Retrieve", "indexes", "meanCols2Retrieve", "stdCols2Retrieve")
