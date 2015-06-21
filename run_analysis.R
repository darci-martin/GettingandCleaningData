# Load files into R
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("ActivityID","Activity"))
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#1. Merge the training and test sets to create one data set.
# Binding sensor data by data type
dataSubject <- rbind(subject_train,subject_test)
dataActivity <- rbind(y_train,y_test)
dataFeatures <- rbind(x_train,x_test)
#Label columns
names(dataSubject) <- c("Subject")
names(dataActivity) <- c("ActivityID")
names(dataFeatures) <- features$V2
#Merge all columns
Data <- cbind(dataFeatures,dataSubject,dataActivity)
#2.Extract only measurements on mean and standard deviation for each measurement.
Data_MeanStd <- Data[,grep("mean|std|Subject|Activity",names(Data))]
#3.Use descriptive activity names to name the activities in the data set.
Data_MeanStd_Activity = merge(Data_MeanStd,activity_labels,by.x="ActivityID",by.y="ActivityID",all=TRUE)
#4.Appropriately labels the data set with descriptive variable names.
names(Data_MeanStd_Activity) <- gsub("^t","Time",names(Data_MeanStd_Activity))
names(Data_MeanStd_Activity) <- gsub("^f","Frequency",names(Data_MeanStd_Activity))
names(Data_MeanStd_Activity) <- gsub("Acc","Accelerometer",names(Data_MeanStd_Activity))
names(Data_MeanStd_Activity) <- gsub("Gyro","Gyroscope",names(Data_MeanStd_Activity))
names(Data_MeanStd_Activity) <- gsub("Mag","Magnitude",names(Data_MeanStd_Activity))
#5.Create a second tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
Data_Grouped <- group_by(Data_MeanStd_Activity,Subject,Activity)
Summary_Data <- summarise_each(Data_Grouped,funs(mean))
#Save the tidy data set to the working directory
write.table(Summary_Data,file="tidydata.txt",row.names=FALSE)