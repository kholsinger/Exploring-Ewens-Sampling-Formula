# Exploring Ewens sampling formula

This repository includes `R` and `Stan` code to compare estimates of $\theta$ based on Watterson's formula from the number of segregating sites with estimates derived from a full Bayesian implementation of Ewen's sampling formula. 

I spent a fair amount of time over the past month exploring Ewens sampling formula. My conclusions are that:

- Nnot surprisingly, you can get good estimates of $\theta$ from a fully Bayesian approach, but that they're not substantially better than estimates from Watterson's approach (and they may not be better at all).

- Unless you have data from a reasonably large number of loci, Bayesian estimates are heavily influenced by your choice of prior.

- Moving away from the infinite sites model to SNP data leads to Bayesian estimates that don't perform particularly well. I tried going back to an even simpler model, a beta binomial, and it doesn't work well either.

Bottom line: I learned a fair amount about the Ewens sampling formula, but I didn't discover any new approaches that are worth pursuing.