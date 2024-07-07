# Exploring Ewens sampling formula

This repository includes `R` and `Stan` code to compare estimates of $\theta$ based on Watterson's formula from the number of segregating sites with estimates derived from a full Bayesian implementation of Ewen's sampling formula. There are currently only two files (besides the LICENSE and this README.md) in the repository:

- [Ewens.Rmd](Ewens.Rmd) - An `R` Notebook containing preliminary explorations and simulations
- [ewens.stan](ewens.stan) - `Stan` code to estimate $\theta$ from the Ewen's sampling formula