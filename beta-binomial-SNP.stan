data {
  int<lower=0> N;
  int<lower=0> L;
  int n[L];
}

parameters {
  real<lower=0> phi;
  real<lower=0> theta;
}

model {
  ## likelihood of data
  ##
  for (l in 1:L) {
    n ~ beta_binomial(N, phi, theta);
  }
}

