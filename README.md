# data-cleaning-project

## Data Overview
This codebook file describes all details associated with the downloading, cleaning, and summarization   of the *Human Activity Recognition Using Smartphones Dataset*. This dataset contains movent observations of a group of 30 volunteers (age 19-48 years), while performing six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), as measured by a Samsung Galaxy SII smartphone on their waist. Using the smartphone's embedded accelerometer and gyroscope, data was captured for 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video recorded and labeled manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

More details can be found at: <activityrecognition@smartlab.ws>

## Data Aquisition 

The data was downloaded as a compressed zip file from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data was extracted using the uniz `unzip` command with the following command on the unix command:
```
$ unzip getdata-projectfiles-UCI\ HAR\ Dataset.zip
```
this created the directory: "UCI HAR Dataset/" which contained the files `activity_labels.txt`, `features_info.txt`, `features.txt` ,`README.txt`, and the directories `train/` and `test/`, containing the training and test sets of the data, respectively. The `UCI HAR Dataset/` directory is used as a home directory for running the `run_analysis.R` script. More details on data summarization and variables can be found in the `CodeBook.md`.


