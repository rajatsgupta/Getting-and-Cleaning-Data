Getting-and-Cleaning-Data
=========================

The following text will provide the steps to reproduce the tidy dataset required as part of the Project Assignment. The requirement is to 

Merge the training and the test sets to create one data set.

Extract only the measurements on the mean and standard deviation for each measurement.

Uses descriptive activity names to name the activities in the data set.

Appropriately labels the data set with descriptive variable names. 

Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

========================= 

Steps to reproduce

Data Source : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

=========================

Step 1 	: 	Read the data of activity_labels.txt into a R data frame named activity_labels

Step 2 	:	Read the data of features.txt into a R data frame named features

Step 3 	: 	Read the data of subject_test.txt into a R data frame named subject_test

Step 4 	:	Read the data of X_test.txt into a R data frame named X_test

Step 5 	: 	Read the data of y_test.txt into a R data frame named y_test

Step 6 	:	Read the data of subject_train.txt into a R data frame named subject_train

Step 7 	: 	Read the data of X_train.txt into a R data frame named X_train

Step 8 	:	Read the data of y_train.txt into a R data frame named y_train

Step 9	:	Set the column names of the data frame X_test to the descriptive names available in the V2 column of the features data frame retrieved in Step 2

Step 10	:	Set the column names of the data frame X_train to the descriptive names available in the V2 column of the features data frame retrieved in Step 2

Step 11	:	Load the library plyr

Step 12	:	Reset the data frame y_test in a single statement as below

			Sub-Step - 1	:	Using the merge function, merge the data sets y_test and activity_labels on the y_test$V1 and activity_labels$V1 variables, ensuring that the original order is maintained by setting sort=F and strings are not converted to factors by setting stringsAsFactors=F

			Sub-Step - 2	:	Retrieve the V2 variable from the above resultant data frame and pass the same to the data.frame function to create a new data.frame whilst the stringsAsFactors=F setting is set. 

			Sub-Step - 3	:	Assign this new data frame to the y_test data frame there by ensuring that the activity numbers are replaced by the activity names

Step 13	:	Set the column name of the y_test data frame to "activity_names"

Step 14	:	Repeat Step 11 and Step 12 for the data frame y_train

Step 15	:	Set the column name of the subject_test data frame to "SubjectId"

Step 16	:	Set the column name of the subject_train data frame to "SubjectId"

Step 17	:	Using cbind function, add  SubjectId column of Subject_test data frame as subject id and Activity_Names column of y_test data frame as activityname to the X_test data frame and store the resultant data frame to a variable named test_Combined

Step 18	:	Using cbind function, add  SubjectId column of Subject_train data frame as subject id and Activity_Names column of y_train data frame as activityname to the X_train data frame and store the resultant data frame to a variable named train_Combined

Step 19	:	Using the join_all function of the plyr package join the test_Combined and train_Combined data frames into a single data frame with type=Full and match = all set, so that a full join is achieved and store the resultant data in a variable named val

Step 20	:	Using the grep function retrieve all the column indices where the string "mean()" occurs in the features data frame's V2 variable. Store this integer vector in a variable named indexes

Step 21	:	Retrieve the column names from the features data frame based on the indexes vector retrieved from Step 20. Ensure the column names returned is a character vector. Store in a variable named meanCols2Retrieve.

Step 22	:	Using the grep function retrieve all the column indices where the string "std()" occurs in the features data frame's V2 variable. Store this integer vector in the variable named indexes

Step 23	:	Retrieve the column names from the features data frame based on the indexes vector retrieved from Step 22. Ensure the column names returned is a character vector. Store in a variable named stdCols2Retrieve.

Step 24	:	Combine the 2 character vectors created in Step 21 and Step 23 and store in a variable named col2Retrieve

Step 25	:	Subset val data frame retrieved in Step 19 for the columns "subjectid", "activityname" and the character vector col2Retrieve retrieved in Step 24 and set the data into the same val data frame

Step 26	:	Load library reshape2

Step 27	:	Using the melt function, melt the val data frame by removing any missing values, where the id would be the subjectid and activity name, whereas the measures would be the remaining col2Retrieve character vector retrieved from Step 21. Store this melted data into a variable named temp_tidy

Step 28	:	Using the DCast function, cast the temp_tidy data set into a tidy one named tidyData, by grouping based on the subjectid and activityname with the means of each measures

Step 29	:	Write the data of tidyData into a text file  with separator and eol and no rownames settings set

Step 30	:	Remove all temporary variables created.
