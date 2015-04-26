# Getting and Cleaning Data
## Course Project

Project requirement quoted as below:
"
You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive activity names.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
"
## Steps to run the code:
1. Have the data source extracted and ready a folder called ```UCI HAR Dataset```.
2. Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function in RStudio.
3. Run ```source("run_analysis.R")```, it will produce two new files ```DataSet1_Merged&Cleaned.txt``` and ```DataSet2_Averages.txt``` in your working directory. They come from requirement 4 and 5 respectively.
## Dependencies
Needs default R packages plus package ```plyr```.
```run_analysis.R``` file installs this package automatically, if it is missing.
