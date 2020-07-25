# <<- operator can be used to assign a value to an object in an environment 
# that is different from the current environment

## The first function, makeVector creates a special "vector"
## which is really a list containing a function to
## set the value of the vector
## get the value of the vector
## set the value of the mean
## get the value of the mean

makeVector <- function(x = numeric()) { #contains 4 functions set/get/setmean/getmean
        m <- NULL
        set <- function(y) {    #assigns input y to x in makeVector environment, for easy customisation
                x <<- y         #cleans m
                m <<- NULL
        }
        get <- function() x     #returns the value of x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

## The following function calculates the mean of the special "vector" 
## created with the above function. 
## However, it first checks to see if the mean has already been calculated
## If so, it gets the mean from the cache and skips the computation
## Otherwise, it calculates the mean of the data 
## and sets the value of the mean in the cache via the setmean function.

cachemean <- function(x, ...) {
        m <- x$getmean()        #Calls the getmean() function on the input object.
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()         #get the original vector from makeVector()
        m <- mean(data, ...)
        x$setmean(m)            #input m value into setmean function which is stored as m in makeVector
        m
}





##### How it works
aVector <- makeVector(1:10)
aVector$get()               # retrieve the value of x
aVector$getmean()           # retrieve the value of m, which should be NULL
aVector$set(30:50)          # reset value with a new vector
cachemean(aVector)          # notice mean calculated is mean of 30:50, not 1:10
aVector$getmean()           # retrieve it directly, now that it has been cached




