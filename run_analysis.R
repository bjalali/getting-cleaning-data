### Getting and Cleaning Data, project assignment 
### B. Jalali, August 2015


# Brief summary:
# My final tidy data contains 180 rows (30 Subjects that performed 6 Activities each)
# and 68 columns (Subject, Activity, 66 feature means)


f<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(f, destfile ="./activity.zip", method="curl", mode="wb")
# I manually unzipped the above downloaded file!

# Do we need the inertial folder, Short answer: no. 
xtest  <- read.table("./UCI HAR Dataset/test/X_test.txt") # 2947  561
ytest  <- read.table("./UCI HAR Dataset/test/y_test.txt") # 2947    1
subjectest <-  read.table("./UCI HAR Dataset/test/subject_test.txt") # 2947   1
#Each row identifies the subject who did the activity for each window sample. ranges from 1 to 30. 

xtrain  <- read.table("./UCI HAR Dataset/train/X_train.txt") # 7352  561
ytrain  <- read.table("./UCI HAR Dataset/train/y_train.txt") # 7352    1
subjectrain <- read.table("./UCI HAR Dataset/train/subject_train.txt") # 7352  1

activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt") # 6  2

features <- read.table("./UCI HAR Dataset/features.txt") # 561   2 
#head(features) 

names(xtrain) <- features$V2  # View(xtrain)
names(xtest) <- features$V2 

### from the dim and row counts, how to finalise xtest and xtrain data: 
xtest$activitynumber <- ytest$V1 
xtest$subject <- subjectest$V1; dim(xtest) # 2947  563

xtrain$activitynumber <- ytrain$V1 
xtrain$subject <- subjectrain$V1; dim(xtrain) # 7352  563 


### Step 1. merge or rbind test and train data

length(names(xtest) %in% names(xtrain)) # 563
newdf <- rbind(xtest, xtrain)           # 10299   563
sum(is.na(newdf)) # 0 NAs, as in xtest and xtrain case.

### Step 2. Extracts only measurements on mean and std for each measurement

# I chose only those with mean() and std() in their name, 
# each are 33 (ignoring e.g. gravityMean and meanFreq() ). 
length(grep("*std()*", names(newdf))) # 33
std1 <- grep("*std()*", names(newdf), value=TRUE) 
# exact search for mean() anywhere in the name 
length(grep("\\bmean()\\b", names(newdf))) # 33  , ignore.case=F
mean1 <- grep("\\bmean()\\b", names(newdf), value=TRUE) 

mm <- c(mean1, std1, "activitynumber", "subject") # class(mm)
newdf2 <- newdf[mm] # 10299    68

### Step 3. Use descriptive activity names to name activities in the data

activityname <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING") 
newdf2$activitynumber <-  activityname[as.numeric(newdf2$activitynumber)]

### Step 4. take "good" names from the features.txt & apply them to the data
# I kept their original column names for now!!


### Step 5. Create a tidy data with the average of each variable for each activity and each subject

# Calculating the mean of each measurement for each activity for each subject 
molten <- melt(newdf2, id.vars=c("subject", "activitynumber"), measure.vars=c(1:66)) 
final_df <- dcast(molten, subject + activitynumber ~ variable, mean) # 180 68 

### Writing the final tidy data in a txt file:
write.table(final_df, file="tidy_dataset.txt", row.names = FALSE, quote = FALSE) 
