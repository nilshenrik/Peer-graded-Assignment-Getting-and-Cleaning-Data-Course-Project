

# 1.1 Downloads the data
temp <- tempfile()
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp, mode="wb")
list.files <- unzip(temp,list=TRUE)


# 1.2 Reads the tables
test.path<- list.files$Name[16:18]
unzip(temp, test.path)
test<-lapply(test.path, read.table)

train.path<- list.files$Name[30:32]
unzip(temp, train.path)
train<-lapply(train.path, read.table)

activity.path<-list.files$Name[1]
unzip(temp, activity.path)
activity<-read.table(activity.path)

colnames(activity)<-c("Activity", "ActivityType")

features.path<-list.files$Name[2]
unzip(temp, features.path)
features<-read.table(features.path)

# 1.3 Renames the columns
colnames(test[[1]])<-"Subject"
colnames(train[[1]])<-"Subject"

colnames(test[[3]])<-"Activity"
colnames(train[[3]])<-"Activity"

colnames(test[[2]])<-features[,2]
colnames(train[[2]])<-features[,2]

# 1.4 Merges the data into one data set
datatest<- cbind(test[[1]],test[[3]], test[[2]])
datatrain<- cbind(train[[1]],train[[3]], train[[2]])

data<- rbind(datatest, datatrain)


# 2.1 Extracts measurements on the mean and standard deviation for each measurement
data2<-data[grepl(paste(c("Subject", "Activity", "mean", "std"), collapse = "|"), names(data))]

# 3.1 Adds descriptive activity names to name the activities in the data set
data3<-merge(data2, activity,by='Activity',all.x=TRUE)

# 4.1 Appropriately labels the data set with descriptive variable names
names(data3)<-gsub("[[:punct:]]", "", names(data3))
names(data3)<-gsub("mean", "_MEAN_", names(data3))
names(data3)<-gsub("std", "_STD_", names(data3))
names(data3)<-gsub("^f", "Freq", names(data3))
names(data3)<-gsub("^t", "Time", names(data3))
names(data3)<-gsub("BodyBody", "Body", names(data3))


# 5.1 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
data4<- data3 %>% 
        group_by(Subject, Activity) %>%
        summarise_each(funs(mean))

# 5.2 Exports a textfile with the tidy data
write.table(data4, "tidydataset.txt", row.name=FALSE)      

