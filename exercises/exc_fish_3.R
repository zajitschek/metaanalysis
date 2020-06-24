###CODEBLOCK 7###

#Load libraries and data that include calculated effect sizes
library(metafor)
fish.all <- read.csv("./binder/data/Macartney2019_effectsize_fish.csv")

#Run the first meta-analysis (a random-effects model using rma.uni() via rma())

res1 <- rma(effect_size, variance, data = fish.all)  #'effect_size' and 'variance' are the variables we calculated
print(res1, digits= 2)  #show summary of model output
forest(res1)  #plot the results in a forest plot