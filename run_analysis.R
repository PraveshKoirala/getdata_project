library("dplyr")

if (!file.exists("UCI HAR Dataset"))
    stop ("The UCI dataset doesn't exist. Please include the directory in current
          directory and make sure that it's name is 'UCI HAR Dataset' (without the quotes)")


# read the related files
setwd("UCI HAR Dataset/")

# load the test data
test <- read.table("test/X_test.txt")
test_labels <- read.table("test/y_test.txt")
test_subject <- read.table("test/subject_test.txt")
test_data <- cbind(test_subject, test_labels, test)

# load the train data 
train <- read.table("train/X_train.txt")
train_labels <- read.table("train/y_train.txt")
train_subject <- read.table("train/subject_train.txt")
train_data <- cbind(train_subject, train_labels, train)

# feature names and activity labels, these will be used to assign headers
# and resolve activities to strings

features_names <- read.table("features.txt", stringsAsFactors = FALSE)
activity_labels <- read.table("activity_labels.txt")

setwd('..')


# Merge test and train data
merged_data <- rbind(test_data, train_data)


# discard the row names from features_names and add two additional features
n_features <- nrow(features_names)
features_names <- features_names[, 2]
dim(features_names)<-c(n_features, 1)
new_features_name <- rbind("Subjects", "Activity", features_names)

colnames(merged_data) <- new_features_name

# clean the data
valid_names <- grep("mean\\(\\)|std\\(\\)|Subjects|Activity", names(merged_data))
merged_data <- merged_data[,valid_names]

# aggregate the merged_data by subjects and activity and take their mean
merged_data <- aggregate(.~Subjects+Activity, data=merged_data, mean)

# Resolve the Activity field from integer to String
merged_data$Activity <- sapply(merged_data$Activity, function(x){activity_labels[x, 2]})

# Outputs
write.table(merged_data, row.names=FALSE, file = "step_5.txt")