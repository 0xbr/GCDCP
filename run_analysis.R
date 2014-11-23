# Set up working directory
setwd(".\\UCI HAR Dataset")

features <- read.table("features.txt")

x_train <- read.table("./train/x_train.txt"); x_test <- read.table("./test/x_test.txt")
subject_train <- read.table("./train/subject_train.txt"); subject_test <- read.table("./test/subject_test.txt")
y_train <- read.table("./train/y_train.txt"); y_test <- read.table("./test/y_test.txt")

x <- rbind(x_train, x_test); colnames(x) <- features$V2
subject <- rbind(subject_train, subject_test); colnames(subject) <- c("Subject")
y <- rbind(y_train, y_test); colnames(y) <- c("Activity")

sub_act <- cbind(subject, y)
data_set_txt <- cbind(x, sub_act)
