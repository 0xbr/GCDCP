rm(list=ls()); cat('\014');

library(data.table)

# Reading data
features <- read.table("features.txt", header = F, col.names = c("id", "feats"), colClasses = c("numeric","character"));
activity_labels <- read.table("activity_labels.txt", header = F, col.names = c("id", "activity_labels"), colClasses = c("numeric","character"));

# Collecting mean and standard deviation for each measurement
featur.es <- grepl("mean\\(\\)|std\\(\\)", features[,2]);

# Train data
subject_train <- read.table("./train/subject_train.txt", header = F, col.names = "subject"); 
y_train <- read.table("./train/y_train.txt", header = F, col.names = "Activity_label"); 
x_train <- read.table("./train/x_train.txt", header = F, col.names = features$feats); 

x_train <- x_train[,featur.es]; # Train data according to specific measurements

# cbinding (combining R Objects by columns) train data
train <- cbind(as.data.table(subject_train), y_train, x_train); 

# Test data
subject_test <- read.table("./test/subject_test.txt", header = F, col.names = "subject");
y_test <- read.table("./test/y_test.txt", header = F, col.names = "Activity_label");
x_test <- read.table("./test/x_test.txt", header = F, col.names = features$feats);

x_test <- x_test[,featur.es]; # Test data according to specific measurements

test <- cbind(as.data.table(subject_test), y_test, x_test); # cbinding test data

allD <- rbind(train, test); # Combining train and test data by rows

# Merging data
library(reshape2)

id_L <- c("subject", "id", "Activity_label"); data_L <- setdiff(colnames(allD), id_L);
meltdown <- melt(allD, measure.vars = data_L);

# Applying the mean function to the merged data
data_set <- dcast(meltdown, subject + Activity_label ~ variable, mean);

write.table(data_set, "tidy_data_set.txt", row.name = F); # Writing the result in a txt file
