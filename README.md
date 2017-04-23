#README for run_analysis.r

This script installs all needed packages, downloads the UCI HAR Dataset zip
directory, creates Training and Test data frames, labels variables, merges 
data frames, selects only variables representing mean or standard deviation 
data, and then creates a tidy dataset wherein each row represents one of the
30 subjects, and each column is clearly labeled as the mean of a specific type 
of data for that individual, with the type of activity clearly labeled as well
for each column.

Step 0: Checks for and installs/loads (if necessary) the "pacman" "dplyr" and 
	"downloader" packages.  Pacman simplifies the package installation 
	process, downloader simplifies the downloading and unzipping process,
	and dplyr enables essential table management operations.

Step 1: Sets the working directory, creates a landing directory ("data.zip"),
	and uses downloader to download and unzip the UCI HAR dataset.

Step 2.1: Pulls variable labels ("features.txt") into a dataframe.
Step 2.2: Creates the Training dataset by: (1) loading training data, 
	  (2) adding variable labels from features, (3) loading Subject IDs from
	  "subject_train.txt", and (4) loading Activity labels from "Y_train.txt"
Step 2.3: Creates the Test dataset by executing similar function, but with the 
	  .txt files dedicated to the Test subjects.

Step 3: Merges the Test and Training sets using rbind.

Step 4: Creates one pared-down dataset containing only mean data and another
	dataset containing only standard deviation data, then merges them
	together (named "pare_MSD").

Step 5: Creates a factor of named activity labels and binds it to pare_MSD.

Step 6.1: Creates one dataset for each of the 6 different activities and 
	  aggregates (by the mean) the variables, yielding 6 datasets with 
	  30 rows each. 
Step 6.2: Merges the datasets back together using rbind. 

