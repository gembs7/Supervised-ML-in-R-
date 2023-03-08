

# Benchmarking

# We explore the "mark" function in the "bench" package

# If we have a piece of code that gets called many times, our
# speed may depend heavily on how fast that piece of code runs.

# Sometimes it is difficult to measure pieces of code that are
# called many times, but each call takes very little time.

# The mark function is defined to measure this type of code.


# let's look at the exp function for an example
# we'll compare it to using exponentiation
n <- 1000
x <- rnorm(n)
y <- 10*rnorm(n)
e <- exp(1)

library("bench")
# spend a little time reading the documentation
?mark

# this can be alternatively called with the "cute" syntax bench::mark( exp(x) )
result <- mark( exp(x), e^x )
# this contains a table with information about how long it takes
# exp(x) is a little bit faster than e^x
result
# run this block of code a few times to get a sense of whether the results are consistent

# let's do y and compare
result <- mark( exp(y), e^y )
result


# Exercise: read the documentation for "press" and use it to
# benchmark exp(x) against e^x for a range of values of n,
# such as n = 10, n = 100, n = 1000, n = 10000




# the exponential function has a series expansion:
# exp(x) = 1 + x/1! + x^2/2! + x^3/3! + ...

# let's try to beat the exp function using the series expansion
my_exp1 <- function(x){
  z <- rep(1,length(x))
  y <- x
  for(j in 1:3){
    z <- z + y/factorial(j)
    y <- y*x
  }
  return(z)
}

# this only works for small x
x <- 0.01*rnorm(n)
mark( exp(x), e^x, my_exp1(x) )

# Exercise: see if you can write your own version of my_exp that beats exp
my_exp2 <- function(x){
  # fill in your code here

  z <- 1 + x + x*x*((3+x)/6)
  
  return(z)
}

x <- 0.01*rnorm(n)
mark( exp(x), e^x, my_exp1(x), my_exp2(x) )




# sorting strings vs factors vs numbers
hot <- read.csv("C:/Users/Nick/Downloads/Hot_100.csv")

# pay attention to the units!
mark(
  order( hot$chart_date ),
  order( as.Date( hot$chart_date ) ),
  order( as.factor(hot$chart_date) ),
  order( as.numeric(as.factor(hot$chart_date) ) )
)

# how much time is spent on the actual ordering?
hot_string <- hot$chart_date
hot_date <- as.Date( hot$chart_date )
hot_fact <- as.factor( hot$chart_date )
hot_number <- as.numeric( as.factor( hot$chart_date ) )
mark( order(hot_string), order(hot_date), order(hot_fact), order(hot_number) )