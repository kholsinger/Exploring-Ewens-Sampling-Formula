library(RPANDA)
library(rstan)

rm(list = ls())

## sample data from RPANDA
##
data("woodmouse")
alignment <- as.character(woodmouse)

num_missing <- function(x) {
  return(length(grep("n", x, value = FALSE)))
}

## exclude individuals with large amounts of missing data
##
keep <- apply(alignment, 1, num_missing)
reduced <- alignment[keep < 50, ]

## exclude loci with missing data
##
keep <- apply(reduced, 2, num_missing)
reduced <- reduced[, keep < 1]

## find polymorphic sites
##
polymorphic <- numeric(ncol(reduced))
for (site in 1:ncol(reduced)) {
  base <- reduced[1, site]
  for (i in 2:nrow(reduced)) {
    if (reduced[i, site] != base) {
      if(reduced[i, site] != "n") {
        polymorphic[site] <- 1
        break
      }
    }
  }
}

harm_sum <- function(n) {
  k <- 0
  for (i in 1:(n-1)) {
    k <- k + 1/i
  }
  return(k)
}