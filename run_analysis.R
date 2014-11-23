setwd(".\\UCI HAR Dataset")

i <- read.table("features.txt")

k <- read.table("./train/x_train.txt")
j <- read.table("./test/x_test.txt")

g <- read.table("./train/subject_train.txt")
h <- read.table("./test/subject_test.txt")

f <- read.table("./train/y_train.txt")
e <- read.table("./test/y_test.txt")

m <- rbind(k, j)
colnames(m) <- i$V2
n <- rbind(g, h)
colnames(n) <- c("subject")
o <- rbind(f, e)
colnames(o) <- c("activity")

p <- cbind(n, o)
q <- cbind(m, p)
