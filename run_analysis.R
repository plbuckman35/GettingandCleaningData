#Download data#
# Checking if archieve already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}


#####Create one R script called run_analysis.R that does the following######

#Merges the training and the test sets to create one data set:
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
testsubject <- rbind(subject_train, subject_test)
combineddata <- cbind(testsubject, Y, X)

#Extracts only the measurements on the mean and standard deviation for each measurement:
TidyData <- combindeddata %>% select(subject, code, contains("mean"), contains("std"))

#Uses descriptive activity names to name the activities in the data set:
activities <- read.table(file.path(targetFolder, 'activity_labels.txt'))
full_data[, 2] <- activities[full_data[,2], 2]

#Appropriately labels the data set with descriptive variable names:
names(subjects) <- "subject"
data.cleaned <- cbind(subjects, y, X)
write.table(data.cleaned, 
            file.path(current.wd, "merged_and_cleaned_dataset.txt"))

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject:
write.table(dataTable, "TidyData.txt", row.name=FALSE)




