#Getting and Cleaning Data Code Book
***
This code book is for the output file `tidy_data.txt` which is produced upon successful execution of the R script `run_analysis.R`. It is used as a quick guide to reference information about the input data and transformation steps taken to produce the output file. A brief description about each variable found within the file is also provided in the variables section below.

For full details about the raw data used for this exercise and description of each transformation steps please refer to the [README.MD](https://github.com/madfuss/GettingAndCleaningData/blob/master/README.md) file which is also provided along with further support documentation.



###Input Data
***
The dataset, when extracted, contains the following raw files used as input data for this exercise:

* `README.txt:` Refer to this file for full details on the content of each file
* `features_info.txt:` Shows information about the variables used on the feature vector.
* `features.txt:` List of all features.
* `activity_labels.txt:` Links the class labels with their activity name.
* `train/X_train.txt:` Training set.
* `train/y_train.txt:` Training labels.
* `test/X_test.txt:` Test set.
* `test/y_test.txt:` Test labels.

A copy of the dataset can also be directly downloaded by clicking [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Further details on the dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).



###Transformation Steps
***
In achievement of creating a `tidy dataset` the following series of steps were implemented through execution of the R script `run_analysis.R:`

* `Step 1:` Creates a directory 'UCI HAR Dataset' in the current working directory, if not already created.

* `Step 2:` Downloads and extracts the raw data file (if it hasn't been downloaded already)

* `Step 3:` Builds the related data sets (training and testing) :
Calls the function `build_data_set()` which accepts raw input data files as arguments. The input files are read  into tables which are stored in variables which are then subsequently merged and transformed using the rbind function to create the final dataset. The function invokes the following:
The columns are given descriptive names by using the features dataset.
The associated activities are appended as a column from the activities dataset.
The associated activity labels are added from the activities label dataset
The associated subjects is subsequently added as a column from the activities dataset. The respective datasets are stored in the following variables:

 + training_data_set <- `build_data_set(...)`
 + testing_data_set <- `build_data_set(...)`



* `Step 4:` Merge the data sets, setting textual column headings where applicable :
Calls the function `merge_data_sets()` which accepts the training and testing datasets as arguments and returns the result of a merged dataset using the rbind() function.

* `Step 5:` Extract the mean and standard deviation variables :
Calls the funtion `extract_mean_and_std_columns()` which accepts a merged dataset as argument and extracts all the variables related to mean and standard deviation, returning the subsetted dataset.

* `Step 6:` Calculate the mean across all features per subject per activity :
Calls the function `calculate_mean_data()` which accepts the result of `extract_mean_and_std_columns()` as argument, and groups all the subjects by the activities together, calculating a mean across all variables, and return this dataset.

* `Step 7:` Write the resulting dataset to a file named `tidy_data.txt`


*N.B Further in-line comments are provided within the R script `run_analysis.R`*



###Output Data
***
The output file [tidy_data.txt](https://github.com/madfuss/GettingAndCleaningData/blob/master/tidy_data.txt) dataset includes the mean and standard deviation of the underlined variables for each  of the 30 volunteers who all performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The final output file contains a total of 60 variables/columns and 180 observations/rows



###Variables
***
A total of 69 variable are contained within the `tidy_data.txt` file. 

N.B '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
The features selected come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ, where (prefix 't' to denote time)

The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).


Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)


For easy reference the same variable names were retained from the raw file `features.txt`. The following outlines the variable names and brief description of what each variable represents. *The units of measurement are radians/second.*

1. subject 2
 + Each number between 1 - 30 represents the identifier for each volunteer used within the sample
  + Numbers (2, 4, 9, 10, 12, 13, 18, 20, 24) - taken from the test dataset
  + Numbers (1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30) - taken from the train dataset
2. activity 1
 + 1 WALKING
 + 2 WALKING_UPSTAIRS
 + 3 WALKING_DOWNSTAIRS
 + 4 SITTING
 + 5 STANDING
 + 6 LAYING
3. activity_label : name of activity
4. tBodyAcc-mean()-X : time body acceleration mean value X
5. tBodyAcc-mean()-Y : time body acceleration mean value Y
6. tBodyAcc-mean()-Z : time body acceleration mean value Z
7. tBodyAcc-std()-X : time body acceleration standard deviation X
8. tBodyAcc-std()-Y : time body acceleration standard deviation Y
9. tBodyAcc-std()-Z : time body acceleration standard deviation Z
10. tGravityAcc-mean()-X : time gravity acceleration mean value X
11. tGravityAcc-mean()-Y : time gravity acceleration mean value Y
12. tGravityAcc-mean()-Z : time gravity acceleration mean value Z
13. tGravityAcc-std()-X : time gravity acceleration standard deviation X
14. tGravityAcc-std()-Y : time gravity acceleration standard deviation Y
15. tGravityAcc-std()-Z : time gravity acceleration standard deviation Z
16. tBodyAccJerk-mean()-X : time body acceleration jerk mean value X
17. tBodyAccJerk-mean()-Y : time body acceleration jerk mean value Y
18. tBodyAccJerk-mean()-Z : time body acceleration jerk mean value Z
19. tBodyAccJerk-std()-X : time body acceleration jerk standard deviation X
20. tBodyAccJerk-std()-Y : time body acceleration jerk standard deviation Y
21. tBodyAccJerk-std()-Z : time body acceleration jerk standard deviation Z
22. tBodyGyro-mean()-X : time body gyroscope mean value X
23. tBodyGyro-mean()-Y : time body gyroscope mean value Y
24. tBodyGyro-mean()-Z : time body gyroscope mean value Z
25. tBodyGyro-std()-X : time body gyroscope standard deviation X
26. tBodyGyro-std()-Y : time body gyroscope standard deviation Y
27. tBodyGyro-std()-Z : time body gyroscope standard deviation Z
28. tBodyGyroJerk-mean()-X : time body gyroscope jerk mean value X
29. tBodyGyroJerk-mean()-Y : time body gyroscope jerk mean value Y
30. tBodyGyroJerk-mean()-Z : time body gyroscope jerk mean value Z
31. tBodyGyroJerk-std()-X : time body gyroscope jerk standard deviation X
32. tBodyGyroJerk-std()-Y : time body gyroscope jerk standard deviation Y
33. tBodyGyroJerk-std()-Z : time body gyroscope jerk standard deviation Z
34. tBodyAccMag-mean() : time body acceleration magnitude mean value XYZ
35. tBodyAccMag-std() : time body acceleration magnitude standard deviation XYZ
36. tGravityAccMag-mean() : time gravity acceleration magnitude mean value XYZ
37. tGravityAccMag-std() : time gravity acceleration magnitude standard deviation XYZ
38. tBodyAccJerkMag-mean() : time body acceleration jerk magnitude mean value XYZ
39. tBodyAccJerkMag-std() : time body acceleration jerk magnitude standard deviation XYZ
40. tBodyGyroMag-mean() : time body gyroscope magnitude mean value XYZ
41. tBodyGyroMag-std() : time body gyroscope magnitude standard deviation XYZ
42. tBodyGyroJerkMag-mean() : time body gyroscope jerk magnitude mean value XYZ
43. tBodyGyroJerkMag-std() : time body gyroscope jerk magnitude standard deviation XYZ
44. fBodyAcc-mean()-X : frequency body acceleration mean value X
45. fBodyAcc-mean()-Y : frequency body acceleration mean value Y
46. fBodyAcc-mean()-Z : frequency body acceleration mean value Z
47. fBodyAcc-std()-X : frequency body acceleration standard deviation X
48. fBodyAcc-std()-Y : frequency body acceleration standard deviation Y
49. fBodyAcc-std()-Z : frequency body acceleration standard deviation Z
50. fBodyAccJerk-mean()-X : frequency body acceleration jerk mean value X
51. fBodyAccJerk-mean()-Y : frequency body acceleration jerk mean value Y
52. fBodyAccJerk-mean()-Z : frequency body acceleration jerk mean value Z
53. fBodyAccJerk-std()-X : frequency body acceleration jerk standard deviation X
54. fBodyAccJerk-std()-Y : frequency body acceleration jerk standard deviation Y
55. fBodyAccJerk-std()-Z : frequency body acceleration jerk standard deviation Z
56. fBodyGyro-mean()-X : frequency body gyroscope mean value X
57. fBodyGyro-mean()-Y : frequency body gyroscope mean value Y
58. fBodyGyro-mean()-Z : frequency body gyroscope mean value Z
59. fBodyGyro-std()-X : frequency body gyroscope standard deviation X
60. fBodyGyro-std()-Y : frequency body gyroscope standard deviation Y
61. fBodyGyro-std()-Z : frequency body gyroscope standard deviation Z
62. fBodyAccMag-mean() : frequency body acceleration magnitude mean value XYZ
63. fBodyAccMag-std() : frequency body acceleration magnitude standard deviation XYZ
64. fBodyBodyAccJerkMag-mean() : frequency body acceleration jerk magnitude mean value XYZ
65. fBodyBodyAccJerkMag-std() : frequency body acceleration jerk magnitude standard deviation XYZ
66. fBodyBodyGyroMag-mean() : frequency body gyroscope magnitude mean value XYZ
67. fBodyBodyGyroMag-std() : frequency body gyroscope magnitude standard deviation XYZ
68. fBodyBodyGyroJerkMag-mean() : frequency body gyroscope jerk magnitude mean value XYZ
69. fBodyBodyGyroJerkMag-std() : frequency body gyroscope jerk magnitude standard deviation XYZ
