Getting-and-Cleaning-Data : run_analysis
=========================

### Getting and Cleaning Data Project 

* Step 1 - Read all data into memory for merging

<b>Read test data</b>: 
<ol>
<li>./UCI HAR Dataset/test/subject_test.txt</li>
<li>./UCI HAR Dataset/test/X_test.txt</li>
<li>./UCI HAR Dataset/test/y_test.txt</li>
</ol>

<b>Read training data</b>: 
<ol>
<li>./UCI HAR Dataset/train/subject_train.txt</li>
<li>./UCI HAR Dataset/train/X_train.txt</li>
<li>./UCI HAR Dataset/train/y_train.txt</li>
</ol>

<b>Read features and activities</b>: 
<ol>
<li>./UCI HAR Dataset/activity_labels.txt</li>
<li>./UCI HAR Dataset/features.txt</li>
</ol>

	
* Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement	
		`grep("mean\\()|std\\()", names(data))`
		
* Step 3 - Uses descriptive activity names to name the activities in the data set. Appropriately labels the data set with descriptive activity names:

Use data from activity_labels.txt to match it with the Activity ID
        `data$Activity_label <- activity_labels`

* Step 4 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

          `aggregate.data.frame(data, Subject, Activity_label), mean)`

* Step 5 - Write result as tab delimited text file

          `write.table(data, "result.txt", sep="\t")`
### Example of output viewed in RStudio![result photo](output.png) 
