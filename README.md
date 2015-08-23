# Tidy_data_course_project_repo
This Repo is for the course project in the Getting and Cleaning data Course. 

There is a CodeBook.md file available to explain the variables.

The run_analyis.R scrip performs the process of cleaning the data and preparing a tidy data. 

The overall process performed in run_analysis.R is:

1- Downloading the data base using the URL provided in the project description. 
    The steps here checks whether the directory and the zip file exist or not. if they don't exist, it downloads the zip file and unzips it in the working directory.

2- Reading the Train and Test files and other files including the variable (faeture) names, activity codes, activity labels, and subject number for each dataset. 

3- Merging all the informative data into one big data frame which combines Train and Test data sets.

4- Finding the variables that include the mean() and std() values. 
    This process is done by searching the variable names for mean() and std() strings. 

5- Using the information from step 4. above, subsetting the data to include only variables with mean() or std().

6- Adding a column to the data frame to indicate the activity labels for each row using its activity code.

7- Summarizing the data using ddply() and sapply() functions to show the average of each variable for each activity and each subject. This steps results in a data with 180 (30 subjects * 6 activities) rows. 

8- writing the table into a txt file using write.table() function.
