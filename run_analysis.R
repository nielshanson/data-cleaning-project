# run_analysis.r

# preliminaries, set working directory to the UCI HAR Dataset
setwd("~/Desktop/data_science/03_data_clean/assignment/UCI\ HAR\ Dataset")

## 1. Merges the training and the test sets to create one data set.

# read in feature vector
features <- read.table("features.txt")

# read in files associated with training set
setwd("train/")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

# combine columns into training data frame df_train
df_train <- cbind(subject_train, rep("train", length(subject_train)), y_train, X_train)
# set more meaningful headings
colnames(df_train) <- c("subject_id", "validation", "action_class", as.vector(mode="character",features[,2]))

# read in files associated with test set
setwd("../test/")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

# combine columns into training data frame df_test
df_test <- cbind(subject_test, rep("test", length(subject_test)), y_test, X_test)
# set more meaningful headings
colnames(df_test) <- c("subject_id", "validation", "action_class", as.vector(mode="character",features[,2]))

df <- rbind(df_train, df_test) # combine training and test data frames into one 


## 2. Extract only the measurements on the mean and standard deviation for each measurement.

feature_names <- names(df)[4:length(df)] # extract only feature variables
means <- grep("mean\\(\\)", ignore.case=1, feature_names) # find features with 'mean()' pattern
stds <- grep("std\\(\\)", ignore.case=1, feature_names) # find features with 'std()' pattern
mean_sd_indexes <- sort(as.vector(union(means,stds)))+3 # union and shift indices by 3
df_mean_sd <- df[,c(1:3, mean_sd_indexes) ] # create new data frame with specified indicies



## 3. Use descriptive activity names to name the activities in the data set

setwd("~/Desktop/data_science/03_data_clean/assignment/UCI\ HAR\ Dataset")
activity_labels <- read.table("activity_labels.txt", row.names=1) # read in activity_labels.txt file



## 4. Appropriately labels the data set with descriptive activity names.

df_mean_sd$action_class <- activity_labels[df_mean_sd$action_class,] # substiute activy number with label



## 5. Creates a second, independent tidy data set with the average of each variable for each activity 
##    and each subject.

library(reshape2) # load reshape2 library for melt() and dcast()

# melt and then dcast the mean for subject and action class by variable
df_mean_sd.m <- melt(df_mean_sd, id.vars=c("subject_id", "validation", "action_class"))
tidy_df <- dcast(df_mean_sd.m, subject_id*action_class ~ variable, mean)

# write out tidy_df in tab separated value format
write.table(tidy_df, file="tidy_data_tsv.txt", sep="\t", row.names=TRUE, col.names=TRUE)
