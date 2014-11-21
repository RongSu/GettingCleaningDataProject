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

Extracts only the measurements on the mean and standard deviation for each measurement. grep function is used to search for column names with mean and std.

```{r}
#the following line is just an example to read data, NOT the full script, please refer to run_analysis.R
data<-data[,c(1,2,grep("mean",colnames),grep("std",colnames))]
```

Uses descriptive activity names to name the activities in the data set. Descriptive names are loaded from features.txt and then assigned to the dataset.
```{r}
#the following line is just an example to read data, NOT the full script, please refer to run_analysis.R
colnames<-read.table("./data/UCI HAR Dataset/features.txt",sep="")
...
names(data)<-colnames
```
Appropriately labels the data set with descriptive variable names. Variable names are loaded from activity_labels file.
```{r}
#the following line is just an example to read data, NOT the full script, please refer to run_analysis.R
names(act_label)<-c("label","activity")
...
```
Then A second, independent tidy data set with the average of each variable for each activity and each subject will be created. Then the final dataset are written out as a txt file with row.name = FALSE option.
```{r}
#the following line is just an example to read data, NOT the full script, please refer to run_analysis.R
...
write.table(data2.T, file = "tidydataset.txt",row.name=FALSE)
```

