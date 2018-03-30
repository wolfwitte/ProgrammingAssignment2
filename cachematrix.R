## These functions aim at caching the inverse of a matrix rather than compute it repeatedly. 
## I understand that the assignment requires the inverse to be stored in a matrix. However, i could not find a way to solve this.
## Here, a list is used as in the example-function makeVector. 

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function checks if an inverse has been stored in m. If so, it is printed. If not, the inverse is calculated, printed and stored.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}
