getcleanproject
===============

 Course Project of the Getting and Cleaning Data course describing run_analysis.R the script and the code book of the tidy data produced.
 
 
1. [run_analysis.R] (https://github.com/lawgoh/getcleanproject/blob/master/run_analysis.R "see R script")
--------------------------
 This is the R script that cleaned up the required data as per the Course Project requirements.Basically the script comprises 5 steps which corresponds to the required steps to obtain the desired tidy data set. 

Step 1: Merges the training and the test sets to create one data set

First read the files into data frames, then column combine the activity and subject values. Then row combine the test and training data into a merged data frame.

Step 2: Extract only mean and std dev of each measurement

Select out the required columns from the merged data frame.

Step 3: Uses descriptive activity names to name the activities in the data set

Factorise the values of the desired Activity column and label the levels accordingly.


Step 4: Appropriately labels the data set with descriptive variable names
List the names of the variables and assign as the column names.


Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
Use the reshape library and melt the activity and subject then calculate the mean. Write the file.

2. Code Book
----------------------
The column (variable) names of the tidy data set are:
> Activity Variable Subject-1 Subject-2 Subject-3 Subject-4 Subject-5 Subject-6 Subject-7 Subject-8 Subject-9 Subject-10 Subject-11 Subject-12 Subject-13 Subject-14 Subject-15 Subject-16 Subject-17 Subject-18 Subject-19 Subject-20 Subject-21 Subject-22 Subject-23 Subject-24 Subject-25 Subject-26 Subject-27 Subject-28 Subject-29 Subject-30

The first column describes the particular Activity and the specific Variable is desribed next followed by the mean values for Subject 1, Subject 2 and so on.




