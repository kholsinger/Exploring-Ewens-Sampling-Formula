functions {
  real tavare_lpmf(int s, real theta, int n) {
    real x = 0;
  
    for (j in 1:(n - 1)) {
      x += ((-1)^(j-1))*choose(n - 2, j - 1)*((theta/(j + theta))^(s+1));
    }
    return log(x);
  }
}

data {
  int<lower=0> N;
  int s;
  real shape;
  real rate;
}

parameters {
  real<lower=0> theta;
}

model {
  ## prior on theta
  ##   mean = shape/rate
  ##   variance = shape/(rate^2)
  ##
  theta ~ gamma(shape, rate);
  
  ## likelihood of data
  ##
  target += tavare_lpmf(s | theta, N);
}

