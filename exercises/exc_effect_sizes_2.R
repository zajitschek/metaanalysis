#Load libraries
library(compute.es)

#single calculation:
a.fes(f = __, n.1 = __, n.2 = __, R = 0, q = 0) #where we enter F-value, sample sizes of treatment and control group, covariate correlation and number of covariates (we have none in ANOVA))

#for vectors of values (like in a data frame):
results_ES <- a.fes(f = c(4.6875, 4.6875), n.1 = c(28, 10), n.2 = c(10, 10), R = c(0, 0), q = c(0, 0))
str(results_ES)


