getcleanproject
===============

 Course Project of the Getting and Cleaning Data course describing run_analysis.R the script and the code book of the tidy data produced.
 
 
 run_analysis.R
 --------------
 Is the R script that got and cleaned up the required data as per the  
[Course Project](https://class.coursera.org/getdata-008/human_grading/index "See Course Project")

Basically the script comprises 5 steps which corresponds to the required steps to obtain the desired tidy data set. 

Step 1: Merges the training and the test sets to create one data set
First read the files into data frames, then column combine the activity and subject values. Then row combine the test and training data into a merged data frame.

Step 2: Extract only mean and std dev of each measurement
Select out the required columns from the merged data frame.

Step 3: Uses descriptive activity names to name the activities in the data set

Step 4: Appropriately labels the data set with descriptive variable names

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


