# Generate a random sample from a normal distribution
samples <- rnorm(10000, 50, 2)

mean(samples)
sd(samples)

hist(samples)


# Test dataset
testData <- c(
  19.09, 19.55, 17.89, 17.73, 25.15,
  27.27, 25.24, 21.05, 21.65, 20.92,
  22.61, 15.71, 22.04, 22.60, 24.25
)

sum(testData)
hist(testData)
mean(testData)

# Calculate skewness
library(moments)

skewness(testData)
skewness(samples)


# Function to calculate the mean
myMean <- function(numbers) {
  tempMean <- sum(numbers) / length(numbers)
  return(tempMean)
}

myMean(testData)
myMean(samples)


# Read state population data from the U.S. Census
readStates <- function() {

  urlToRead <- "https://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv"

  dfStates <- read.csv(url(urlToRead))

  # Keep the relevant columns
  dfStates <- dfStates[, 1:5]

  # Remove unnecessary rows
  dfStates <- dfStates[-1:-8, ]

  # Rename columns
  colnames(dfStates) <- c(
    "state",
    "april10census",
    "april10base",
    "July2010",
    "July2011"
  )

  # Keep state population rows
  dfStates <- dfStates[1:51, ]

  # Convert population values from character to numeric
  dfStates$april10census <- as.numeric(
    gsub(",", "", dfStates$april10census)
  )

  dfStates$april10base <- as.numeric(
    gsub(",", "", dfStates$april10base)
  )

  dfStates$July2010 <- as.numeric(
    gsub(",", "", dfStates$July2010)
  )

  dfStates$July2011 <- as.numeric(
    gsub(",", "", dfStates$July2011)
  )

  return(dfStates)
}


# Load the state population data
myData <- readStates()

# View the results
myData
