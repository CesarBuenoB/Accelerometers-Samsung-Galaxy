# Code Book

## About the Original Source

The original Data was extracted of [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). According to the athors (Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.), these signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

 - tBodyAcc-XYZ
 - tGravityAcc-XYZ
 - tBodyAccJerk-XYZ
 - tBodyGyro-XYZ
 - tBodyGyroJerk-XYZ
 - tBodyAccMag
 - tGravityAccMag
 - tBodyAccJerkMag
 - tBodyGyroMag
 - tBodyGyroJerkMag
 - fBodyAcc-XYZ
 - fBodyAccJerk-XYZ
 - fBodyGyro-XYZ
 - fBodyAccMag
 - fBodyAccJerkMag
 - fBodyGyroMag
 - fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

 - mean(): Mean value
 - std(): Standard deviation
 - mad(): Median absolute deviation 
 - max(): Largest value in array
 - min(): Smallest value in array
 - sma(): Signal magnitude area
 - energy(): Energy measure. Sum of the squares divided by the number of values. 
 - iqr(): Interquartile range 
 - entropy(): Signal entropy
 - arCoeff(): Autorregresion coefficients with Burg order equal to 4
 - correlation(): correlation coefficient between two signals
 - maxInds(): index of the frequency component with largest magnitude
 - meanFreq(): Weighted average of the frequency components to obtain a mean  -   - frequency
 - skewness(): skewness of the frequency domain signal 
 - kurtosis(): kurtosis of the frequency domain signal 
 - bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
 - angle(): Angle between to vectors.

This information is avaible on [features_info](https://github.com/CesarBuenoB/Accelerometers-Samsung-Galaxy/blob/master/Raw-Data/features_info.txt)


## The Procedure

The Script does the following:

 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation for each measurement.
 - Name the activities in the data set using descriptive names
 - Appropriately labels the data set with descriptive variable names.
 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In order to do this, the script has these parts:

####  Load libraries and Functions
 - Libraries: dplyr, tidyr
 - removeSpecialCharacters: Function that remove "(", ".", "-", ")" from a string
 
####  Read and Tidy headers 
 - Reads the headers from [features.txt](https://github.com/CesarBuenoB/Accelerometers-Samsung-Galaxy/blob/master/Raw-Data/features.txt)
 - Tidy the headers up by going to lowercase and removing special characters
 
####  Read Main Data  
 - Read the main data from [X_test.txt](https://github.com/CesarBuenoB/Accelerometers-Samsung-Galaxy/blob/master/Raw-Data/test/X_test.txt)
and [Y_test.txt](https://github.com/CesarBuenoB/Accelerometers-Samsung-Galaxy/blob/master/Raw-Data/test/Y_test.txt)
 - Merge both tables
 - Set the headers
 
####  Read and Attach Subject
 - Read the subject id's from [subject_test.txt](https://github.com/CesarBuenoB/Accelerometers-Samsung-Galaxy/blob/master/Raw-Data/test/subject_test.txt) and [subject_train.txt](https://github.com/CesarBuenoB/Accelerometers-Samsung-Galaxy/blob/master/Raw-Data/train/subject_train.txt)
 - Create a new variable with the subject  
 
####  Reading, Tidyng and Attaching Activity  
 - Read the activity from [y_test](https://github.com/CesarBuenoB/Accelerometers-Samsung-Galaxy/blob/master/Raw-Data/test/y_test.txt) and [x_train](https://github.com/CesarBuenoB/Accelerometers-Samsung-Galaxy/blob/master/Raw-Data/train/y_train.txt)
 - Rename the activities with descriptive labels
 - Tidy the activities up by going to lowercase and removing special characters
 - Create a new variable with the activities
 
####  Selecting Variables  
 - Select from data only from subject, activities and variables that contains contains means or standard desviations.
 - Create a new variable that indicates where the data come from (test or train)
 
####  Output  
 - Summarise the data by calculating the means of each variable and plotting by subject and activity
 - Write a table with the information: [tidydata.txt](https://github.com/CesarBuenoB/Accelerometers-Samsung-Galaxy/blob/master/tidydata.txt)

#### The Script is available at [run_analysis.R](https://github.com/jcombari/Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R)





