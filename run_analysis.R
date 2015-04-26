# Step 0: Make sure required package is installed and used
if (!require("plyr")) {
  install.packages("plyr")
}
library(plyr)


# Step 1: Merge the training and test sets to create one data set

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
x_merged <- rbind(x_train, x_test)

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_merged <- rbind(y_train, y_test)

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_merged <- rbind(subject_train, subject_test)


# Step 2: Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("./UCI HAR Dataset/features.txt")
filter <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

x_merged <- x_merged[, filter]          # subsetting
names(x_merged) <- features[filter, 2]  # renaming


# Step 3: Use descriptive activity names to name the activities in the data set

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
#activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2]))) #optional?
y_merged[, 1] <- activities[y_merged[, 1], 2]
names(y_merged) <- "activity"


# Step 4: Appropriately label the data set with descriptive variable names

# Since datasets x and y's column names have been corrected in the previous steps
# here a cbind will be sufficient to create a merged clean dataset with correct column names
names(subject_merged) <- "subject"
all_merged <- cbind(x_merged, y_merged, subject_merged)
write.table(all_merged, "DataSet1_Merged&Cleaned.txt", row.name=FALSE)


# Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject

averages_data <- ddply(all_merged, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "DataSet2_Averages.txt", row.name=FALSE)