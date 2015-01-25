---
title: "Getting and Cleaning Data Course Project"
date: "Monday, January 12, 2015"
output: html_document
---

##Getting and Cleaning Data Overview
***
This project demonstrates the ability to collect, work with, and clean a data set. The main objective is achieved by using raw data files to prepare a `tidy dataset` that can be used for later analysis.

A `tidy dataset` is presumed based on the following characteristics:

* Each variable measured forms a column.
* Each observation forms a row.
* Each type of observational unit forms a table.



###About The Raw Data
***
The Human Activity Recognition Using Smartphones Dataset [Version 1.0] provides data from experiments which have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed the following six activities wearing a smartphone (Samsung Galaxy S II) on the waist:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Data was captured using the smartphones' embedded accelerometer and gyroscope. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Upon executing the main R script of this project `run_analysis.R` the dataset files will be downloaded and extracted to the directory `UCI HAR Dataset` , if already not done, in the current working directory. A copy of the dataset can also be directly downloaded by clicking [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The dataset, when extracted, will contain the following raw files used as input data to construct a `tidy dataset`:

* `README.txt:` Refer to this file for full details on the content of each file
* `features_info.txt:` Shows information about the variables used on the feature vector.
* `features.txt:` List of all features.
* `activity_labels.txt:` Links the class labels with their activity name.
* `train/X_train.txt:` Training set.
* `train/y_train.txt:` Training labels.
* `test/X_test.txt:` Test set.
* `test/y_test.txt:` Test labels.

Further details on the dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).



###Expected Outcome
***
The expected outcome of this project measures against achievement of the follow:

1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the merged data set , creates a second, independent `tidy data set` with the average of each variable for each activity and each subject.
6. Creating a R script name `run_analysis.R` to implement objectives 1 - 5 as outlined above
7. Providing documentation and support files (readme.md and codebook.md)




###Instruction List
***
Please adhere to the following instructions and guidlines in order to successfully execute the script used in this project.

* Ideally a computer with 'R' installed, at least version 3.1.1
* Your computer should have at least 600 MB of free hard disc space
* Download the R script file [run_analysis.R](https://github.com/madfuss/GettingAndCleaningData/blob/master/run_analysis.R) to your current working directory
* Execute of the R script file `run_analysis.R`
* The input for the script is the raw data, which will be downloaded and extracted to a folder/directory `UCI HAR Dataset` withing your local working directory.
* The output is the processed, tidy data which will be written to a text file `tidy_data.txt` within your current working directory
* There are no parameters to the R script
* Upon execution of the R script `run_analysis.R` the first time, the script may take a few or as much as 10-15 minutes (depending on your internet connection) if the data files have not yet been downloaded and extracted to the directory `UCI HAR Dataset`
* Read the [codebook](https://github.com/madfuss/GettingAndCleaningData/blob/master/CodeBook.md) to see the steps taken in getting and cleaning the data



###Required R Packages
***
The following R packages are required, which can be downloaded from CRAN

1. [plyr package](http://cran.r-project.org/web/packages/plyr/index.html)
2. [dplyr package](http://cran.r-project.org/web/packages/dplyr/index.html)




###Files in this repository
***
The follow support files were produced in conjunction with the expected outcome of the project:

* `CodeBook.md:` describes the inputed raw data, the variables, and the transformations steps that was performed to clean up the data. 
* `A README.md:` (this document) describing the overview of project and clear outline of all steps taken in achieving the objectives.
* `run_analysis.R:` R script to transform raw data set into a tidy one



###References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012