
### Brief summary:
Here I describe the data and analysis steps that are used to create the final tidy 
data. 
My tidy data contains 180 rows (30 Subjects that performed 6 Activities each), and 68 
columns (Subject, Activity, and 66 feature means).

I did not use the Inertial Signal folder for this project.

### Processing steps:
The performed steps are listed in the following:

     1. download and unzip the file.
     2. reading the txt files in the 'test' and 'train' directories.       
     3. merging (rbind) the x_test and x_train txt files according to their dimensions
     4. adding subject and activity IDs
     5. use descriptive activity names to name the activity numbers in the data
     6. extracting only measurements on the mean and std for each measurement
           (I only chose those variables with mean() and std() in their name, 
            so each are 33 (ignoring e.g. gravityMean and meanFreq). 
     7. calculating the mean of each measurement, for each activity for each subject
     8. writing the final tidy data in a separate file: tidy_data.txt

### Variables:

The 68 variables are listed below:

1. subject and activity,

* subject, the numeric ID of the 30 test subjects
* activity, the 6 activity ID 

2. and the Measurements (66 means):
        
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y    
* tGravityAcc-mean()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y 
* tBodyGyro-mean()-Z
* tBodyGyroJerk-mean()-X  
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyAccMag-mean()
* tGravityAccMag-mean()
* tBodyAccJerkMag-mean()
* tBodyGyroMag-mean()
* tBodyGyroJerkMag-mean()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y   
* fBodyAcc-mean()-Z      
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y   
* fBodyAccJerk-mean()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y  
* fBodyGyro-mean()-Z
* fBodyAccMag-mean()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroJerkMag-mean()
* tBodyAcc-std()-X
* tBodyAcc-std()-Y     
* tBodyAcc-std()-Z          
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z      
* tBodyAccJerk-std()-X 
* tBodyAccJerk-std()-Y 
* tBodyAccJerk-std()-Z   
* tBodyGyro-std()-X 
* tBodyGyro-std()-Y 
* tBodyGyro-std()-Z         
* tBodyGyroJerk-std()-X 
* tBodyGyroJerk-std()-Y 
* tBodyGyroJerk-std()-Z     
* tBodyAccMag-std()    
* tGravityAccMag-std()
* tBodyAccJerkMag-std()    
* tBodyGyroMag-std() 
* tBodyGyroJerkMag-std() 
* fBodyAcc-std()-X         
* fBodyAcc-std()-Y   
* fBodyAcc-std()-Z      
* fBodyAccJerk-std()-X      
* fBodyAccJerk-std()-Y 
* fBodyAccJerk-std()-Z 
* fBodyGyro-std()-X         
* fBodyGyro-std()-Y 
* fBodyGyro-std()-Z 
* fBodyAccMag-std()      
* fBodyBodyAccJerkMag-std() 
* fBodyBodyGyroMag-std() 
* fBodyBodyGyroJerkMag-std()
