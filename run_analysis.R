setwd("./Raw-Data") # Information about the Procedure at https://github.com/CesarBuenoB/Accelerometers-Samsung-Galaxy/blob/master/CodeBook.md
##* Libraries and Functions *##
library(dplyr)
library(tidyr)
removeSpecialCharacters <- function(vector) {
    specialCharacters <- c("\\.", "\\-", "\\_", "\\(", "\\)", ",")
    for (i in specialCharacters) 
        vector <- gsub(i, "", vector)
    return(vector)
}

##* Reading and Tiding headers *##
headers <- read.table("./features.txt")$V2 %>%
    tolower %>% removeSpecialCharacters

##* Reading Main Data *##
data <- read.table("./test/X_test.txt", col.names = headers) %>%
    rbind(read.table("./train/X_train.txt", col.names = headers))
    
##* Reading and Attaching Subject *##
data$subject <- read.table("./test/subject_test.txt")$V1 %>% 
    c(read.table("./train/subject_train.txt")$V1)

##* Reading, Tiding and Attaching Activity *##
testactivity <- read.table("./test/y_test.txt")$V1
trainactiviy <- read.table("./train/y_train.txt")$V1
data$activity <- read.table("./activity_labels.txt")$V2 %>%
    tolower %>%
    removeSpecialCharacters %>%
    factor %>%
    (function(x) x[c(testactivity, trainactiviy)])

##* Selecting Variables *##
data <- data %>%
    select(subject, activity,
           grep("mean|std", headers)) %>% #just mean&std variables   
    mutate( # type indicates if it is test or train
        type <- c(rep("test",  length(testactivity)),
                    rep("train", length(trainactiviy))  
                    ) %>%
               factor)

##* Output *##
tidydata <- data %>% 
    group_by(subject, activity) %>%
    summarise_each(mean)
setwd("../")
write.table(tidydata, "./tidydata.txt")
write.table(data, "./data.txt")
#* ** ***************************************************** ** *#