#Load libraries and data
library(magrittr)
library(dplyr)
fish.all <- read.csv("./binder/data/Macartney2019_effectsize_fish.csv")

fish.all2 <- bind_rows(fish.all %>% 
  filter(es_method != "Inferential"), 
  fish.all %>%
  filter(es_method == "Inferential") %>%
  mutate(effect_size = effect_size * (-1)) ) %>%
  arrange(., study_id)

options(max.print= 10000)
fish.all2