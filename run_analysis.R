#  Loading training and testing data sets.

x_test <- read.table("X_test.txt")
x_train <- read.table("X_train.txt")

#Renaming variables according to the "feature"

features <- read.table("features.txt")
names(x_test) <- features$V2
names(x_train) <- features$V2

# Assigning a subject and activity to each observation

#### Subject

subject_test <- read.table("subject_test.txt")
subject_test <- rename(subject_test, ID = V1)

subject_train <- read.table("subject_train.txt")
subject_train <- rename(subject_train, ID = V1)

#### Activity

y_train <- read.table("y_train.txt")
y_train <- rename(y_train, Activity = V1)

y_test <- read.table("y_test.txt")
y_test <- rename(y_test, Activity = V1)


#### 3. Using descriptive activity names to name the activities in the data set

y_test$Activity<- gsub("1", "Walking", y_test$Activity)
y_test$Activity <- gsub("2", "Walking_upstairs", y_test$Activity)
y_test$Activity <- gsub("3", "Walking_downstairs", y_test$Activity)
y_test$Activity<- gsub("4", "Sitting", y_test$Activity)
y_test$Activity <- gsub("5", "Standing", y_test$Activity)
y_test$Activity <- gsub("6", "Laying", y_test$Activity)

y_train$Activity <- gsub("1", "Walking", y_train$Activity)
y_train$Activity <- gsub("2", "Walking_upstairs", y_train$Activity)
y_train$Activity <- gsub("3", "Walking_downstairs", y_train$Activity)
y_train$Activity <- gsub("4", "Sitting", y_train$Activity)
y_train$Activity <- gsub("5", "Standing", y_train$Activity)
y_train$Activity <- gsub("6", "Laying", y_train$Activity)

##### Assigning

test_data <- cbind(subject_test, y_test, x_test)
train_data <- cbind(subject_train, y_train, x_train)

#1. Merging training and testing data sets.

mergedData <- rbind(test_data, train_data)

# 2. Extract only the mean and sd measures for each measurement

colNames <- names(mergedData)
mergedData_ID <- mergedData[grep("ID", names(mergedData))]
mergedData_Act <- mergedData[grep("Activity", names(mergedData))]
mergedData_mean <- mergedData[grep("mean", names(mergedData))] 
mergedData_sd <- mergedData[grep("std", names(mergedData))]
mergedData2 <- cbind(mergedData_ID, mergedData_Act, mergedData_mean, mergedData_sd)

#3. Uses descriptive activity names to name the activities in the data set
########Please note this section has been done previously

#4. Appropriately labels the data set with descriptive variable names.

names(mergedData2)<-gsub("Acc", "Accelerometer", names(mergedData2))
names(mergedData2)<-gsub("Gyro", "Gyroscope", names(mergedData2))
names(mergedData2)<-gsub("BodyBody", "Body", names(mergedData2))
names(mergedData2)<-gsub("Mag", "Magnitude", names(mergedData2))
names(mergedData2)<-gsub("^t", "Time", names(mergedData2))
names(mergedData2)<-gsub("^f", "Frequency", names(mergedData2))
names(mergedData2)<-gsub("tBody", "TimeBody", names(mergedData2))
names(mergedData2)<-gsub("-mean()", "Mean", names(mergedData2), ignore.case = TRUE)
names(mergedData2)<-gsub("-std()", "STD", names(mergedData2), ignore.case = TRUE)
names(mergedData2)<-gsub("-freq()", "Frequency", names(mergedData2), ignore.case = TRUE)
names(mergedData2)<-gsub("angle", "Angle", names(mergedData2))
names(mergedData2)<-gsub("gravity", "Gravity", names(mergedData2))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Sumarizing <- mergedData2 %>%
  group_by(Activity, ID) %>%
  summarise_all(mean)
write.table(Sumarizing, "Sumarizing.txt", row.name=FALSE)

str(Sumarizing)
