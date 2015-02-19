### GACD-course-project
contains files for course project - generating a tidy data set from raw data


### Background
--------------
In this project a "tidy" data set was generated from a raw data set. A script to do so was created and included in this dataset.

The raw set was based on experiments carried out with a group of 30 volunteers.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist.
Using its embedded accelerometer and gyroscope, the experiment captured 3-axial linear acceleration and 3-axial angular acceleration. 

Note: Additional infomration about the raw data set generation is given in the references at the bottom.


### Each record in the tidy data set includes
---------------------------------------------
- Mean and Std of body acceleration from the accelerometer(6 columns). 
- Mean and Std of gravity acceleration from the gyroscope (6 columns). 
- Its activity label (1 column). 
- An identifier of the subject who carried out the experiment (1 column).
- There are total of 180 records : 30 individuals performing 6 activities each.



### The dataset includes the following files
--------------------------------------------
- README.md
- CodeBook.md
- "run_analysis.R" : An R script which converts the raw data to the tidy data set
- "tidy_data_set_Sunny.txt" : this contains the "tidy" data set generated by the R script



### Method to read the tidy data set
------------------------------------
- In an R programming environment us the following commands
	> tidy_data <- read.table("tidy_data_set_Sunny.txt", header=TRUE)
	> str(tidy_data)



### The script (run_analysis.R) that generates the tidy_data does the following
-------------------------------------------------------------------------------
1. reads the raw data and binds the columns (subject to activity, then to test)
2. extracts measurements from the raw data
3. renames the activity lables by word descriptors
4. rename the columnn names with understandable word descriptors
5. create a tidy data set based on guidelines in the CodeBook



### Raw data required and its structure to run the analysis script
------------------------------------------------------------------
- 'features.txt': List of all features
- 'activity_labels.txt': Links the class labels with their activity name

- 'train/X_train.txt': Training set
- 'train/y_train.txt': Training labels
- 'train/subject_train.txt'

- 'test/X_test.txt': Test set
- 'test/y_test.txt': Test labels
- 'test/subject_test.txt'
NOTE: The analysis script run_analysis.R must reside in the same directory as the features and activity_labels files.
This directory should then have 2 sub-directories "train" and "test" within which the X,y_train,test and 
subject_train,test files reside.



### References
--------------
1. More details about the raw data are available from "https://class.coursera.org/getdata-011/human_grading/view/courses/973498/assessments/3/submissions"