#Assignment

makeCacheMatrix <- function(x = matrix()) { #contains 4 functions set/get/setmean/getmean
        i <- NULL
        set <- function(y) {    #assigns input y to x in makeVector environment, for easy customisation
                x <<- y         #cleans m
                i <<- NULL
        }
        get <- function() x     #returns the value of x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
        i <- x$getinverse()        #Calls the getinverse() function on the input object.
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()         #get the original matrix from makeCacheMatrix()
        i <- solve(data, ...)
        x$setinverse(i)            #input m value into setmean function which is stored as m in makeVector
        i
}



aMatrix <- makeCacheMatrix(matrix(1:4, 2, 2))
aMatrix$get()               # retrieve the value of x
aMatrix$getinverse()           # retrieve the value of m, which should be NULL
aMatrix$set(matrix(4:7, 2, 2))          # reset value with a new matrix
cacheSolve(aMatrix)          # notice inverse calculated is inverse of new matrix
aMatrix$getinverse()           # retrieve it directly, now that it has been cached



b <- matrix(4:7, 2, 2)
bi <- solve(b)





