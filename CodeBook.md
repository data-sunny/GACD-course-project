### Study design
----------------
		30 people perform 6 exercises and these are measured by 2 sensors: Accelerometer and Gyroscope.
		Each of the exercises are originally performed repeatedly (or at different times). 
		The human group was randomly broken into a training and test group.

		Please note that each sensor measures in 3 directions X,Y and Z producing a total of 6 measurements for both sensors.
		Since requirement is to obtain the Mean and Standard Deviation for each - this produces a total of 12 measurement variables.


### Calculations basis
----------------------
		A mean value is calculated for each sensor in X, Y and Z directions producing 6 columns with Mean values
		A standard dev is calculated for each sensor in X, Y and Z directions producing 6 columns with Std values
		As noted in the study design that each individual performed multiple repetitions for each exercise. Each row is then an averaged value.


### Tidy data layout
--------------------
		The design for the tidy_data file is based on the following guidelines
			1. each measurement forms a new variable placed in a new column
			2. each observation forms a new row
			3. the data in the tables should ennable reorganization

		There are a total of 14 columns in the final tidy_data
			columns 1 and 2 identify the "subject" and "activity" performed
			columns 3 through 14 (total 12) are the Mean and Std value in the 3 directions for the 2 sensors

		There are a total of 180 rows in the final tidy_data
			there are total of 6 different exercises and 30 participating humans
			this produces a total of 180 rows of unique observations


### Instruction list
--------------------
		The analysis script "run_analysis.R" requires as inputs
			- 'features.txt': List of all features
			- 'activity_labels.txt': Links the class labels with their activity name
			- 'train/X_train.txt': Training set
			- 'train/y_train.txt': Training labels
			- 'train/subject_train.txt'
			- 'test/X_test.txt': Test set
			- 'test/y_test.txt': Test labels
			- 'test/subject_test.txt'

		and generates output file
			- 'tidy_data_set_Sunny.txt'
			

### Info about variables
------------------------
	Column Name		Description

	1. Subject		identifies the human participatin
	2. Activity		6 kinds (levels), each identified by word descriptor (walking, walking_upstaris, walking_downstairs, sitting, standing, laying)

	3. BodyAcc.Mean.X	Mean of body acceleration in X direction (units assumed m/s^2)
	4. BodyAcc.Mean.Y	Mean of body acceleration in Y direction (units assumed m/s^2)
	5. BodyAcc.Mean.Z	Mean of body acceleration in Z direction (units assumed m/s^2)
	6. BodyAcc.Std.X	Standard deviation of body acceleration in X direction (units assumed m/s^2)
	7. BodyAcc.Std.Y	Standard deviation of body acceleration in Y direction (units assumed m/s^2)
	8. BodyAcc.Std.Z	Standard deviation of body acceleration in Z direction (units assumed m/s^2)

	 9. GravityAcc.Mean.X	Mean of gravity acceleration in X direction (units assumed m/s^2)
	10. GravityAcc.Mean.Y	Mean of gravity acceleration in Y direction (units assumed m/s^2)
	11. GravityAcc.Mean.Z	Mean of gravity acceleration in Z direction (units assumed m/s^2)
	12. GravityAcc.Std.X	Standard deviation of gravity acceleration in X direction (units assumed m/s^2)
	13. GravityAcc.Std.Y	Standard deviation of gravity acceleration in Y direction (units assumed m/s^2)
	14. GravityAcc.Std.Z	Standard deviation of gravity acceleration in Z direction (units assumed m/s^2)