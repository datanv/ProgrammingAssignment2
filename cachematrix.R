## Put comments here that give an overall description of what your
## functions do
## makeCacheMatrix creates the inverse of a given matrix and returns a list of
## functions
## cacheSolve calculates the inverse of a matrix created with makeCacheMatrix

## Write a short comment describing this function
## returns a list of functions, it's purpose is to store a matrix and a cached
## value of the inverse of the matrix

makeCacheMatrix <- function(x = numeric()) {

        # holds the cached value or NULL if nothing is cached
        # initially nothing is cached so set it to NULL
        cache <- NULL

        # store a matrix
        setMatrix <- function(newValue) {
                x <<- newValue
                # since the matrix is assigned a new value, flush the cache
                cache <<- NULL
        }

        # returns the stored matrix
        getMatrix <- function() {
                x
        }

        # cache the given argument
        cacheInverse <- function(solve) {
                cache <<- solve
        }

        # get the cached value
        getInverse <- function() {
                cache
        }

        # return a list. Each named element of the list is a function
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}



## Write a short comment describing this function
## calculates the inverse of the matrix created in function above

cacheSolve <- function(y, ...) {
        # get the cached value
        inverse <- y$getInverse()
        # if a cached value exists return it
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }

        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)

        inverse
}
