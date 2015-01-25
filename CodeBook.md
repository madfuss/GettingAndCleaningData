#Getting and Cleaning Data Code Book
***
This code book is for the output file `tidy_data.txt` which is produced upon successful execution of the R script `run_analysis.R`. It is used as a quick guide to reference information about the input data and transformation steps taken to produce the output file. A brief description about each variable found within the file is also provided in the variables section below.

For full details about the raw data used for this exercise and description of each transformation steps please refer to the [README.MD] file which is also provided along with further support documentation.



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

* `Step 7:` Write the resulting dataset to a file named 'tidy_data.txt'
Write the resulting data set to a file named `tidy_data.txt`
Insert link to tiday_data.txt file


*N.B Further in-line comments are provided within the R script*
Insert link to script above



###Output Data
***
Provide link to file
The output file ./tidy_data.txt dataset includes the mean and standard deviation of the underlined variables for each  of the 30 volunteers who all performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The final output file contains a total of 60 variables/columns and 180 observations/rows



###Variables
***
A total of 69 variable are contained within the 'tidy_data.txt' file. The following outlines the variable names and brief description of what each variable represents.
N.B '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions

1. `subject` 2
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
3. activity_label
4. tBodyAcc-mean()-X : total body acceleration mean X
5. tBodyAcc-mean()-Y
6. tBodyAcc-mean()-Z
7. tBodyAcc-std()-X : total body acceleration standard deviation X
8. tBodyAcc-std()-Y
9. tBodyAcc-std()-Z
10. tGravityAcc-mean()-X : total gravity acceleration mean value X
11. tGravityAcc-mean()-Y : total gravity acceleration mean
12. tGravityAcc-mean()-Z
13. tGravityAcc-std()-X : total gravity acceleration standard deviation value 
14. tGravityAcc-std()-Y
15. tGravityAcc-std()-Z
16. tBodyAccJerk-mean()-X : total body acceleration jerk mean value
17. tBodyAccJerk-mean()-Y
18. tBodyAccJerk-mean()-Z
19. tBodyAccJerk-std()-X : total body acceleration jerk standard deviation value
20. tBodyAccJerk-std()-Y
21. tBodyAccJerk-std()-Z
22. tBodyGyro-mean()-X : total body gyroscope mean value
23. tBodyGyro-mean()-Y
24. tBodyGyro-mean()-Z
25. tBodyGyro-std()-X
26. tBodyGyro-std()-Y
27. tBodyGyro-std()-Z
28. tBodyGyroJerk-mean()-X : total body gyroscope jerk mean value
29. tBodyGyroJerk-mean()-Y
30. tBodyGyroJerk-mean()-Z
31. tBodyGyroJerk-std()-X : total body gyroscope jerk standard deviation value
32. tBodyGyroJerk-std()-Y
33. tBodyGyroJerk-std()-Z
34. tBodyAccMag-mean() 
35. tBodyAccMag-std()
36. tGravityAccMag-mean()
37. tGravityAccMag-std()
38. tBodyAccJerkMag-mean()
39. tBodyAccJerkMag-std()
40. tBodyGyroMag-mean()
41. tBodyGyroMag-std()
42. tBodyGyroJerkMag-mean()
43. tBodyGyroJerkMag-std()
44. fBodyAcc-mean()-X : frequency 
45. fBodyAcc-mean()-Y
46. fBodyAcc-mean()-Z
47. fBodyAcc-std()-X
48. fBodyAcc-std()-Y
49. fBodyAcc-std()-Z
50. fBodyAccJerk-mean()-X
51. fBodyAccJerk-mean()-Y
52. fBodyAccJerk-mean()-Z
53. fBodyAccJerk-std()-X
54. fBodyAccJerk-std()-Y
55. fBodyAccJerk-std()-Z
56. fBodyGyro-mean()-X
57. fBodyGyro-mean()-Y
58. fBodyGyro-mean()-Z
59. fBodyGyro-std()-X
60. fBodyGyro-std()-Y
61. fBodyGyro-std()-Z
62. fBodyAccMag-mean()
63. fBodyAccMag-std()
64. fBodyBodyAccJerkMag-mean()
65. fBodyBodyAccJerkMag-std()
66. fBodyBodyGyroMag-mean()
67. fBodyBodyGyroMag-std()
68. fBodyBodyGyroJerkMag-mean()
69. fBodyBodyGyroJerkMag-std()
