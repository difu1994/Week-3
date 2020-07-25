#30-day mortality rates
directory <- c("dataset")
setwd(directory)
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

# outcome[ , 11] <- as.numeric(outcome[ , 11]) #convert 11th column to numeric

# histogram <- hist(outcome[ , 11]) #plot histogram for 11th column

setwd('..') 

illness <- 'Heart Failure'
num = 1

if(illness == "Heart Attack") {
        data <- outcome[ , c(1, 2, 7, 11)]
} else if(illness == "Heart Failure") {
        data <- outcome[ , c(1, 2, 7, 17)]
} else if(illness == "Pneumonia") {
        data <- outcome[ , c(1, 2, 7, 23)]
}


data[ , 4] <- as.numeric(data[ , 4])    #convert mortality rate column to numeric

splitdata <- split(data, data$State)

newdata <- lapply(splitdata, function(x) x[order(x[ ,4], decreasing = FALSE), ] )

gooddata <- sapply(newdata, function(x) x[num, 2])

ak <- gooddata["AK"]