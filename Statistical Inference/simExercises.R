## simExercises.R

## Invesitage exponential distribution and compae with CLT

## Specifically:
## 1. Simulate the distribution using rexp(n, lambda), where
## lambda = 0.2. Note that I need to investigate the averages of 40
## exponentials and do 1000 simulations
## 2. Show the sample mean and compare it to the theoretical mean of 
## the distribution
## 3. Show how variable the sample is (via variance) and compare to the
## theoretical variance o fthe distribution
## 4. Show that the distribution is approximately normal (focus on the 
## difference between the distribution of a large collection of random
## exponentials and the distribution of a large collection of averages 
## of 40 exponentials

## Note that theoretical mean = sd = 1/lambda

###########################################################################

## Bring in package
library(ggplot2)

## Create a distribution of 1000 averages and sds of 40 random exponentials
exp_means <- NULL
exp_sds <- NULL
for (i in 1:1000) exp_means = c(exp_means, mean(rexp(40,0.2)))
for (i in 1:1000) exp_sds = c(exp_sds, sd(rexp(40,0.2)))


## Plot a histogram of 1000 random exponentials and one of 1000 averages
## of 40 random exponentials
par(mfrow = c(1,2))
hist(rexp(1000,0.2))
hist(exp_means)


## I think I should normalize the data as a bunch of z-scores and then plot
## The standard normal vs the data
plot_data <- data.frame(z_scores = (exp_means - mean(exp_means))/sd(exp_means))
plot_data$norm_scores <- rnorm(1000)
g <- ggplot(plot_data,aes(z_scores))
g + geom_density(color="blue",fill="blue",alpha=0.1,size=2) + geom_density(aes(norm_scores),color = "red",size=2)


