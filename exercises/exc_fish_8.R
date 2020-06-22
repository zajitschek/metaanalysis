#Load libraries and data
library(metafor)
library(magrittr)
library(dplyr)
fish.all2 <- read.csv("./binder/data/Macartney2019_effectsize2_fish.csv")

fish.all2 %>% 
  arrange(., trait_measured) %>%
  rma(effect_size, variance, slab= paste(study_id, trait_measured, sep=", "), data = .) %>%
  forest(.)