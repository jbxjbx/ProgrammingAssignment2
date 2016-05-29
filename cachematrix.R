## This code is designed to make the matrix inversion by caching 

## The first function is used to create the matrix object which can be cached the inverse later.

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set=set, 
    get=get, 
    setinverse=setinverse, 
    getinverse=getinverse)
}


## Thsi is the function return the value we got from the previous function and then calculate the inverse.
## And then output the inverse and return. 
## If the inverse has already been calculated, then it should retrieve the inverse from the cache.

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
