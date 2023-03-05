x <- 1:10
y <- rnorm(10)

plot(x,y)


X <- matrix( rnorm(16), 4, 4 )
solve(X)


# In most cases, you'll want to write code that checks
# arguments to functions for problems before running
# the function.

# tryCatch is useful when you don't know whether
# a function will return an error for a specific
# argument until you actually run the function.


# Projection matrix: For an n x p design matrix X,
# the projection matrix is X ( X^T X )^{-1} X^T
# when the inverse of X^T X exists
# Otherwise, you can replace ( X^T X )^{-1}
# with a generalized inverse.

# write a function that computes the projection matrix
# for a design matrix X. You should use tryCatch when
# you take the inverse of X^T X, and have it compute
# the generalized inverse instead, specifically
# the moore-penrose inverse.

# You'll need to look up how to compute the moore-penrose
# inverse, and write a function to compute it.
# See section on singular value decomposition here:
# https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse 

# load a dataset
data("ames", package = "modeldata")

# create a design matrix
X <- model.matrix( ~ Gr_Liv_Area + Bsmt_Fin_SF + Bsmt_Unf_SF + Total_Bsmt_SF, data = ames )

ames$Bsmt_Fin_SF <- ames$Total_Bsmt_SF - ames$Bsmt_Unf_SF 
X <- model.matrix( ~ Gr_Liv_Area + Bsmt_Fin_SF + Bsmt_Unf_SF + Total_Bsmt_SF, data = ames )
