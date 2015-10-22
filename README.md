# run_analysis
Getting and Cleaning Data - course project

run_analysis.R contains the R code in order to do the following (in the context of the Coursera course 
'Getting and Cleaning Data': 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Raw data
In order to run the code you must have the following files in your working directory (provided on the course project site of Coursera):
"X_test.txt"
"X_test.txt"
"features.txt"
"y_test.txt"
"y_train.txt"
"activity_labels.txt"
"subject_train.txt"
"subject_test.txt"

##Tidy set
The result file is the final_table4, containing a tidy data set as per the instructions above.
All the intermediary steps are commented in detail in the R code.

Please refer to the code book in order to see the variable descriptions.
