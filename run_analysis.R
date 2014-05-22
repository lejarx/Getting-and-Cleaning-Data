#--------------------------------------------------
# READ DATAs
#--------------------------------------------------
# Read test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
# Read training data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
# Read features and activities
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

#--------------------------------------------------
# MERGE DATAs 
#--------------------------------------------------
# merge X
X_merged <- rbind(X_train, X_test)
# set column names by using features.txt
colnames(X_merged) <- as.character(features[,2])

#--------------------------------------------------
# Q.2 Extracts only the measurements on 
#     the mean and standard deviation for each measurement. 
#--------------------------------------------------
mean.std.cols <- grep("mean\\()|std\\()", names(X_merged))
X_merged <- X_merged[,mean.std.cols]

# merge subject
subject_merged <- rbind(subject_train, subject_test)

# merge Y
Y_merged <- rbind(Y_train, Y_test)

# merge subject and Y
Y.subject_merged <- cbind(subject_merged, Y_merged)

#--------------------------------------------------
# Q.3 Uses descriptive activity names to name 
#     the activities in the data set
# Q.4 Appropriately labels the data set with descriptive activity names. 
#--------------------------------------------------
Y.subject_merged$activity_label <- activity_labels$V2[Y.subject_merged[,2]]

#--------------------------------------------------
# Q.1 Merges the training and the test sets 
#     to create one data set.
#--------------------------------------------------
data_final <- cbind(Y.subject_merged, X_merged)
# set the missing column names
colnames(data_final)[1:2] <- c("Subject", "Activity_ID")
head(data_final)

# create a data set with the average of 
# each variable for each activity and each subject. 
#--------------------------------------------------
# Q.5 Creates a second, independent tidy data set 
#    with the average of each variable for each 
#    activity and each subject. 
#--------------------------------------------------
average.subject.activities <- aggregate.data.frame(data_final, list(data_final$Subject, data_final$activity_label), mean)[, c(-3, -5)]
colnames(average.subject.activities)[1:2] <- c("Subject", "Activity_Label")
# reorder output by Subject 
average.subject.activities <- average.subject.activities[order(average.subject.activities$Subject),]
# output to tab delimited txt file
write.csv(average.subject.activities, "averageSubjectActivities.csv",row.names=FALSE)
library(dplyr)
# create a wrapper on dataframe for clean viewing
tbl_df(average.subject.activities)