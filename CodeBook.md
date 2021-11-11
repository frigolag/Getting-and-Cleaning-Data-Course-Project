# Data Introduction
This project will use six data: `x_train.txt`, `x_test.txt`, `y_train.txt`, `y_test.txt`, `subject_train.txt` and `subject_test.txt`, from the URI HAR Dataset.
`features.txt` contains the features from the dataset, which corresponds to each column of x_train.txt and x_test.txt. On the other hand, `y_train.txt`, `y_test.txt` contain the subject identififyer (1 to 30).
`activity_labels.txt` contains the type of activity performed when the corresponding measurements were taken, i.e. Walking, walking upstairs, sitting,standing, laying.
    
# Analysis
The R script `run_analysis.R` has the code that perfomrs the data manipulation with the following steps:

- Downloads the dataset if it does not already exist in the working directory.
- Unzips the files and loads them into R if they don't already exist in the wd.
- Merges the training and the test data sets to create one unique data set.
- Extracts only the measurements of the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set.
- Appropriately labels the data set with descriptive variable names.
- From the resulting data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Loads the resulting data into a file called `tidy_dataset.txt`. 

 # Resulting dataset 
 
 The tidy data produced contains 180 observations and 81 variables. The first column is the subject id, second column is the activity and the rest are the average of each feature variable.
