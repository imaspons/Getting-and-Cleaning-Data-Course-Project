### CODE BOOK 

The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.


Assign each data to variables
features <- features.txt : 561 rows, 2 columns
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
activities <- activity_labels.txt : 6 rows, 2 columns
List of activities performed when the corresponding measurements were taken and its codes (labels)
subject_test <- test/subject_test.txt : 2947 rows, 1 column
contains test data of 30% of volunteer test subjects being observed
x_test <- test/X_test.txt : 2947 rows, 561 columns
contains recorded features test data
y_test <- test/y_test.txt : 2947 rows, 1 columns
contains test data of activities’code labels
subject_train <- test/subject_train.txt : 7352 rows, 1 column
contains train data of 70% volunteer subjects being observed
x_train <- test/X_train.txt : 7352 rows, 561 columns
contains recorded features train data
y_train <- test/y_train.txt : 7352 rows, 1 columns
contains train data of activities’code labels

x_test and x_train names are change according to feature.txt file

Merges the training and the test sets to create one data set.

Test_data (2947 rows, 563 columns) is created by merging subject_test, y_test, x_test using cbind() function.

Train_data (7352 rows, 563 column) is created by merging subject_train, y_train, x_train using cbind() function. 

MergedData (10299 rows, 563 column) is created by merging test_data, train_data using rbind() function

Extracts only the measurements on the mean and standard deviation for each measurement
MergedData2 (10299 rows, 88 columns) is created by subsetting MergedData, selecting only columns: ID, activity and the measurements on the mean and standard deviation (std) for each measurement


Appropriately labels the data set with descriptive variable names: 

- All Acc in column’s name replaced by Accelerometer.
- All Gyro in column’s name replaced by Gyroscope.
- All BodyBody in column’s name replaced by Body.
- All Mag in column’s name replaced by Magnitude.
- All start with character f in column’s name replaced by Frequency.
- All start with character t in column’s name replaced by Time.

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
Sumarizing (180 rows, 88 columns) is created by sumarizing MergedData2 taking the means of each variable for each activity and each subject, after groupped by subject and activity.
Export Sumarizing into Sumarizing.txt file.
