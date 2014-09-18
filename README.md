gcdproject
==========

The project for Getting and Cleaning Data course on Coursera

Input
-----
The data was collected from the accelerometers from the Samsung Galaxy S smartphone worn by 30 volunteers.
The full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

See also the `README.txt` file in the `UCI HAR Dataset` folder.

Here is a quick summary of the files.

`activity_labels.txt` - the code values for the different types of activity

`features.txt` - enumeration of the 561 *features* included in each *feature vector*. See 'train/X_train.txt'

`features_info.txt` - describes what each of the 561 features is.

`train/subject_train.txt` - 7352 rows. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

`train/X_train.txt` - 7352 rows. Each row has the *feature vector* for that window sample which is 561 space separated values. `features.txt` specifies what *feature* each value is for.

`train/y_train.txt` - 7532 rows. Each row has the code for the type of activity for that window sample. Its range is that specified in `activity_labels.txt` (1 to 6).

`test/subject_test.txt` - 2947 rows. See `train/subject_train.txt`

`test/X_test.txt`- 2947 rows. See `train/X_train.txt`

`test/y_test.txt` - 2947 rows. See `train/y_train.txt` 


Processing
----------
Run the `run_analysis.R` script using version 3.1.1 of R (`source("run_analysis.R")`)

The script does the following steps to transform the raw data (contained in the
 `UCI HAR Dataset` folder) to *tidy data* :

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. I.e for each *feature vector* only takes the values for the features listed under **Features** below.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

See the `run_analysis.R` script for more information.


Output
------
`CodeBook.md` describes the data that is generated.

The `run_analysis.R` script uses `write.table` to output the tidy data to
a file called `tidydata.txt`.

This file can be read using R:
```R
data <- read.table("tidydata.txt", header = TRUE) 
View(data)
```


Features
--------
The features that are read are:

```
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
41 tGravityAcc-mean()-X
42 tGravityAcc-mean()-Y
43 tGravityAcc-mean()-Z
44 tGravityAcc-std()-X
45 tGravityAcc-std()-Y
46 tGravityAcc-std()-Z
81 tBodyAccJerk-mean()-X
82 tBodyAccJerk-mean()-Y
83 tBodyAccJerk-mean()-Z
84 tBodyAccJerk-std()-X
85 tBodyAccJerk-std()-Y
86 tBodyAccJerk-std()-Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
516 fBodyBodyAccJerkMag-mean()
517 fBodyBodyAccJerkMag-std()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()
```