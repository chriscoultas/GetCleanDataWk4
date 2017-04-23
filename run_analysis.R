##STEP 0
if (!require("pacman")) install.packages("pacman")
p_load(dplyr, downloader)

##STEP 1
#Downloads and unzips the data
setwd("/")
if(!file.exists("data.zip")){
	dir.create("data.zip")
}
setwd("./data.zip")

download("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",dest="./data.zip",mode="wb")
unzip("data.zip")
setwd("/data.zip/UCI HAR Dataset")

##STEP 2
#Creates Training (X_train) and Test (X_test) data frames
#Where (Features) represents ColNames for data frames

features<-read.table("./features.txt")

#TRAINING
train<-read.table("./train/X_train.txt")
colnames(train)<-features$V2
subject_train<-read.table("./train/subject_train.txt")
colnames(subject_train)<-"SubjectID"
trainactivity<-read.table("./train/Y_train.txt")
colnames(trainactivity)<-"Activity"
train<-cbind(subject_train,trainactivity,train)

#TEST
test<-read.table("./test/X_test.txt")
colnames(test)<-features$V2
subject_test<-read.table("./test/subject_test.txt")
colnames(subject_test)<-"SubjectID"
testactivity<-read.table("./test/Y_test.txt")
colnames(testactivity)<-"Activity"
test<-cbind(subject_test,testactivity,test)

##STEP 3
#Merges the training and the test sets to create one data set

merge_data<-rbind(train,test)

##STEP 4
#Extracts only the measurements on the mean and standard deviation for 
each measurement

no_dups<-merge_data[,!duplicated(colnames(merge_data))]
pare_mean<-cbind(no_dups$SubjectID,no_dups$Activity,select(no_dups,contains("mean")))
pare_mean<-select(pare_mean,-contains("Freq"))
pare_std<-select(no_dups,contains("std"))
pare_MSD<-cbind(pare_mean,pare_std)
colnames(pare_MSD)[1:2]<-c("SubjectID","Activity")

##STEP 5
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names

ActivityLabel<-recode(pare_MSD$Activity,'1'="walking",'2'="walking_upstairs",'3'="walking_downstairs",
	'4'="sitting",'5'="standing",'6'="laying")
pare_MSD<-cbind(ActivityLabel,select(pare_MSD,-Activity))

##STEP 6
#From the data set in step 4, creates a second, independent tidy data 
set with the average of each variable for each activity and each subject

pare1<-filter(pare_MSD,ActivityLabel=="walking")
pare2<-filter(pare_MSD,ActivityLabel=="walking_upstairs")
pare3<-filter(pare_MSD,ActivityLabel=="walking_downstairs")
pare4<-filter(pare_MSD,ActivityLabel=="sitting")
pare5<-filter(pare_MSD,ActivityLabel=="standing")
pare6<-filter(pare_MSD,ActivityLabel=="laying")

pare1agg<-aggregate(pare1,list(pare1$SubjectID),mean)
colnames(pare1agg)<-paste("mean",colnames(pare1agg),"walk",sep=".")
pare2agg<-aggregate(pare2,list(pare2$SubjectID),mean)
colnames(pare2agg)<-paste("mean",colnames(pare2agg),"walkup",sep=".")
pare3agg<-aggregate(pare3,list(pare3$SubjectID),mean)
colnames(pare3agg)<-paste("mean",colnames(pare3agg),"walkdown",sep=".")
pare4agg<-aggregate(pare4,list(pare4$SubjectID),mean)
colnames(pare4agg)<-paste("mean",colnames(pare4agg),"sit",sep=".")
pare5agg<-aggregate(pare5,list(pare5$SubjectID),mean)
colnames(pare5agg)<-paste("mean",colnames(pare5agg),"stand",sep=".")
pare6agg<-aggregate(pare6,list(pare6$SubjectID),mean)
colnames(pare6agg)<-paste("mean",colnames(pare6agg),"lay",sep=".")

aggdata<-cbind(pare1agg,pare2agg,pare3agg,pare4agg,pare5agg,pare6agg)
aggdata2<-aggdata %>% select(-contains("Group")) %>% select(-contains("Subject")) %>% select(-contains("Activity"))
SubjectID<-c(1:30)
aggdata2<-cbind(SubjectID,aggdata2)

write.table(aggdata2,"../aggdata.txt",sep="\t",row.names=FALSE)


