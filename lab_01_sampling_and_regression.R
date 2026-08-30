# Lab 1 - Sampling and Regression

# 1. Create a sample
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

MySample <- sample(x, 20, replace = TRUE)
MySample


# 2. Calculate the mean
mean(MySample)


# 3. Create a function to calculate a sample mean
find_my_mean <- function(x) {
  MySample <- sample(x, 20, replace = TRUE)
  MyMean <- mean(MySample)
  return(MyMean)
}

find_my_mean(x)

# Simulate the sampling distribution of the mean
pizzas <- replicate(100000, find_my_mean(x))

hist(
  pizzas,
  main = "Sampling Distribution of the Mean",
  xlab = "Sample Mean"
)


# 4. Calculate z-scores
z_score <- (x - mean(x)) / sd(x)
z_score


# 5. Calculate the mean and standard deviation
Mymean <- mean(x)
Mydeviation <- sd(x)

Mymean
Mydeviation


# 7. Probability within 0.5 standard deviations
pnorm(0.5, 0, 1) - pnorm(-0.5, 0, 1)


# 8. Calculate R-squared
# cor(x, y)^2


# 9. Linear regression
# Calculate the slope and intercept using lm()


# 10. Regression example
x <- c(32, 76, 23, 55)
y <- c(13, 62, 44, 61)

plot(x, y)
abline(lm(y ~ x))

spedley <- lm(y ~ x)

summary(spedley)

r_squared <- cor(x, y)^2
r_squared

# Slope: 0.6598
# Intercept: 14.3182
# R-squared: 0.4728
# p-value for slope: 0.3124
