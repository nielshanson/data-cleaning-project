# Codebook

This file describes the data summarization performend on the *Human Activity Recognition Using Smartphones Dataset (HAR USD)* and a description of the summarized features. Prior to the summarization below the original .zip archive was downloaded from: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]. For information on the original experiment can be found in the README.txt and features_info.txt files found within that achive.

## Data Summarization  

The script `run_analysis.R`, represents all data compiling and summarizing activies as laied out in the course project descritpion. Code comments describe each individual process in more detail, but `run_analysis.R` performs five general actions:

1. _Merges the training and the test sets to create one data set_ by loading the `X_.txt`, `y_.txt`, and `subject_.txt` files for both sets, as well as the `features.txt` file, and combines into two data frames `df_train` and `df_test` using the `cbind()` function. These are then combined into one data frame `df` using the `rbind()` function.

2. _Extracts only the measurements on the mean and standard deviation for each measurement_ variable by exploiting the `grep()` R function to only extract features containing the `mean()` and `sd()` text patterns for each measurement feature. A new data frame `df_mean_sd` containing only these feature columns is created.

3. _Use descriptive activity names to name the activities in the data set_ to replace the numerical 1-6 activity labels. The `row.names` feature of the `read.table()` function is used to map the numerical values to their text labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

4. _Appropriately label the data set with descriptive activity names_. This is done using the map desccribed in (3) to replace the number labels in the existing data frame.

5. _Creates a second, independent tidy data set with the average of each variable for each activity and each subject._ After creating a melted dataframe with the `melt()` function from the `reshape2` package, the `dcast()` function is then used summarize the average of each variable over each activity with the `subject_id*action_class ~ variable` formula, and the `mean` function. The `write.table()` function is then used to create a summarized tab-delimited dataset as `tidy_data_tsv.txt`.

Again, `run_analysis.R` script contains numerous additional comments with more details.

## Data Summarization

Here we give a short summary of all the variables in the `tidy_data_tsv.txt` file.

* `subject_id`: this ID corresponds to one the 30 voluneer experiment subjects, numbered 1-30.
* `action_class`: a contains a character string corresponding to the activity class subject was performing (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS). This was translated from the `activity_labels.txt` found in the original HAR USD dataset. Represent manual labeling of the original data trace.

In the following variable names, `mean()` and `std()` represent the original smarization taken in the HAR USD dataset on the original 3-axial linear acceleration and 3-axial angular velocity data traces. These were then summarized as an average by activity class for each subject experimental subject. A Fast Fourier Transform was  `f` denote the frequency domain while `t`

* `tBodyAcc-mean()-X,-Y,-Z`: an average of the mean body acceleration time domain values, as separated by a low pass Butterworth filter, by activity class in the X, Y, and Z, axes, respectively.
* `tBodyAcc-std()-X,-Y,-Z`: a standard deviation of the mean body acceleration time domain values, as separated by a low pass Butterworth filter, by activity class in the X, Y, and Z, axes, respectively.
* `tGravityAcc-mean()-X,-Y,-Z`: an average of the mean gravity acceleration time domain values, as separated by a low pass Butterworth filter, by activity class in the X, Y, and Z, axes, respectively.
* `tGravityAcc-std()-X,-Y,-Z`: an standard deviation of the mean gravity acceleration time domain values, as separated by a low pass Butterworth filter, by activity class in the X, Y, and Z, axes, respectively.

The same average summarization was simmilarly applied for the following variables:

* "tBodyAccJerk-mean()-X"      
* "tBodyAccJerk-mean()-Y"      
* "tBodyAccJerk-mean()-Z"      
* "tBodyAccJerk-std()-X"       
* "tBodyAccJerk-std()-Y"       
* "tBodyAccJerk-std()-Z"       
* "tBodyGyro-mean()-X"         
* "tBodyGyro-mean()-Y"         
* "tBodyGyro-mean()-Z"         
* "tBodyGyro-std()-X"          
* "tBodyGyro-std()-Y"          
* "tBodyGyro-std()-Z"          
* "tBodyGyroJerk-mean()-X"     
* "tBodyGyroJerk-mean()-Y"     
* "tBodyGyroJerk-mean()-Z"     
* "tBodyGyroJerk-std()-X"      
* "tBodyGyroJerk-std()-Y"      
* "tBodyGyroJerk-std()-Z"      
* "tBodyAccMag-mean()"         
* "tBodyAccMag-std()"          
* "tGravityAccMag-mean()"      
* "tGravityAccMag-std()"       
* "tBodyAccJerkMag-mean()"     
* "tBodyAccJerkMag-std()"      
* "tBodyGyroMag-mean()"        
* "tBodyGyroMag-std()"         
* "tBodyGyroJerkMag-mean()"    
* "tBodyGyroJerkMag-std()"
* "fBodyAcc-mean()-X"          
* "fBodyAcc-mean()-Y"          
* "fBodyAcc-mean()-Z"          
* "fBodyAcc-std()-X"           
* "fBodyAcc-std()-Y"           
* "fBodyAcc-std()-Z"           
* "fBodyAccJerk-mean()-X"      
* "fBodyAccJerk-mean()-Y"      
* "fBodyAccJerk-mean()-Z"      
* "fBodyAccJerk-std()-X"       
* "fBodyAccJerk-std()-Y"       
* "fBodyAccJerk-std()-Z"       
* "fBodyGyro-mean()-X"         
* "fBodyGyro-mean()-Y"         
* "fBodyGyro-mean()-Z"         
* "fBodyGyro-std()-X"          
* "fBodyGyro-std()-Y"          
* "fBodyGyro-std()-Z"          
* "fBodyAccMag-mean()"         
* "fBodyAccMag-std()"          
* "fBodyBodyAccJerkMag-mean()" 
* "fBodyBodyAccJerkMag-std()"  
* "fBodyBodyGyroMag-mean()"    
* "fBodyBodyGyroMag-std()"     
* "fBodyBodyGyroJerkMag-mean()"
* "fBodyBodyGyroJerkMag-std()" 


