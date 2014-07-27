Other variables and Transformation Codebook 				
Variable Name	Column Name	Class/ Data Type	Range/Levels	Description
activity_labels		data.frame		Master data for the activity names
	V1	integer	1 to 6	integer identifier
	V2	factor	"Levels :  
""LAYING"", 
""SITTING"", 
""STANDING"",
""WALKING"",
""WALKING_DOWNSTAIRS"",""WALKING_UPSTAIRS"""	The name of the activity performed.
features		data.frame		Master data for the features
	V1	integer		
	V2	factor	477 Levels	each features
subject_test		data.frame		Each Test subject's record
	SubjectId	integer	1 to 30	The column name has been set to SubjectId
subject_train		data.frame		Each Training subject's record
	SubjectId	integer	1 to 30	The column name has been set to SubjectId
y_test		data.frame		
	activity_names	factor	"Levels :  
""LAYING"", 
""SITTING"", 
""STANDING"",
""WALKING"",
""WALKING_DOWNSTAIRS"",""WALKING_UPSTAIRS"""	The names of the activity. The orginal data set had the integer id of the activity performed. By merging and subsetting the same data frame was modified to have the activity names only instead of the id. The column name was set to be activity_names
y_train		data.frame		
	activity_names	factor	"Levels :  
""LAYING"", 
""SITTING"", 
""STANDING"",
""WALKING"",
""WALKING_DOWNSTAIRS"",""WALKING_UPSTAIRS"""	The names of the activity. The orginal data set had the integer id of the activity performed. By merging and subsetting the same data frame was modified to have the activity names only instead of the id. The column name was set to be activity_names
X_test		data.frame		the main test data
	All values returned by features$V2	numeric		This data set after reading from the raw source was subjected to column name transformation by applying the taking the names from the V2 column of the features data set.
X_train		data.frame		the main training data
	All values returned by features$V2	numeric		This data set after reading from the raw source was subjected to column name transformation by applying the taking the names from the V2 column of the features data set.
test_Combined		data.frame		Column bind function applied with, subject_test data set's subjectid column, y_test data set's activity_names column (renamed as activityname) and the X_test data set
	SubjectId	integer	1 to 30	
	activityname	factor	"Levels :  
""LAYING"", 
""SITTING"", 
""STANDING"",
""WALKING"",
""WALKING_DOWNSTAIRS"",""WALKING_UPSTAIRS"""	
	All values returned by features$V2	numeric		
train_Combined		data.frame		Column bind function applied with, subject_train data set's subjectid column, y_train data set's activity_names column (renamed as activityname) and the X_train data set
	SubjectId	integer	1 to 30	
	activityname	factor	"Levels :  
""LAYING"", 
""SITTING"", 
""STANDING"",
""WALKING"",
""WALKING_DOWNSTAIRS"",""WALKING_UPSTAIRS"""	
	All values returned by features$V2	numeric		
val		data.frame		"The full join data frame that was the output of the join_all function applied on the train_Combined and test_Combined data frames;


After the columns to extract was identified, this data set was further transformed/sub-setted to have only the required columns. For this the col2Retrieve character vector was utilized "
	SubjectId	integer	1 to 30	
	activityname	factor	"Levels :  
""LAYING"", 
""SITTING"", 
""STANDING"",
""WALKING"",
""WALKING_DOWNSTAIRS"",""WALKING_UPSTAIRS"""	
	All values returned by features$V2	numeric		
indexes		integer		used to identify the indices of the "mean()" and "str()" occurring in the features data set's V2 column; utilization of the grep function for pattern matching
meanCols2Retrieve		character		character vector i.e. a subset of the features data set's V2 column based on the indexes retrieved when the search pattern was "mean()"
stdCols2Retrieve		character		character vector i.e. a subset of the features data set's V2 column based on the indexes retrieved when the search pattern was "std()"
col2Retrieve		character		combined character vector of the meanCols2Retrieve and stdCols2Retrieve
temp_tidy		data.frame		the melted data frame having subjectid and activity name as the id variables and all other columns of the val data frame as the measures variables; the melt function was used
tidyData		data.frame		the de-casted data having the summarized data of the mean per subject's per activity; the dcast function was used
TIDY DATA Codebook				
Variable Name		Class/ Data Type	Range/Levels	Description
subjectid		Integer	1 to 30	Each row identifies the subject who performed the activity
activityname		factor	"Levels :  
""LAYING"", 
""SITTING"", 
""STANDING"",
""WALKING"",
""WALKING_DOWNSTAIRS"",""WALKING_UPSTAIRS"""	The activies performed by each subject.
tBodyAcc-mean()-X		numeric	-	Mean of the X axis - Time Body Acceleration
tBodyAcc-mean()-Y		numeric	-	Mean of the Y axis - Time Body Acceleration
tBodyAcc-mean()-Z		numeric	-	Mean of the Z axis - Time Body Acceleration
tBodyAcc-std()-X		numeric	-	Standard Deviation of the X axis - Time Body Acceleration
tBodyAcc-std()-Y		numeric	-	Standard Deviation of the Y axis - Time Body Acceleration
tBodyAcc-std()-Z		numeric	-	Standard Deviation of the Z axis - Time Body Acceleration
tGravityAcc-mean()-X		numeric	-	Mean of the X axis - Time Gravity Acceleration
tGravityAcc-mean()-Y		numeric	-	Mean of the Y axis - Time Gravity Acceleration
tGravityAcc-mean()-Z		numeric	-	Mean of the Z axis - Time Gravity Acceleration
tGravityAcc-std()-X		numeric	-	Standard Deviation of the X axis - Time Gravity Acceleration
tGravityAcc-std()-Y		numeric	-	Standard Deviation of the Y axis - Time Gravity Acceleration
tGravityAcc-std()-Z		numeric	-	Standard Deviation of the Z axis - Time Gravity Acceleration
tBodyAccJerk-mean()-X		numeric	-	Mean of the X axis - Time Body Acceleration Jerk
tBodyAccJerk-mean()-Y		numeric	-	Mean of the Y axis - Time Body Acceleration Jerk
tBodyAccJerk-mean()-Z		numeric	-	Mean of the Z axis - Time Body Acceleration Jerk
tBodyAccJerk-std()-X		numeric	-	Standard Deviation of the X axis - Time Body Acceleration Jerk
tBodyAccJerk-std()-Y		numeric	-	Standard Deviation of the Y axis - Time Body Acceleration Jerk
tBodyAccJerk-std()-Z		numeric	-	Standard Deviation of the Z axis - Time Body Acceleration Jerk
tBodyGyro-mean()-X		numeric	-	Mean of the X axis - Time Body Gyroscope
tBodyGyro-mean()-Y		numeric	-	Mean of the Y axis - Time Body Gyroscope
tBodyGyro-mean()-Z		numeric	-	Mean of the Z axis - Time Body Gyroscope
tBodyGyro-std()-X		numeric	-	Standard Deviation of the X axis - Time Body Gyroscope
tBodyGyro-std()-Y		numeric	-	Standard Deviation of the Y axis - Time Body Gyroscope
tBodyGyro-std()-Z		numeric	-	Standard Deviation of the Z axis - Time Body Gyroscope
tBodyGyroJerk-mean()-X		numeric	-	Mean of the X axis - Time Body Gyroscope Jerk
tBodyGyroJerk-mean()-Y		numeric	-	Mean of the Y axis - Time Body Gyroscope Jerk
tBodyGyroJerk-mean()-Z		numeric	-	Mean of the Z axis - Time Body Gyroscope Jerk
tBodyGyroJerk-std()-X		numeric	-	Standard Deviation of the X axis - Time Body Gyroscope Jerk
tBodyGyroJerk-std()-Y		numeric	-	Standard Deviation of the Y axis - Time Body Gyroscope Jerk
tBodyGyroJerk-std()-Z		numeric	-	Standard Deviation of the Z axis - Time Body Gyroscope Jerk
tBodyAccMag-mean()		numeric	-	Mean- Time Body Acceleration using Euclidien norm
tBodyAccMag-std()		numeric	-	Standard Deviation - Time Body Acceleration using Euclidien norm
tGravityAccMag-mean()		numeric	-	Mean- Time Gravity Acceleration using Euclidien norm
tGravityAccMag-std()		numeric	-	Standard Deviation - Time Gravity Acceleration using Euclidien norm
tBodyAccJerkMag-mean()		numeric	-	Mean- Time Body Acceleration Jerk using Euclidien norm
tBodyAccJerkMag-std()		numeric	-	Standard Deviation - Time Body Acceleration Jerk using Euclidien norm
tBodyGyroMag-mean()		numeric	-	Mean- Time Body Gyroscope using Euclidien norm
tBodyGyroMag-std()		numeric	-	Standard Deviation - Time Body Gyroscope using Euclidien norm
tBodyGyroJerkMag-mean()		numeric	-	Mean- Time Body Gyroscope Jerk using Euclidien norm
tBodyGyroJerkMag-std()		numeric	-	Standard Deviation - Time Body Gyroscope Jerk using Euclidien norm
fBodyAcc-mean()-X		numeric	-	Mean of X axis - Fast Fourier Transformation - Body Acceleration
fBodyAcc-mean()-Y		numeric	-	Mean of Y axis - Fast Fourier Transformation - Body Acceleration
fBodyAcc-mean()-Z		numeric	-	Mean of Z axis - Fast Fourier Transformation - Body Acceleration
fBodyAcc-std()-X		numeric	-	Standard Deviation of X axis - Fast Fourier Transformation - Body Acceleration
fBodyAcc-std()-Y		numeric	-	Standard Deviation of Y axis - Fast Fourier Transformation - Body Acceleration
fBodyAcc-std()-Z		numeric	-	Standard Deviation of Z axis - Fast Fourier Transformation - Body Acceleration
fBodyAccJerk-mean()-X		numeric	-	Mean of X axis - Fast Fourier Transformation - Body Acceleration Jerk
fBodyAccJerk-mean()-Y		numeric	-	Mean of Y axis - Fast Fourier Transformation - Body Acceleration Jerk
fBodyAccJerk-mean()-Z		numeric	-	Mean of Z axis - Fast Fourier Transformation - Body Acceleration Jerk
fBodyAccJerk-std()-X		numeric	-	Standard Deviation of X axis - Fast Fourier Transformation - Body Acceleration Jerk
fBodyAccJerk-std()-Y		numeric	-	Standard Deviation of Y axis - Fast Fourier Transformation - Body Acceleration Jerk
fBodyAccJerk-std()-Z		numeric	-	Standard Deviation of Z axis - Fast Fourier Transformation - Body Acceleration Jerk
fBodyGyro-mean()-X		numeric	-	Mean of X axis - Fast Fourier Transformation - Body Gyroscope
fBodyGyro-mean()-Y		numeric	-	Mean of Y axis - Fast Fourier Transformation - Body Gyroscope
fBodyGyro-mean()-Z		numeric	-	Mean of Z axis - Fast Fourier Transformation - Body Gyroscope
fBodyGyro-std()-X		numeric	-	Standard Deviation of X axis - Fast Fourier Transformation - Body Gyroscope
fBodyGyro-std()-Y		numeric	-	Standard Deviation of Y axis - Fast Fourier Transformation - Body Gyroscope
fBodyGyro-std()-Z		numeric	-	Standard Deviation of Z axis - Fast Fourier Transformation - Body Gyroscope
fBodyAccMag-mean()		numeric	-	Mean - Fast Fourier Transformation - Body Acceleration using Euclidean norm
fBodyAccMag-std()		numeric	-	Standard Deviation - Fast Fourier Transformation - Body Acceleration using Euclidean norm
fBodyBodyAccJerkMag-mean()		numeric	-	Mean - Fast Fourier Transformation - Body Acceleration Jerk using Euclidean norm
fBodyBodyAccJerkMag-std()		numeric	-	Standard Deviation - Fast Fourier Transformation - Body Acceleration Jerk using Euclidean norm
fBodyBodyGyroMag-mean()		numeric	-	Mean - Fast Fourier Transformation - Body Gyroscope using Euclidean norm
fBodyBodyGyroMag-std()		numeric	-	Standard Deviation - Fast Fourier Transformation - Body Gyroscope using Euclidean norm
fBodyBodyGyroJerkMag-mean()		numeric	-	Mean - Fast Fourier Transformation - Body Gyroscope Jerk using Euclidean norm
fBodyBodyGyroJerkMag-std()		numeric	-	Standard Deviation - Fast Fourier Transformation - Body Gyroscope Jerk using Euclidean norm
