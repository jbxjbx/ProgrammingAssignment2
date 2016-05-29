## This code is designed to make the matrix inversion by caching 

## The first function is used to create a list containing a function to make the value, 
## get the value and then return the inverse by values.

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
       inv <- x$getinverse()
    if(!is.null(inv)) {
        message("now we have the data cached.")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv
}
