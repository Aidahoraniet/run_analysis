#run_analysis.R that does the following. 
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Read test file 
file_test=read.table("X_test.txt")
#Check dimensions file_test
dim(file_test)
#Read train file
file_train=read.table("X_train.txt")
#Check dimensions file_train
dim(file_train)
#Merges the training and the test sets to create one data set.
file_test_train <-rbind(file_test,file_train)
dim(file_test_train)
#Read features
file_features=read.table("features.txt")
#Check dimensions file_features
dim(file_features)
#Add column_names from features to identify the variables (Appropriately labels the data set with descriptive variable names)
feature_names <-as.vector(file_features$V2)
colnames(file_test_train)<-feature_names
#Extracts only the measurements on the mean and standard deviation for each measurement.
#I select all columns containig the word "mean" so I assume that meanFreq() is also required.
mean_file <-names(file_test_train)[grep("mean", names(file_test_train))]
std_file <-names(file_test_train)[grep("std", names(file_test_train))]
relevant_columns <-c(mean_file,std_file)
file_mean_std <-file_test_train[,relevant_columns]
#Add columns identifying the activities
y_test=read.table("y_test.txt")
y_train=read.table("y_train.txt")
act_column <-rbind(y_test,y_train)
dim(act_column)
final_table <-cbind(act_column,file_mean_std)

#Uses descriptive activity names to name the activities in the data set
#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING
final_table$V1[final_table$V1==1]<-"Walking"
final_table$V1[final_table$V1==2]<-"Walking Upstairs"
final_table$V1[final_table$V1==3]<-"Walking Downstairs"
final_table$V1[final_table$V1==4]<-"Sitting"
final_table$V1[final_table$V1==5]<-"Standing"
final_table$V1[final_table$V1==6]<-"Laying"
colnames(final_table)[1]<-"Activity"

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Add column subject
subject_train=read.table("subject_train.txt")
subject_test=read.table("subject_test.txt")
subject_column <-rbind(subject_test,subject_train)
final_table2 <-cbind(subject_column,final_table)
colnames(final_table2)[1]<-"Subject"
#Create tidy table gathering variables
final_table3 <-gather(final_table2,variable,value,-Activity,-Subject)
#Calculate the average value for each variable, activity and subject.
data_grouped <-group_by(final_table3,Subject,Activity,variable)
final_table4<-summarize(data_grouped,mean(value))
#The column variable could be further split but it's not specified in the instructions.