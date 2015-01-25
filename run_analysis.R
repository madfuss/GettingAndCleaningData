# This R script uses a number of raw data files as input data and applies a series of inter dependent transformation steps 
# in order to extract the mean and standard deviation for 6 groups of activities which were performed by 30 individuals
# therby returning an output file(tidy_data.txt) as a 'tidy dataset'.
# The author used multiple functions to achieve each objective, and a function main() which invokes each dependent function call

# This is the main function which invokes other functions that perform the following:
# 1. Creates a directory 'UCI HAR Dataset' in the current working directory, if not already created.
# 2. Downloads and extracts the raw data file (if it hasn't been downloaded already)
# 3. Builds the related data sets (testing and training)
# 4. Merge the data sets, setting textual column headings where applicable
# 5. Extract the mean and standard deviation variables
# 6. Calculate a mean across all features per subject per activity
# 7. Write the resulting data set to a file named 'tidy_data.txt'

# The main/wrapper function which will be used to institute function calls to other independent functions
main <- function() {
        # Step 0: Load the required packages
        library(plyr)
        library(dplyr)
        
        # Step 1: Creates a directory 'UCI HAR Dataset' in the current working directory, if not already created.
        if (!file.exists("./UCI HAR Dataset")) {
                # create directory
                dir.create("./UCI HAR Dataset")
                
                # Step 2: Downloads and extract the raw data file 
                # download dataset
                message("The dataset will be downloaded and extracted to the folder [UCI HAR Dataset] and make take 10-15 mins depending or your connection.")
                fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                fileName <- "UCI HAR Dataset.zip"
                download.file(fileUrl, destfile=fileName)
                
                # unzip downloaded file
                unzip(fileName)           
        }#close if
        
        
        
        # Step 3: Builds the related data sets (Training and Testing )
   
        # Step 3.1 Training Dataset (70% of sample)
        # args: raw data files used to build data set
        training_data_set <- build_data_set("./UCI HAR Dataset/train/X_train.txt", "./UCI HAR Dataset/features.txt", "./UCI HAR Dataset/train/y_train.txt", "./UCI HAR Dataset/activity_labels.txt", "./UCI HAR Dataset/train/subject_train.txt")
        
        # Step 3.2 Testing Dataset (30% of sample)
        # args: raw data files used to build data set
        testing_data_set <- build_data_set("./UCI HAR Dataset/test/X_test.txt", "./UCI HAR Dataset/features.txt", "./UCI HAR Dataset/test/y_test.txt", "./UCI HAR Dataset/activity_labels.txt", "./UCI HAR Dataset/test/subject_test.txt")
        
        
        
        # Step 4: Merge the data sets, setting textual column headings where applicable
        # args: training_data_set, test_data_set
        merged_data <- merge_data_sets(training_data_set, testing_data_set)
        
        
        # Step 5: Extract the mean and standard deviation columns
        # args: merged train and test data sets, features data file
        extracted_data <- extract_mean_and_std_columns(merged_data)
        
        
        # Step 6: Calculate a mean across all features per subject per activity
        # args: extracted data set
        feat_activity_mean_data <- calculate_mean_data(extracted_data)
        
        
        # Step 7: Write the resulting data set to a file named 'tidy_data.txt'
        write.table(feat_activity_mean_data, "./tidy_data.txt",row.name=FALSE)
}#close main

# This function accepts file paths of raw data files (as arguments) used to construct a dataset 
build_data_set <- function(data_File, features_File, activities_File, activityLabels_File, subjects_File) {
        # Step1: Read the data
        data <- read.table(data_File)
        
        # Step2: Read the features file
        features <- read.table(features_File, col.names = c("feature_id", "feature"))
        
        # Step3: Assign column names to data file based on features file
        colnames(data) <- features$feature
        
        # Step4: Read the activities file
        activities <- read.table(activities_File, col.names = c("activity"))
        
        # Step5: Add activity class labels column to data
        data$activity <- as.factor(activities$activity)
        
        # Step6: Read the activity labels
        activity_labels <- read.table(activityLabels_File, col.names = c("activity", "activity_label"))
        
        # Step7: Add activity name labels column to data, join based on activity
        data_with_activity_labels <- join(x = data, y = activity_labels, by = "activity")
        
        # Step8: Read the subjects
        subjects <- read.table(subjects_File, col.names = c("subject"))
        
        # Step9: Convert subject to factor
        subjects$subject <- as.factor(subjects$subject)
        
        # Step10: Combine the subject and activity
        cbind(subjects, data_with_activity_labels)
}# close build_data_set


# This function merges two data sets (train, test)
merge_data_sets <- function(training_data_set, testing_data_set) {
        # row bind the two data sets 
        rbind(training_data_set, testing_data_set)
}# close merge_data_sets

# This function extracts only the measurements on the mean and standard
# deviation for each measurement and returns the filtered dataset
extract_mean_and_std_columns <- function(merged_data) {        
        # determine which columns contain "mean()" and "std()"
        mean_std_cols <- grepl("subject|activity|activity_label|mean\\(\\)|std\\(\\)", colnames(merged_data))
        
        # return subset based on mean and std columns
        merged_data[,mean_std_cols]
}# close extract_mean_and_std_columns


# This function takes a dataset, groups all the subjects and activities together, calculates the average of each variable and return a dataset
calculate_mean_data <- function(extracted_data) {
        ddply(extracted_data, .(subject, activity, activity_label), numcolwise(mean))
}# close calculate_mean_data

# invoke the main function
main()
        