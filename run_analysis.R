#
# Get and Clean Data - Course Project (run_analysis.R)
# Written by Lawrence Goh (lawgoh@gmail.com)
#

# ---------------------------------------------------------------------------------------------------------
# Step 1: Merges the training and the test sets to create one data set
# ---------------------------------------------------------------------------------------------------------

# define file paths
setwd('W:/2014 Aug - Data Science Specialisation/R files/')
testfile<-'./UCI HAR Dataset/test/X_test.txt'
testactfile<-'./UCI HAR Dataset/test/y_test.txt'  # test activity 
testsubfile<-'./UCI HAR Dataset/test/subject_test.txt' # test subject

trainfile<-'./UCI HAR Dataset/train/X_train.txt'
trainactfile<-'./UCI HAR Dataset/train/y_train.txt'  # train activity 
trainsubfile<-'./UCI HAR Dataset/train/subject_train.txt' # train subject

# read into data frames
test.df<-read.table(testfile)
testact.df<-read.table(testactfile)
testsub.df<-read.table(testsubfile)
# column bind the activity and subject values
test.df <- cbind(test.df,testact.df)
test.df <- cbind(test.df,testsub.df)

train.df<-read.table(trainfile)
trainact.df<-read.table(trainactfile)
trainsub.df<-read.table(trainsubfile)
# column bind the activity and subject values
train.df <- cbind(train.df, trainact.df)
train.df <- cbind(train.df, trainsub.df)

# perform the merge
merged.df<-rbind(test.df,train.df)

# remove the initial objects, to conserve memory
rm(test.df)
rm(train.df)

# ---------------------------------------------------------------------------------------------------------
# Step 2: Extract only mean and std dev of each measurement
# ---------------------------------------------------------------------------------------------------------

# extract only mean and std dev of each measurement

interest<-c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429)
interest<-c(interest,503,504,516,517,529,530,542,543,562,563)

required.df<-merged.df[,interest]

# ---------------------------------------------------------------------------------------------------------
# Step 3: Uses descriptive activity names to name the activities in the data set
# ---------------------------------------------------------------------------------------------------------

# handle the factors for Activity and label the levels
required.df[,67] <- factor(required.df[,67])
levels(required.df[,67]) <- c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING')

# ---------------------------------------------------------------------------------------------------------
# Step 4: Appropriately labels the data set with descriptive variable names
# ---------------------------------------------------------------------------------------------------------

# set column names
newcolnames <- c('tBodyAcc-meanX','tBodyAcc-meanY','tBodyAcc-meanZ','tBodyAcc-stdX','tBodyAcc-stdY','tBodyAcc-stdZ')
newcolnames <- c(newcolnames, 'tGravityAcc-meanX','tGravityAcc-meanY','tGravityAcc-meanZ','tGravityAcc-stdX','tGravityAcc-stdY','tGravityAcc-stdZ')
newcolnames <- c(newcolnames, 'tBodyAccJerk-meanX','tBodyAccJerk-meanY','tBodyAccJerk-meanZ','tBodyAccJerk-stdX','tBodyAccJerk-stdY','tBodyAccJerk-stdZ')
newcolnames <- c(newcolnames, 'tBodyGyro-meanX','tBodyGyro-meanY','tBodyGyro-meanZ','tBodyGyro-stdX','tBodyGyro-stdY','tBodyGyro-stdZ')
newcolnames <- c(newcolnames, 'tBodyGyroJerk-meanX','tBodyGyroJerk-meanY','tBodyGyroJerk-meanZ','tBodyGyroJerk-stdX','tBodyGyroJerk-stdY','tBodyGyroJerk-stdZ')
newcolnames <- c(newcolnames, 'tBodyAccMag-mean','tBodyAccMag-std','tGravityAccMag-mean','tGravityAccMag-std','tBodyAccJerkMag-mean','tBodyAccJerkMag-std')
newcolnames <- c(newcolnames, 'tBodyGyroMag-mean','tBodyGyroMag-std','tBodyGyroJerkMag-mean','tBodyGyroJerkMag-std')
newcolnames <- c(newcolnames, 'fBodyAcc-meanX','fBodyAcc-meanY','fBodyAcc-meanZ','fBodyAcc-stdX','fBodyAcc-stdY','fBodyAcc-stdZ')
newcolnames <- c(newcolnames, 'fBodyAccJerk-meanX','fBodyAccJerk-meanY','fBodyAccJerk-meanZ','fBodyAccJerk-stdX','fBodyAccJerk-stdY','fBodyAccJerk-stdZ')
newcolnames <- c(newcolnames, 'fBodyGyro-meanX','fBodyGyro-meanY','fBodyGyro-meanZ','fBodyGyro-stdX','fBodyGyro-stdY','fBodyGyro-stdZ')
newcolnames <- c(newcolnames, 'fBodyAccMag-mean','fBodyAccMag-std','fBodyBodyAccJerkMag-mean','fBodyBodyAccJerkMag-std','fBodyBodyGyroMag-mean','fBodyBodyGyroMag-std') 
newcolnames <- c(newcolnames, 'fBodyBodyGyroJerkMag-mean','fBodyBodyGyroJerkMag-std','Activity','Subject')

# assign to the required data set
colnames(required.df) <- newcolnames

# ---------------------------------------------------------------------------------------------------------
# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
# ---------------------------------------------------------------------------------------------------------

# tidy portion, melt the two variables Activity , Subject then apply mean
library(reshape)
molten <- melt(required.df, id.vars=c('Activity','Subject'))
tidy.df <-cast(Activity + variable ~ Subject, data=molten, fun=mean)
df <- data.frame(A=rep('Subject',30), B=c(1:30))
df$C <- paste(df$A, df$B, sep='-')
colnames(tidy.df) <- c('Activity','Variable', df$C)

# write the tidy table out
writefile = './UCI HAR Dataset/tidy.txt'
write.table(tidy.df,writefile, row.names=F, quote=F)
