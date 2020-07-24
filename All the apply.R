#lapply takes a list and applies a functions over each element of the list

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))


b <- lapply(x, function(elt) elt[ ,1])  #elt is the variable
                                        #function takes 1st column of variable


#sapply is lapply but simplifies the result

#apply takes an array (such as matrices) and applies a function over margins of the array
#margin is an integer vector indicating which margins/dimensions should be retained

d <- matrix(rnorm(200), 20, 10)
d1 <- apply(d, 2, mean) #preserve the columns, mean the rows in the columns
d2 <- apply(d, 1, mean) #preserve the rows, mean the columns in the rows


#apply for 3 dimension matrix

e <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
e1 <- apply(e, c(1, 2), mean)
e2 <- apply(e, c(1, 3), mean)


#mapply applies a function in parallel over a set of arguments
#can be useful when two lists are required as inputs in one function

f <- list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))

f1 <- mapply(rep, 1:4, 4:1) #same as above

#tapply applies a function over subsets of a vector 
#similar to split + lapply
#INDEX parameter is a factor object


g <- c(rnorm(10), runif(10), rnorm(10, 1))
h <- gl(3,10) #generate a factor with 3 levels each with 10 elements
g1 <- tapply(g, h, mean)









