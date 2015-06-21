#Data

A full description of the dataset that was used for the project can be obtained at the following url:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A summary description is below, and was obtained from the readme.txt file included with the dataset:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

#Transformations

The following files are used from the dataset:

features.txt - complete list of all measures taken
activity_labels.txt - complete list of the different movement activities performed (Walking, etc as listed above)
X_train.txt, y_train.txt, subject_train.txt - X is the measures, y is the activities, subject is the numbered volunteer.
X_test.txt, y_test.txt, subject_test.txt - same as above but for the 30% of volunteers chosen for the test data.

The following transformations are performed by the run_analysis.R script in order to generate a tidy data set from the UCI HAR Dataset downloaded from the web.

1. Merge the training and test sets to create one data set.
		Subject data is row bound (subject_train, subject_test), same for activity, and the same for the measures 		X.  Each new data set (Subject, Activity and Measures) is labeled. Subject and ActivityID are input, and 		Measures labels come from the features.txt.
		Then these three datasets are bound by columns to create one single data set of Subjects, Activities and 		Measures.
		
2. Extract only the measurements on the mean and standard deviation for each measurement.
		A new dataset is created that is only the columns that contain a mean or standard deviation for each 		measurement, as well as the Subject and Activity ID.
		
3. Uses descriptive activity names to name the activities in the data set.
		The activity_labels.txt is joined to the dataset by Activity ID in order to give name labels to each 		ActivityID (Walking, etc).

4. Appropriately labels the data set with descriptive variable names.
		The shorthand for the measures is replaced by longer descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and subject. The output has been named "tidy data.txt".
		The data is grouped by activity and subject, then this grouped dataset is summarized, calculating the 		mean for each variable.
		
#Variables

The final dataset contains measures or dimensions for the following variables:

Subject                                           
ActivityID 
Activity                                         
TimeBodyAccelerometer-mean()-XYZ                                          
TimeBodyAccelerometer-std()-XYZ                                                 
TimeGravityAccelerometer-mean()-XYZ                   
TimeGravityAccelerometer-std()-XYZ                   
TimeBodyAccelerometerJerk-mean()-XYZ                  
TimeBodyAccelerometerJerk-std()-XYZ                    
TimeBodyGyroscope-mean()-XYZ                         
TimeBodyGyroscope-std()-XYZ                          
TimeBodyGyroscopeJerk-mean()-XYZ                    
TimeBodyGyroscopeJerk-std()-XYZ                    
TimeBodyAccelerometerMagnitude-mean()                
TimeBodyAccelerometerMagnitude-std()               
TimeGravityAccelerometerMagnitude-mean()             
TimeGravityAccelerometerMagnitude-std()             
TimeBodyAccelerometerJerkMagnitude-mean()           
TimeBodyAccelerometerJerkMagnitude-std()             
TimeBodyGyroscopeMagnitude-mean()                  
TimeBodyGyroscopeMagnitude-std()                  
TimeBodyGyroscopeJerkMagnitude-mean()                
TimeBodyGyroscopeJerkMagnitude-std()                 
FrequencyBodyAccelerometer-mean()-XYZ                 
FrequencyBodyAccelerometer-std()-XYZ                   
FrequencyBodyAccelerometer-meanFreq()-XYZ              
FrequencyBodyAccelerometerJerk-mean()-XYZ              
FrequencyBodyAccelerometerJerk-std()-XYZ              
FrequencyBodyAccelerometerJerk-meanFreq()-XYZ          
FrequencyBodyGyroscope-mean()-XYZ                     
FrequencyBodyGyroscope-std()-XYZ                       
FrequencyBodyGyroscope-meanFreq()-XYZ               
FrequencyBodyAccelerometerMagnitude-mean()          
FrequencyBodyAccelerometerMagnitude-std()           
FrequencyBodyAccelerometerMagnitude-meanFreq()       
FrequencyBodyBodyAccelerometerJerkMagnitude-mean()   
FrequencyBodyBodyAccelerometerJerkMagnitude-std()    
FrequencyBodyBodyAccelerometerJerkMagnitude-meanFreq()
FrequencyBodyBodyGyroscopeMagnitude-mean()         
FrequencyBodyBodyGyroscopeMagnitude-std()            
FrequencyBodyBodyGyroscopeMagnitude-meanFreq()      
FrequencyBodyBodyGyroscopeJerkMagnitude-mean()        
FrequencyBodyBodyGyroscopeJerkMagnitude-std()        
FrequencyBodyBodyGyroscopeJerkMagnitude-meanFreq()   

