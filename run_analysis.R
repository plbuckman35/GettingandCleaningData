#Create one R script called run_analysis.R that does the following.

#Merges the training and the test sets to create one data set.
data.all <- rbind(data.train, data.test)

#Extracts only the measurements on the mean and standard deviation for each measurement.
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

#Uses descriptive activity names to name the activities in the data set

#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
