###CODEBLOCK 3###

## Load libaries and data
library(dplyr)
library(metafor)
fish <- read.csv("./binder/data/Macartney2019_processed_fish.csv")

# Calculation of Standardized Mean Difference (our Effect Size) as Cohen's d, and ROM;
# using function 'escalc' from package metafor. Please note: in Chapter 4 we do the same 
# calculation using a different package.

#calculate standardized mean difference
SMD <- escalc(measure = "SMD", data=fish, m1i=mean_high, m2i = mean_low, sd1i=sd_high, sd2i= sd_low, n1i = n_high, n2i=n_high, append = FALSE) 

#calculate ratio of means
ROM <- escalc(measure = "ROM", data=fish, m1i=mean_high, m2i = mean_low, sd1i=sd_high, sd2i= sd_low, n1i = n_high, n2i=n_high, append = FALSE) 

#combine the new information into your dataset
fish2 <- bind_cols(fish, SMD, ROM) 
 
# Have look at only the guppy's effect sizes that we just calculated
filter(fish2, genus == "Poecilia") %>%
  select(es_method, yi, vi,yi1, vi1)