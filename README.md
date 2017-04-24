## Getting and Cleaning Data - Course Project

This repository contains the code (run_analysis.R) for creating a tidy data set, the README.md file, and CodeBook.md file.  The tidy data set was submitted via the Coursera site. 

### Background

The original data files are from Center of Machine Learning and Intelligent Systems. The project name is "Human Activity Recognition Using Smartphones Data Set". This is a project description from their web site.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Analysis Approach
The R script, run_analysis.R, creates a tidy data set via the following steps:

1. Load required libraries for the analysis; (reshape2, data.table)
2. Download and unzip files; (script puts files in a defined folder)
3. Read and name labels for activities and features; (begin organizing the data set structure)
4. Define the required data fields for analysis (mean and standard deviation); (prepare for pulling only the required data)
5. Read in the data; (use table.data and extracting only the required fields from step 4; create test file and training file)
6. Combine two files into 1 dataset
7. Create factors using activities and subjects
8. Create tidy data set using melt and dcast
9. View data set and create tidy data set file in txt format
 
### Reading the tidy data set
Use the following command to read back in the tidy dataset: tidy_file <- read.table("tidy.txt", header = TRUE).  This assumes the file name is tidy.txt
