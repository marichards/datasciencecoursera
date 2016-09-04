## run_analysis.R
## 
########################################################################
##
## This script runs the analysis for the "Getting and Cleaning Data"
## course project on Coursera. It performs the following operations:
##
## 0. Downloads and reads the Samsung smartphone activity data
## 1. Merges the training and test data sets to create one data set
## 2. Extracts only the mean and standard deviation for each 
## measurement
## 3. Renames the activities in the dataset with descriptive names
## 4. Labels the data set appropriately with descriptive variable
## names
## 5. Uses the dataset from the end of step 4 to create a second, 
## independent tidy data set with the average of each variable for
## each activity and each subject
##
########################################################################


## Load in the plyr, dplyr, and reshape2 libraries
library(plyr); library(dplyr); library(reshape2)

## Download the Samsung smartphone activity data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Samsung_Dataset.zip")
##

## Access the zipped file with the unz() function and read into data frames with descriptive names
activityLabels <- read.table(unz("./Samsung_Dataset.zip","UCI HAR Dataset/activity_labels.txt"),
col.names = c("Label","Activity"))
## Description of features
allFeatures <- read.table(unz("./Samsung_Dataset.zip","UCI HAR Dataset/features.txt"),
col.names = c("Index","Feature"))
## Training Subject Data
trainingSubs <- read.table(unz("./Samsung_Dataset.zip","UCI HAR Dataset/train/subject_train.txt"),
col.names = c("Subject"))
## Test Subject Data
testSubs <- read.table(unz("./Samsung_Dataset.zip","UCI HAR Dataset/test/subject_test.txt"),
col.names = c("Subject"))
## Training Data Y (activity codes)
trainingY <- read.table(unz("./Samsung_Dataset.zip","UCI HAR Dataset/train/y_train.txt"),
col.names = c("Label"))
## Test Data Y (activity codes)
testY <- read.table(unz("./Samsung_Dataset.zip","UCI HAR Dataset/test/y_test.txt"),
col.names = c("Label"))


#### Label for the descriptive variable names during loading (STEP 4) ####
## Label Training Data X Using the Features
trainingX <- read.table(unz("./Samsung_Dataset.zip","UCI HAR Dataset/train/X_train.txt"),
col.names = allFeatures$Feature)
## Label Test Data X Using the Features
testX <- read.table(unz("./Samsung_Dataset.zip","UCI HAR Dataset/test/X_test.txt"),
col.names = allFeatures$Feature)


#### Merge the training and test data sets to create 1 data set (STEP 1) ####
## Note that their columns match exactly; this isn't a merge, it's just a row-bind
## Use the bind_rows function from dplyr
fullX <- bind_rows(trainingX,testX)

## Also merge the activity codes and subjects
fullY <- bind_rows(trainingY,testY)
fullSubs <- bind_rows(trainingSubs,testSubs)


#### Extract only the mean and standard deviation for each (STEP 2) ####
## First, pull out all features that end in "mean()" or "std()"
means_stds <- grep("(mean\\(\\))|(std\\(\\))",allFeatures$Feature)
## Then, select only these features
fullMeansStds <- select(fullX,means_stds)

#### Now add descriptive labels to name activities for each record (STEP 3) 
## This requires joining the activity labels with the Y data
codedActivities <- join(fullY,activityLabels,by="Label")
## Add the column of activities to the full dataset and the subjects
fullMeansStds <- mutate(fullMeansStds ,Activity = codedActivities$Activity,Subject = fullSubs$Subject) 


#### Create a 2nd, independent tidy data set with the average of each  ####
#### variable for each activity AND each subject (STEP 5)              ####

## Begin by melting the dataset, leaving Activity and Subject as IDs
meltedData <- melt(fullMeansStds,id = c("Activity","Subject"))
## Use dcast to find the mean of each variable for Activity and Subject combination
newDataset <- dcast(meltedData,Activity+Subject ~ variable,mean)
## Finally, print it to a file
write.table(newDataset, file = "./averageStats.txt", row.name=FALSE)