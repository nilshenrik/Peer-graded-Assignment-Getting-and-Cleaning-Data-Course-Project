---
title: "Code Book"
output: html_document
---

This is a code book for Peer-graded Assignment Getting and Cleaning Data Course Project.

# Data and variables

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Assignment
You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## About `run_analysis.R`; Step by Step. 

* 1.1 Downloads the data
* 1.2 Reads the tables
* 1.3 Renames the columns
* 1.4 Merges the data into one data set

* 2.1 Extracts measurements on the mean and standard deviation for each measurement

* 3.1 Adds descriptive activity names to name the activities in the data set

* 4.1 Appropriately labels the data set with descriptive variable names

* 5.1 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* 5.2 Exports a textfile with the tidy data













