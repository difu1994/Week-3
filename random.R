




m <- NULL
set <- function(y) {    #define set as a function that gives x the value y and m the value NULL
        x <<- y
        m <<- NULL
}
get <- function() x     #store the value of x
setmean <- function(mean) m <<- mean
getmean <- function() m
list(set = set, get = get,
     setmean = setmean,
     getmean = getmean)