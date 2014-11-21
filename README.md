---
title: "Getting and Cleaning Data - Course Proeject"
author: "Rong Su"
date: "Friday, November 21, 2014"
output: html_document
---

The process to produce tidy data in the project follows these steps below.

Merges the training and the test sets to create one data set.
```{r}
#the following line is just an example to read data, NOT the full script, please refer to run_analysis.R

#test data
read.table("./data/UCI HAR Dataset/test/subject_test.txt")
....

#traing data
read.table("./data/UCI HAR Dataset/train/y_train.txt")
...
#using rbind to combine the data together
data<-rbind(traindata,testdata)
...
```

Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

```{r, echo=FALSE}
plot(cars)
```


