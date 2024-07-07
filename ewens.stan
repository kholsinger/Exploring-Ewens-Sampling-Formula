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
  target += ewens_lpmf(a | theta);
}

