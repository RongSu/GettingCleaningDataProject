setwd("~/GettingandCleaningData")
if (!file.exists("data")){dir.create("data")}
##read test data
data<-scan("./data/UCI HAR Dataset/test/X_test.txt",strip.white=TRUE)
n=length(data)/561
data<-matrix(data,nrow=n,ncol=561,byrow=T)
subjid<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
activity<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
data<-cbind(subjid,activity,data)
testdata<-data.frame(data)


#read train data
data<-scan("./UCI HAR Dataset/train/X_train.txt",strip.white=TRUE)
n=length(data)/561
data<-matrix(data,nrow=n,ncol=561,byrow=T)
subjid<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
activity<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
data<-cbind(subjid,activity,data)
traindata<-data.frame(data)

#Step 1: Merges the training and the test sets to create one data set 
data<-rbind(traindata,testdata)
#get feature names from featurex.txt
colnames<-read.table("./data/UCI HAR Dataset/features.txt",sep="")
colnames<-colnames[,2]
colnames<-as.character(colnames)
colnames<-c("subjid","activity",colnames)
names(data)<-colnames

#step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
data<-data[,c(1,2,grep("mean",colnames),grep("std",colnames))]

#Step 3: Uses descriptive activity names to name the activities in the data set
act_label<-read.table("./data/UCI HAR Dataset/activity_labels.txt")
#Step 4: Appropriately labels the data set with descriptive variable names. 
names(act_label)<-c("label","activity")
data$activity<-factor(data$activity,labels=act_label$activity,levels=act_label$label)

write.table(data, file = "dataset.txt",row.name=FALSE)



#creat data2 as independent tidy data set with the average of each variable for each 
#activity and each subject.
tmp<-interaction(data$subjid,data$activity)
#length(tmp)
s <- split(data,tmp)
data2<-sapply(s,function(x) colMeans(x[,3:81]))
data2.T <- t(data2[,1:ncol(data2)])
nametmp<-rownames(data2.T)
subjid<-gsub("[^0-9*]","",nametmp)
subjid<-as.numeric(subjid)
activity<-gsub("[0-9*.]","",nametmp)
activity
subjid
data2.T<-data.frame(subjid,activity,data2.T)
write.table(data2.T, file = "seconddataset.txt",row.name=FALSE)

