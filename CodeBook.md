##Codebook for analyzed UCI HAR Dataset

The features selected for this database come from accelerometer and gyroscope 
3-axial raw signals derived from the UCI HAR Dataset. Thirty individuals wore
a Samsung smartphone while performing 6 activities: walking, walking upstairs,
walking downstairs, sitting, standing, and laying.

More information about the data collection process can be found in "README.txt"
Complete information about the features can be found in "features_info.txt" 

Note that data (including informational files) were downloaded 4/22/2017 from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Note that '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
Note that 't' is used to denote time, and 'f' is used to denote frequency.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

These data were collected in multiple time successive time segments over a short
window of time, resulting in multiple mean (M) and standard deviation (SD) estimations
per subject. This aggregated dataset presents the means of these M and SD data,
across the 6 measured activities.

Additionally, the first two columns represent the Subject and the activity associated with the observed variable.

