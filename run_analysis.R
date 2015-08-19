
#Read and load the data.
features <- read.table(".//features.txt", header=FALSE, sep="")
names(features) <- c("ID", "Name")

activities <- read.table(".//activity_labels.txt", header=FALSE, sep="")
names(activities) <- c("ID", "Name")


train.measurements <- read.table(".//train//X_train.txt", header=FALSE, sep="")
train.activities <- read.table(".//train//y_train.txt", header=FALSE, sep="" )
train.subjects <- read.table(".//train//subject_train.txt", header=FALSE, sep="" )
names(train.measurements) <- features$Name
names(train.activities)=c("Activity")
names(train.subjects)=c("Subject")


test.measurements <- read.table(".//test//X_test.txt", header=FALSE, sep="")
test.activities <- read.table(".//test//y_test.txt", header=FALSE, sep="" )
test.subjects <- read.table(".//test//subject_test.txt", header=FALSE, sep="" )
names(test.measurements) <- features$Name
names(test.activities)=c("Activity")
names(test.subjects)=c("Subject")


train.measurements <- cbind(train.subjects, train.activities, train.measurements)
test.measurements <- cbind(test.subjects, test.activities, test.measurements)

# Merges the training and the test sets to create one data set.
total.data <- rbind(train.measurements, test.measurements)
str(total.data)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
colNames <- c("Subject", "Activity", as.character(features$Name[grep("mean\\(\\)|std\\(\\)", features$Name)]))
featuresmeanstd.measurements <- subset(total.data, select=colNames)
str(featuresmeanstd.measurements)

# Uses descriptive activity names to name the activities in the data set
total.data$Activity=as.character(total.data$Activity)
for (i in 1:6){
  total.data$Activity[total.data$Activity == i] <- as.character(activities$Name[i])
}
total.data$Activity <- as.factor(total.data$Activity)
str(total.data$Activity)


# Appropriately labels the data set with descriptive variable names. 
names(total.data)<-gsub("^t", "time", names(total.data))
names(total.data)<-gsub("^f", "frequency", names(total.data))
names(total.data)<-gsub("Acc", "Accelerometer", names(total.data))
names(total.data)<-gsub("Gyro", "Gyroscope", names(total.data))
names(total.data)<-gsub("Mag", "Magnitude", names(total.data))
names(total.data)<-gsub("BodyBody", "Body", names(total.data))
names(total.data)<-gsub("tBody", "body", names(total.data))
colnames(total.data)

# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy.data <- aggregate(. ~ Activity + Subject, data=total.data, FUN=mean)
library(plyr)
arrange(tidy.data, Activity, Subject)

# Write tidy data to a file
write.table(tidy.data, file = ".//Tidy.txt", row.names = FALSE)


