# CodeBook

## 1. Original Data

* features:
  + Data from *features.txt*.
  + Refers to the list of all features measured from the accelerometer/gyroscope.
* activity:
  + Data from *activity_labels.txt*.
  + Refers to the activities performed by the volunteers.
* X_train:
  + Data from *X_train.txt*.
  + Refers to the training data set.
* X_test
  + Data from *X_test.txt*.
  + Refers to the test data set.
* y_train
  + Data from *y_train.txt*.
  + Refers to the train label set.
* y_test
  + Data from *y_test.txt*.
  + Refers to the test label set.
* subject_train
  + Data from *subject_train.txt*.
  + Refers to the test data set.
* subject_test
  + Data from *subject_test.txt*.
  + Refers to the test data set.


## 2. Merged Data

* X
  + Data from merging *X_train* and *X_test*.
* y
  + Data from merging *y_train* and *y_test*.
* subject
  + Data from merging *subject_train* and *subject_test*.

## 3. Transformations

* Appropriately labels the data set with descriptive variable names.
  + y[,1] <- activity[y[,1],2]
* Appropriately labels the data set with descriptive variable names.
  + names(X) <- features[idx_meanstd, 2]
  + names(y) <- "activity"
  + names(subject) <- "subject"
* Merge the clean data.
  + clean <- cbind(subject, X, y)
* Creates a second, independent tidy data set.
  + clean <- data.table(clean)
  + tidy <- clean[, lapply(.SD, mean), by="subject,activity"]
  
  
  


