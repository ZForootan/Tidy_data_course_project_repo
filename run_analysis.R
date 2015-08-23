## This Script downloads the Sumsung database and outputs two versions of Summarized 
## txt files. One with 66 variables, including all 
## "...mean()-X" , "...mean()-Y","...mean()-Z",
## "...std()-X","...std()-Y","...std()-Z" and one smaller including 18 variables
## just those with "...mean()", and "...std()" variable names. 
library(plyr)

# Check the existance of 'data' directory 
if(!file.exists("UCIdata"))
        dir.create("UCIdata")
# Check the existence of zip file
if(!file.exists("data/exdata-data-NEI_data.zip")) {
        # if not existing download and unzip the file from the web source
        setwd("UCIdata/")
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", method = "curl")
        system(paste("unzip", "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"))
        setwd("../")
}
#the following line makes a vector of feature variable names
var.names=read.table("UCIdata/UCI HAR Dataset/features.txt",sep = "")
var.names[,2]=as.character(var.names[,2])
# read the txt files for features of test and train datasets
train=read.table("UCIdata/UCI HAR Dataset/train/X_train.txt",sep = "")
test=read.table("UCIdata/UCI HAR Dataset/test/X_test.txt",sep = "")
# Following 2 lines are (ANSWER TO PART 4)
colnames(train)=var.names[,2]
colnames(test)=var.names[,2]
# read activity numbers
train.act=read.table("UCIdata/UCI HAR Dataset/train/y_train.txt",sep = "")
test.act=read.table("UCIdata/UCI HAR Dataset/test/y_test.txt",sep = "")
colnames(train.act)="Activity_code"
colnames(test.act)="Activity_code"
# read subject codes
train.sbj=read.table("UCIdata/UCI HAR Dataset/train/subject_train.txt",sep = "")
test.sbj=read.table("UCIdata/UCI HAR Dataset/test/subject_test.txt",sep = "")
colnames(train.sbj)="Subject_code"
colnames(test.sbj)="Subject_code"
#Merge all test and train info into two data frames
train.all=cbind(train.sbj,train.act,train)
test.all=cbind(test.sbj,test.act,test)

## Merge both test and train data into one dataframe and change it to data.table

All.data=rbind(train.all,test.all) #(ANSWER TO PART 1)


## The following function returns the last n characters of a string x
substrRight <- function(x, n){
        substr(x, nchar(x)-n+1, nchar(x))
}

# define the columns with mean values
mean.cols=var.names[(substr(substrRight(var.names$V2,9),1,8)=="-mean()-")|
                  (substrRight(var.names$V2,7)=="-mean()"),]
#define the columns with std values
std.cols=var.names[(substr(substrRight(var.names$V2,8),1,7)=="-std()-")|
                           (substrRight(var.names$V2,6)=="-std()"),]
# combine mean and std column names
mean_n_std_cols=rbind(mean.cols,std.cols)
# Extract a data frame with only mean and std variables
# (ANSWER TO PART 2)
All.data.m_std=All.data[,c("Subject_code","Activity_code",mean_n_std_cols$V2)]

# read the activity labels
activity.labels=read.table("UCIdata/UCI HAR Dataset/activity_labels.txt",sep = "")
activity.labels[,2]=as.character(activity.labels[,2])
# The following function looks up activity code and returns activity label
Activity.names=function(Act_code){
        activity.labels[activity.labels$V1==Act_code,2]
}
# Add a column with activity labels
#(ANSWER TO PART 3)
All.data.m_std$Activity_label=with(All.data.m_std,sapply(Activity_code,Activity.names))
# Summarize the data by average of each variable for each activity and each subject
# (ANSWER TO PART 5)
summary.data.large=ddply(All.data.m_std,.(Subject_code, Activity_label),numcolwise(mean))
write.table(summary.data.large,file = "Summary_Data_large.txt",row.name=FALSE)


# The following lines generate a smaller file with fewer columns
# define the columns with mean values
mean.cols2=var.names[substrRight(var.names$V2,7)=="-mean()",]
#define the columns with std values
std.cols2=var.names[substrRight(var.names$V2,6)=="-std()",]
# combine mean and std column names
mean_n_std_cols2=rbind(mean.cols2,std.cols2)
# Extract a data frame with only mean and std variables
# (ANSWER_SHORT VERSION)
summary.data.small=summary.data.large[,c("Subject_code","Activity_code","Activity_label",mean_n_std_cols2$V2)]
write.table(summary.data.small,file = "Summary_Data_small.txt",row.name=FALSE)



