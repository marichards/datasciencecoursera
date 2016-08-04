## Directory Contents

This directory contains the following files:

- 'README.md'

- 'run_analysis.R': Script that downloads and tidys the data in [Samsung_Dataset](./Samsung_Dataset). It takes the following steps (in order):
 1. Downloads and reads in the raw dataset from the provided URL
 2. During the read in process, names the variables in the training and test datasets using the names provided in [features.txt](./Samsung_Dataset/UCI Har Dataset/features.txt) 
 3. Merges the training and test datasets to create one dataset 
 4. Selects only those dataset columns that correspond to the means and standard deviations for measured variables
 5. Adds descriptive activity and subject labels to each observation 
 6. Creates a new dataset, [averageStats.txt](./averageStats.txt), that averages the mean and standard deviations from the original dataset for each unique combination of test subject and activity 

- 'averageStats.txt': The tidy new dataset created from the raw data in [Samsung_Dataset](./Samsung_Dataset) that contains the averages means and standard deviations for every measurement in the raw dataset, grouped by the 180 possible Activity/Subject combinations (6 activities x 30 subjects)

- 'CodeBook.md': The code book for [averageStats.txt](./averageStats.txt), describing all variable names and, when appropriate, possible levels. 

- 'Samsung_Dataset.zip': Compressed raw data files used as input for run_analysis.R. For more information on this data set, please see the associated [Readme.txt](./Samsung_Dataset/UCI HAR Dataset/Readme.txt)  

## Reading in the averageStats Dataset

To read the "averageStats.csv" file back into R as a data frame, simply use the command:

`data <- read.table("./averageStats.txt")`

The resulting data frame contains 180 observations (6 activities x 30 subjects) across 68 variables (Activity, Subject, and 66 mean/standard deviation measurements from the raw dataset)

## Interpreting the run_analysis.R File

In the interest of readability, the sections that comprise the major steps described in the [run_analysis.R](./run_analysis.R) file have been marked with 4 comment characters (####). 