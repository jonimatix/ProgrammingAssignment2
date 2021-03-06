# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

# cacheSolve: This function computes the inverse of the special "matrix" returned by 
# makeCacheMatrix above. If the inverse has already been calculated (and the matrix 
# has not changed), then the cachesolve should retrieve the inverse from the cache.

# Function to get and set the matrix and inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) m <<- inv
    getinverse <- function() m
    
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
    
}

# Function used to check if the inverse if already computed for the set matrix
# Calculates the inverse if the cache is empty 

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
    
}

# Test execution of the above functions
mat <- matrix(data = rnorm(9,10), nrow = 3, ncol = 3)

mvec <- makeCacheMatrix(mat)

cacheSolve(mvec)
