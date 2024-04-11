
# =================
# Project Overview
# =================
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.


# 0. Unzip the data and load necessary packages

unzip("getdata_projectfiles_UCI HAR Dataset.zip")

library(dplyr)
library(data.table)

# 1. Merges the training and test sets

features <- read.table("UCI HAR Dataset/features.txt")
activity <- read.table("UCI HAR Dataset/activity_labels.txt")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
X <- rbind(X_train, X_test)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
y <- rbind(y_train, y_test)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
subject <- rbind(subject_train, subject_test)

# 2. Extract only mean and standard deviation

idx_meanstd <- grep("mean\\(\\)|std\\(\\)", features[,2])
X <- X[, idx_meanstd]

# 3. Uses descriptive activity names to name the activities

y[,1] <- activity[y[,1],2]

# 4. Appropriately labels the data set with descriptive variable names

names(X) <- features[idx_meanstd, 2]
names(y) <- "activity"
names(subject) <- "subject"

clean <- cbind(subject, X, y)

# 5. Creates a second, independent tidy data set

clean <- data.table(clean)
tidy <- clean[, lapply(.SD, mean), by="subject,activity"]

write.table(tidy, file="tidy.txt", row.names=FALSE)




