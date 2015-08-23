This code book describes the variables, the data, and any transformations or work that is performed to clean up the data.
The gerenal method that is used to clean and tidy the data is explained in README.md

Variables,data frames, and functions:

var.names: This is a data frame including all the variable names read from "features.txt" in the data base. It is used to answer part 4. in project.

train: this is the train data frame read from "train/X_train.txt" in the data base.

test: this is the test data frame read from "test/X_test.txt" in the data base.

train.act: This is the data frame including the activity code numbers for each line of train data read from "train/y_train.txt".

test.act: This is the data frame including the activity code numbers for each line of test data read from "test/y_test.txt".

train.sbj: This is the data frame including subject numbers for each row of train dataset read from "train/subject_train.txt".

test.sbj: This is the data frame including subject numbers for each row of test dataset read from "test/subject_test.txt".

train.all: This is the data frame which is made by adding the subject numbers and activity codes to the train data frame.

test.all: This is the data frame which is made by adding the subject numbers and activity codes to the test data frame.

All.data: this the merged data frame that includes all rows of the data set (both train and test). This is the answer to part 1. in project.

substrRight(x,n): This is function that uses the substr() function to subset the last n character of string x.

mean.cols: This is a data frame that inculdes all the varaible names that include mean().

std.cols: This is a data frame that inculdes all the varaible names that include std().

mean_n_std_cols: This data frame is the merged of the last two. i.e. it icludes all the varaible names that eaither has mean() or std() in them.

All.data.m_std: This is a subset of the All.data data frome that only has columns with mean() or std() in them. It has 66 variables plus the subject number and activity code. This is the answer to part 2. in the project.

activity.labels: This is a small data frame that has the activity labels and thier code read from "activity_labels.txt" in the data base.

Activity.names(Act_code): This is a function that gets an activity code and returns its corresponding activity label. It is used to add the Activity_label column to the All.data.m_std data base. (answer to part 3. of project).

summary.data.large: This is a data frame that includes the average for each of the 66 variables in all.data.m_std for each activity and each subject. (this is a large version to answer part 5.) This data frame has 180 rows (30 subjects * 6 activities)

mean.cols2: This a smaller version of mean.cols exluding variables that have the mean for each axis. i.e. "...-mean()-X", "...-mean()-Y" and "...-mean()-Z".

std.cols2: This a smaller version of std.cols exluding variables that have the std for each axis. i.e. "...-std()-X", "...-std()-Y" and "...-std()-Z".

mean_n_std_cols2: this data frame merges mean.cols2 std.cols2.

summary.data.small: This is the smaller version of summary.data.large that only includes 18 variables (exluding axis-wise means ans stds). (this is a small version to answer part 5.)

