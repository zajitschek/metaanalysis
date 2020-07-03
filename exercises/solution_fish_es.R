###CODEBLOCK 4###

## Load libaries and data
suppressMessages(library(dplyr))
suppressMessages(library(ggplot2))
library(compute.es)
fish <- read.csv("./binder/data/Macartney2019_processed_fish.csv")

## Calculate effect size based on T statitsic

fish.t <- fish %>% 
  filter(is.na(sd_low) & is.na(f) & !is.na(t)) %>%
  #We use function 'a.tes' instead of function 'tes' to be able to provide the data in our pipe; 
  # we have to specify 'id' to get the function to run
  a.tes(t = t, n.1 = n_low, n.2 = n_high, R= 0, q= 0, id= effectsize_id, data= .) %>%
  select(effectsize_id = id, effect_size = d, variance = var.d)

fish.t