This is the code book corresponding to the run_analysis.R script.

#Read and load the data.
Data has been extracted from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  and kept in the same folder as run_analysis.R.

Data is loaded into from the following files:
  features.txt
train/train.txt
train/y_train.txt
train/subject_train.txt
test/test.txt
test/y_test.txt
test/subject_test.txt

# Merges the training and the test sets to create one data set.
The training and test data is merged into a single data set 'total.data'.

# Extracts only the measurements on the mean and standard deviation for each measurement. 
The mean and standard deviation for each measurement is extracted into a new data frame 'featuresmeanstd.measurements'.

# Uses descriptive activity names to name the activities in the data set
The values of the 'Activity' column are replaced with the descriptive names of the activities.

# Appropriately labels the data set with descriptive variable names. 
Certain column names in 'total.data' are renamed to make them more descriptive.

# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
A new data set 'tidy.data' is created that shows the 'mean' of each measurement for each activity+subject combination.  The data in 'tidy.data' has been sorted by "Activity", and then by "Subject".

# Write tidy data to a file
The 'tidy.data' data is written into a text file.


