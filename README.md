# getdata-012 Course Project

##Usage

Clone this repository on your local computer first. Then move the run_analysis.R file to the directory containing the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) folder. Remember to move it outside (and not inside) the UCI folder. Execute the script and upon completion, it will output a single file named **step_5.txt** in the working directory.

You can load the output file by using:
```R
dataset <- read.table("step_5.txt", header = T)
```


##About the script

The script works the following way:

* First it loads the test dataset and it's labels and the subjects 
* It adds to the test dataset, the two columns: the labels and subjects using `cbind`
* Similar is done for the train dataset
* The test and train datasets are merged by `rbind`
* The valid column names i.e. containing only mean() and std() and the subjects, activity are extracted by using `grep`
* We then aggregate the df by unique subject and activity and calculate their means using `aggregate`
* The activity column is then transformed to resolve it's name (from int to characters), the names are taken from `activity_labels.txt`
* The tidy data is then saved using `write.table` with `row.name = FALSE`

##Variables

The saved data frame contains 68 variables, two of which are the subject and activity labels
Consult the Codebook for related information on the variables

##References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 