data {
  int<lower=0> N;
  int<lower=0> L;
  int n[L];
  real shape;
  real rate;
  int<lower=0, upper=1> equal_pars;
}

parameters {
  real<lower=0> phi;
  real<lower=0> theta_raw;
  vector<lower=0, upper=1>[L] p;
}

transformed parameters {
  real<lower=0> theta;
  
  if (equal_pars == 0) {
    theta = theta_raw;
  } else {
    theta = phi;
  }
}

model {
  ## gamma prior on phi and theta
  ##   mean = shape/rate
  ##   variance = shape/(rate^2)
  ##
  phi ~ gamma(shape, rate);
  theta_raw ~ gamma(shape, rate); 
  
  ## likelihood of data
  ##
  for (l in 1:L) {
    p[l] ~ beta(phi, theta);
    n[l] ~ binomial(N,p[l]);
  }
}

