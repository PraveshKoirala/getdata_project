## Codebook

This codebook contains the information about the variables present in the generated file

There are in total 68 variables, two of the variables _Subjects_ and _Activity_ are descriptive
variables and the rest 66 are measurement variables

### Descriptive Variables
* Subjects : The numerical id of the person who performed the experiment. Ranges from 1-30
* Activity : The activity label of the experiment. One of these five.
    *   WALKING
    *   WALKING UPSTAIRS
    *   WALKING DOWNSTAIRS
    *   SITTING
    *   STANDING
    *   LAYING
     
### Measurement Variables
The measurement variables. Each of the measurement variable are the average of the original dataset taken over the unique Subject and Activity. They are normalized i.e. between 0-1. The measurement variables are constructed in the following ways

#####Prefix: 

One of two
* _t_ : indicates that it is a time domain variable
* _f_ : indicates that it is a frequency domain variable

#####Measurement name

The name of the measurement. One of the following:
* BodyAcc
* GravityAcc
* BodyAccJerk
* BodyGyro
* BodyGyroJerk
* BodyAccMag
* GravityAccMag
* BodyAccJerkMag
* BodyGyroMag
* BodyGyroJerkMag

Consult the file _features.txt_ and _features_info.txt_ in the UCI dataset for more information

#####Measurement function

One of the two
* mean ()
* std ()

#####Measurement Axis

The axis of the measurement i.e. X, Y and Z. Applicable for only these measurements
* BodyAcc
* GravityAcc
* BodyAccJerk
* BodyGyro
* BodyGyroJerk

