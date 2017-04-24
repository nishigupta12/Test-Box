## Step 1 - Load required libraries
library(reshape2)
library(data.table)

## Step 2 - Download and unzip files
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

## Step 3 - Read and name labels for activities and features
activity_labels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')
activity_labels[,2] <- as.character(activity_labels[,2])
features <- read.table('./data/UCI HAR Dataset/features.txt')
features[,2] <- as.character(features[,2])

## Step 4 - Define the required data fields for analysis (mean and standard deviation)
RequiredFields <- grep(".*mean.*|.*std.*", features[,2])
RequiredFields.names <- features[RequiredFields,2]
RequiredFields.names = gsub('-mean', 'Mean', RequiredFields.names)
RequiredFields.names = gsub('-std', 'Std', RequiredFields.names)
RequiredFields.names <- gsub('[-()]', '', RequiredFields.names)

## Step 5 - Read in the data
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt") [RequiredFields]
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
train_file <- cbind(subject_train,y_train,x_train)

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt") [RequiredFields]
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
test_file <- cbind(subject_test,y_test,x_test)

## Step 6 - Combine files into 1 data set
TotalData <- rbind(train_file, test_file)
colnames(TotalData) <- c("subject", "activity", RequiredFields.names)

## Step 7 - Create factors using activities and subjects
TotalData$activity <- factor(TotalData$activity, levels = activity_labels[,1], labels = activity_labels[,2])
TotalData$subject <- as.factor(TotalData$subject)

## Step 8 - Create tidy data set 
TotalData_melted <- melt(TotalData, id = c("subject", "activity"))
TotalData_tidy <- dcast(TotalData_melted, subject + activity ~ variable, mean)

## Step 9 - View data set and create tidy data set file in txt format
View(TotalData_tidy)
write.table(TotalData_tidy, file = "tidy.txt", row.names = FALSE)


