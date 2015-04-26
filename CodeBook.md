# CodeBook
## The data source
* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## User manual
1. Have the data source extracted and ready a folder called ```UCI HAR Dataset```.
2. Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function in RStudio.
3. Run ```source("run_analysis.R")```, it will produce two new files ```DataSet1_Merged&Cleaned.txt``` and ```DataSet2_Averages.txt``` in your working directory. They come from requirement 4 and 5 respectively.
## Implementation details
The script `run_analysis.R`performs the 5 steps described in the course project's requirement.
*First, datasets are merged using the `rbind()` function
*Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. Also column names are corrected by data from `features.txt`.
*Take the activity names and IDs from `activity_labels.txt` and change the column names accordingly.
*Final clean up of the column names, and use `cbind()` to combine all datasets into one. After this step, a merged and clean dataset is achieved and written as file `DataSet1_Merged&Cleaned.txt`.
*Lastly, create a new dataset with averages and write to file `DataSet2_Averages.txt`.
