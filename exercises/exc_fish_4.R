###CODEBLOCK 8###

#Load libraries and data
suppressMessages(library(dplyr))
fish.all <- read.csv("./binder/data/Macartney2019_effectsize_fish.csv")

filter(fish.all, effect_size > 2) %>%
  select(author, year_published, study_id, trait_measured, effect_size, es_method, t,f)