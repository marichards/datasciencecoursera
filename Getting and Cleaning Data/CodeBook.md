## Codebook for averageStats.txt

Please note that all variables originate from the raw Samsung_Data dataset; some original descriptions of the Activity variable and all quantitative variables can be found in [activity_labels.txt](./Samsung_Data/UCI HAR Dataset/activity_labels.txt) and [features_info.txt](./Samsung_Data/UCI HAR Dataset/features_info.txt), respectively.

All quantitative variables are averages of that measurement for a particular Activity-Subject combination. For example, the "tBodyAcc.mean...X" for Activity = 1 and Subject = 1 is the average value of tBodyAcc.mean...X over all observations where Suject 1 was WALKING. 

Descriptions of how raw data was derived can be found in [features_info.txt](./Samsung_Data/UCI HAR Dataset/features_info.txt). More generally, most variables were measured every direction (X,Y,Z); hence, each of these variables is described compactly (e.g. tBodyAcc.mean...XYZ describes 3 measurements: tBodyAcc.mean...X, tBodyAcc.mean...Y, tbodyAcc.mean...Z). 

Some quantitative variable name also indicate the variable estimated from instrument signals:

mean: Mean value
std: Standard deviation

### Descriptions of Variables

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