# Copyright statement: no copyright
# Author: Nick John (nick.john@computer.org)
# File description:
# 	Processes raw data `UCI HAR Dataset` folder to output tidy data.
#   Written for the project for the Getting and Cleaning Data course on Coursera.
#
#   The steps that it does are the following
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#     measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set
#     with the average of each variable for each activity and each subject.

library(data.table)

load <- function(x) {

	# Load the std and mean features (ignoring the rest)
	dt <-read.table(paste0("UCI HAR Dataset/", x, "/X_", x, ".txt"), colClasses = colClasses, comment.char="")

	# Give the columns the right names
	names(dt) <- targetFeatureNames

	# Load the activity codes and add them
	a <- read.table(paste0("UCI HAR Dataset/", x, "/y_", x, ".txt"))
	dt$activityCode <- a$V1

	# Load the person IDs and add them
	s <- read.table(paste0("UCI HAR Dataset/", x, "/subject_", x, ".txt"))
	dt$subjectId <- s$V1

	dt
}

isTargetFeature <- function(x) {
	grepl(x, pattern="mean\\(\\)|std\\(\\)")
}

# Work out the column numbers of the std() and mean() features
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
featureNames <- features$V2
isTargetFeatures <- unlist(lapply(featureNames, isTargetFeature))
colClasses <- lapply(isTargetFeatures, function(x) { if (x) "numeric" else NULL})

# The names of the std() and mean() features
targetFeatureNames <- featureNames[isTargetFeatures]

# Load the test and train into separate data frames
testDF <- load("test")
trainDF <- load("train")

# Concatenate the test and the train data frames
combinedDf <- rbind(testDF, trainDF)

# Load the activity names
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = TRUE)

# Merge to give descriptive activity names to the activities in the data set
tidyDf <- merge(combinedDf, activityLabels, by.x = "activityCode", by.y = "V1")

# Aggregate by
aggregateBy <- list(activity = tidyDf$V2, subjectId = tidyDf$subjectId)

# Remove the activity code column
tidyDf$activityCode <- NULL
tidyDf$V2 <- NULL
tidyDf$subjectId <- NULL

# Aggregate the data by subjet and activity
df <- aggregate(tidyDf, by = aggregateBy, FUN = mean, na.rm = TRUE)

# Output the data to file
write.table(df, file = "tidy.dat", row.names = FALSE)