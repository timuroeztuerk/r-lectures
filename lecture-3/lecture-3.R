########################################################
sample(1:6, size=1)

# generate the vector of probabilities 
probability <- rep(1/6, 6) 

# plot the probabilities 
plot(probability,
     xlab = "Outcomes",
     ylab="Probability",
     main = "Probability Distribution",
     pch=20)

# generate the vector of cumulative probabilities 
cum_probability <- cumsum(probability) 

# plot the probabilites 
plot(cum_probability, 
     xlab = "Outcomes", 
     ylab="Cumulative Probability",
     main = "Cumulative Probability Distribution",
     pch=20) 


sample(c("H", "T"), 1)

k <- 0:50

# assign the probabilities
probability <- dbinom(x = k,
                      size = 50, 
                      prob = 0.5)

# plot the outcomes against their probabilities
plot(x = k, 
     y = probability,
     ylab="Probability",
     main = "Probability Distribution Function",
     pch=20) 


# compute cumulative probabilities
prob <- pbinom(q = k, 
               size = 50, 
               prob = 0.5)

# plot the cumulative probabilities
plot(x = k, 
     y = prob,
     ylab="Probability",
     main = "Cumulative Distribution Function",
     pch=20)  


# set seed for reproducibility
set.seed(1)

# compute the sample mean of 10000 dice rolls
mean(sample(1:6, 
            10, 
            replace = T))

# define functions
f <- function(x) 3 / x^4
g <- function(x) x * f(x)
h <- function(x) x^2 * f(x)

# compute area under the density curve
area <- integrate(f, 
                  lower = 1, 
                  upper = Inf)$value

# compute E(X)
EX <- integrate(g,
                lower = 1,
                upper = Inf)$value

# compute Var(X)
VarX <- integrate(h,
                  lower = 1,
                  upper = Inf)$value - EX^2

# draw a plot of the N(0,1) PDF.
curve(dnorm(x),
      xlim = c(-3.5, 3.5),
      ylab = "Density", 
      main = "Standard Normal Density Function")

# Highlighting an area.
x <- seq(-3.5, 3.5, length = 1000)
y <- dnorm(x)
polygon(c(-1, x[x >= -1 & x <= 1], 1), 
         c(0, y[x >= -1 & x <= 1], 0), 
         col = "lightblue", 
         border = NA)
