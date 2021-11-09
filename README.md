# Getting and Cleaning Data Course Project

This repository is for the Coursera "Getting and Cleaning Data" course project. 

The goal is to collect, clean and prepare a data set so that it can be used for later analysis.

The data for this project can be downloaded through the following link:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Files
- CodeBook.md. describes the variables, the data, and any work that are performed to clean up the data.
- Run_analysis.R contains the R script that does the following:

    Downloads the dataset if it does not already exist in the working directory
    Uzips files and loads them into R if they don't already exist in the wd.
    Merges the training and the test data sets to create one unique data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set.
    Appropriately labels the data set with descriptive variable names.
    From the resulting data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
- Tidy_dataset.txt is the end result from running the code on run_analysis.R script. 
