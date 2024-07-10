functions {
  int i_sum(int[] a) {
    int sum = 0;
    int n = dims(a)[1];
    
    for (i in 1:n) {
      sum += i*a[i];
    }
    return sum;
  }
  real ewens_lpmf(int[] a, real theta) {
    real x;
    int n = i_sum(a);
    
    x = lgamma(n + 1) - log(theta);
    for (i in 1:(n-1)) {
      x -= log(theta + i);
    }
    for (j in 1:n) {
      x += a[j]*log(theta) - a[j]*log(j) - lgamma(a[j] + 1);
    }
    return x;
  }
}

data {
  int<lower=0> N;
  int a[N];
  real shape;
  real rate;
  int<lower = 0, upper = 1> prior;
}

parameters {
  real<lower=0> theta;
}

model {
  ## gamma prior on theta
  ##   mean = shape/rate
  ##   variance = shape/(rate^2)
  ##
  if (prior == 0) {
    theta ~ gamma(shape, rate); 
  } else {
    ## shape = mean of log(theta)
    ## rate = sd of log(theta)
    ##
    theta ~ lognormal(shape, rate);
  }

  ## likelihood of data
  ##
 target += ewens_lpmf(a | theta);
}

