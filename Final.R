#30-day mortality rates
directory <- c("dataset")
setwd(directory)
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

outcome[ , 11] <- as.numeric(outcome[ , 11]) #convert 11th column to numeric

histogram <- hist(outcome[ , 11]) #plot histogram for 11th column

setwd('..') 


best <- function(state, illness) {
        
        if(illness == "heart attack") {         #extract corresponding column to input illness
                data <- outcome[ , c(1, 2, 7, 11)]
        } else if(illness == "heart failure") {
                data <- outcome[ , c(1, 2, 7, 17)]
        } else if(illness == "pneumonia") {
                data <- outcome[ , c(1, 2, 7, 23)]
        }
        
        
        data[ , 4] <- as.numeric(data[ , 4])    #convert mortality rate column to numeric
        
        subsetdata <- subset(data, State == state)      #filter out state selected
        
        min <- min(subsetdata[ , 4], na.rm = TRUE)
        #get minimum value of mortality rate
        
        output <- subset(subsetdata, subsetdata[ ,4] == min) #filter out row with minimum mortality
        
        output[1, 2]
        
}

rankhospital <- function(state, illness, num = 1) {
        
        if(illness == "heart attack") {         #extract corresponding column to input illness
                data <- outcome[ , c(1, 2, 7, 11)]
        } else if(illness == "heart failure") {
                data <- outcome[ , c(1, 2, 7, 17)]
        } else if(illness == "pneumonia") {
                data <- outcome[ , c(1, 2, 7, 23)]
        }
        
        
        
        data[ , 4] <- as.numeric(data[ , 4])    #convert mortality rate column to numeric
        
        subsetdata <- subset(data, State == state)      #filter out state selected
        
        subsetdata <- subsetdata[order(subsetdata[ ,2], decreasing = FALSE), ] #sort in ascending order of alphabet
        subsetdata <- subsetdata[order(subsetdata[ ,4], decreasing = FALSE), ] #sort in ascending order of mortality
        
        if(num == "worst") {
                num <- nrow(na.omit(subsetdata))
        } else {
                as.numeric(num)
        }
        
        subsetdata[num, 2]
        
}


rankall <- function(illness, num = 1) {
        
        if(illness == "heart attack") {         #extract corresponding column to input illness
                data <- outcome[ , c(1, 2, 7, 11)]
        } else if(illness == "heart failure") {
                data <- outcome[ , c(1, 2, 7, 17)]
        } else if(illness == "pneumonia") {
                data <- outcome[ , c(1, 2, 7, 23)]
        }
        
        
        if(num == "worst") {
                num <- nrow(na.omit(data))
        } else {
                as.numeric(num)
        }
        
        
        
        data[ , 4] <- as.numeric(data[ , 4])    #convert mortality rate column to numeric
        
        splitdata <- split(data, data$State)
        #split data according to states(factor)
        
        newdata1 <- lapply(splitdata, function(x) x[order(x[ ,2], decreasing = FALSE), ] )
        #order alphabetically to all elements in list
        
        newdata2 <- lapply(newdata1, function(x) x[order(x[ ,4], decreasing = FALSE), ] )
        #order mortality rates to all elements in list
        
        gooddata <- lapply(newdata2, function(x) x[num, 2])
        #extract hospital name and mortality rate columns
        
        
}












