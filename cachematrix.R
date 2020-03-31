## Put comments here that give an overall description of what your functions do:
## Answer: the function is able to cache potentially time-consuming computations.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() { x }
  setinvers <- function( solve ) { m <<- solve }
  getinvers <- function() { m }
  list( set = set, 
        get = get,
        setinvers = setinvers,
        getinvers = getinvers )
}

## Write a short comment describing this function:
## Answer:
cacheSolve <- function(x, ...) {
 # Return a matrix inverse of "x":
  m <- x$getinvers()
 
 # Return the inverse if its already set:
    if (!is.null(m)) {
    message("getting cached matrix")
    return (m)
  } 
  matX <- x$get()
 
  # Calculate the inverse of a matrix
  m <- solve(matX, ...)
  
 # Set the inverse to the object
  x$setinvers(m)
  m
}
