## In conclution, the functions below can be used to create a matrix and get the inverse of a matrix. The inversed matrix
## is also save in cache (different environment), which can be reused in other to save resources. 
## 

## function "makeCacheMatrix" create a matrix and create a inversed matrix of the input matrix and save it in cache.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  y <- NULL
  setmatrix <- function(y) {
    x <<- y
    m <<- NULL
  }
  getmatrix <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(setmatrix = setmatrix, getmatrix = getmatrix,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The function "cacheSolve" try to inverse a created matrix if it is not in cache. Otherwise just get it from the momery.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$getmatrix()
  m <- solve(data, ...)
  x$setmatrix(m)
  m
}
