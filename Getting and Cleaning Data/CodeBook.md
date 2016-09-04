## Codebook for averageStats.txt

### Description of transformations performed

The compressed raw dataset, downloaded via `download.file()`, contained a number of key components:
1. 'activity_labels.txt': codes labels for activities performed in the study
2. 'features.txt': a list of all variables measured/calculated in the study
3. 'subject_train.txt': the list of subjects for all observations in the training dataset
4. 'subject_test.txt': the list of subjects for all observations in the test dataset
5. 'y_train.txt':  the list of activity labels for all observations in the training dataset
6. 'y_test.txt': the list of activity labels for all observations in the test dataset
7. 'X_train.txt': the training dataset
8. 'X_test.txt'; the test dataset

These files were all read into R using the `read.table()` function and all dataset variables were named using the optional `col.names` argument. The training and test datasets were merged using `bind_rows()` from the `dplyr` library, as were the pairs "y_train/y_test" and "subject_train/subject_test". All features including the terms "mean()" or "std()" were found using regular expressions in `grep()` and these columns were extracted from the full dataset using `select()` from `dplyr`. The 'activity_labels' and full set of "y" values were joined on "Label" to create a data frame of descriptive activity labels corresponding to each observation in the  dataset. These descriptive labels were added to the dataset along with the full set of subject labels using `mutate()` from `dplyr`. This concluded the first set of steps (Steps 1-4) described in the assignment. 

For the final step (creating a new dataset), the final dataset from Step 4 was melted using `melt()` from the `reshape2` package, with "Activity" and "Subject" as the IDs for each record. This melted dataset was then used to compute the average for each unique Activity/Subject combination using `dcast()` from `reshape2` with `mean()` as the applied function. To complete the assignment, this dataset was written to a space-delimited text file using `write.table()` to create "averageStats.txt". 

### Some notes on variables

Please note that all variables originate from the raw Samsung_Data dataset; some original descriptions of the Activity variable and all quantitative variables can be found in "activity_labels.txt" and "features_info.txt", repsectively, within the [Samsung_Data zipped folder](./Samsung_Data.zip)

All quantitative variables are averages of that measurement for a particular Activity-Subject combination. For example, the "tBodyAcc.mean...X" for Activity = 1 and Subject = 1 is the average value of tBodyAcc.mean...X over all observations where Suject 1 was WALKING. 

Descriptions of how raw data was derived can be found in "features_info.txt" within [Samsung_Data](./Samsung_Data.zip). More generally, most variables were measured every direction (X,Y,Z); hence, each of these variables is described compactly (e.g. tBodyAcc.mean...XYZ describes 3 measurements: tBodyAcc.mean...X, tBodyAcc.mean...Y, tbodyAcc.mean...Z). 

Some quantitative variable name also indicate the variable estimated from instrument signals:

mean: Mean value
std: Standard deviation

### Full descriptions of variables

Activity    1
    Type of Activity
            1 .WALKING
            2 .WALKING_UPSTAIRS
            3 .WALKING_DOWNSTAIRS
            4 .SITTING
            5 .STANDING
            6 .LAYING

Subject     1
    Subject Number
            1..30 .Integer identifying each unique subject    
            
tBodyAcc.mean...XYZ     8
    Mean of body linear acceleration (time domain)           
        Numeric with 7 decimal places
        
tBodyAcc.std...XYZ      8
    Standard deviation of body linear acceleration (time domain)           
        Numeric with 7 decimal places

tGravityAcc.mean...XYZ  8
    Mean of gravitational acceleration (time domain)
        Numeric with 7 decimal places

tGravityAcc.std...XYZ   8
    Standard deviation of gravitational acceleration (time domain)
        Numeric with 7 decimal places

tBodyAccJerk.mean...XYZ 8
    Mean of body linear acceleration jerk (time domain)            
        Numeric with 7 decimal places

tBodyAccJerk.std...XYZ  8
    Standard deviation of body linear acceleration jerk (time domain)           
        Numeric with 7 decimal places

tBodyGyro.mean...XYZ    8
    Mean of gyroscope acceleration (time domain)           
        Numeric with 7 decimal places
        
tBodyGyro.std...XYX     8
    Standard deviation of gyroscope acceleration (time domain)           
        Numeric with 7 decimal places
        
tBodyGyroJerk.mean...XYZ 8
    Mean of gyroscope acceleration jerk (time domain)            
        Numeric with 7 decimal places
        
tBodyGyroJerk.std...XYZ 8
    Standard deviation of gyroscope acceleration jerk (time domain)            
        Numeric with 7 decimal places
        
tBodyAccMag.mean..      8
    Mean of body linear acceleration magnitude(time domain)            
        Numeric with 7 decimal places
        
tBodyAccMag.std..       8
    Standard deviation of body linear acceleration magnitude (time domain)            
        Numeric with 7 decimal places
        
tGravityAccMag.mean..   8
    Mean of gravitational acceleration magnitude (time domain)            
        Numeric with 7 decimal places
        
tGravityAccMag.std..    8
    Standard deviation of gravitational acceleration magnitude (time domain)            
        Numeric with 7 decimal places
        
tBodyAccJerkMag.mean..  8
    Mean of body linear acceleration jerk magnitude (time domain)            
        Numeric with 7 decimal places
        
tBodyAccJerkMag.std..   8
    Standard deviation of body linear acceleration jerk magnitude (time domain)            
        Numeric with 7 decimal places
        
tBodyGyroMag.mean..     8
    Mean of gyroscope acceleration magnitude (time domain)            
        Numeric with 7 decimal places
        
tBodyGyroMag.std..      8
    Standard deviation of gyroscope acceleration magnitude (time domain)            
        Numeric with 7 decimal places
        
tBodyGyroJerkMag.mean.. 8
    Mean of gyroscope acceleration jerk magnitude (time domain)            
        Numeric with 7 decimal places
        
tBodyGyroJerkMag.std..  8
    Standard deviation of gyroscope acceleration jerk magnitude (time domain)            
        Numeric with 7 decimal places
        
fBodyAcc.mean...XYZ     8
    Mean of body linear acceleration (frequency domain)            
        Numeric with 7 decimal places
        
fBodyAcc.std...XYZ      8
    Standard deviation of body linear acceleration (frequency domain)            
        Numeric with 7 decimal places
        
fBodyAccJerk.mean...XYZ 8
    Mean of body linear acceleration jerk (frequency domain)            
        Numeric with 7 decimal places
        
fBodyAccJerk.std...XYZ  8
    Standard deviation of body linear acceleration jerk (frequency domain)            
        Numeric with 7 decimal places
        
fBodyGyro.mean...XYZ    8
    Mean of gyroscope acceleration (frequency domain)            
        Numeric with 7 decimal places
        
fBodyGyro.std...XYZ     8
    Standard deviation of gyroscope acceleration (frequency domain)            
        Numeric with 7 decimal places
        
fBodyAccMag.mean..      8
    Mean of body linear acceleration magnitude (frequency domain)           
        Numeric with 7 decimal places
        
fBodyAccMag.std..       8
    Standard deviation of body linear acceleration magnitude (frequency domain)           
        Numeric with 7 decimal places
        
fBodyBodyAccJerkMag.mean.. 8
    Mean of body linear acceleration jerk magnitude(frequency domain)           
        Numeric with 7 decimal places
        
fBodyBodyAccJerkMag.std.. 8
    Standard deviation of body linear acceleration jerk magnitude(frequency domain)           
        Numeric with 7 decimal places
        
fBodyBodyGyroMag.mean.. 8
    Mean of gyroscope acceleration magnitude (frequency domain)           
        Numeric with 7 decimal places
        
fBodyBodyGyroMag.std..  8
    Standard deviation of gyroscope acceleration magnitude(frequency domain)           
        Numeric with 7 decimal places
        
fBodyBodyGyroJerkMag.mean.. 8
    Mean of gyroscope acceleration jerk magnitude(frequency domain)           
        Numeric with 7 decimal places
        
fBodyBodyGyroJerkMag.std.. 8
    Standard deviation of gyroscope acceleration jerk magnitude(frequency domain)           
        Numeric with 7 decimal places