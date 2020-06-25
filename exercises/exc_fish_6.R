###CODEBLOCK 10###

#Load libraries and data
suppressMessages(library(dplyr))
fish.all <- read.csv("./binder/data/Macartney2019_effectsize_fish.csv")

fish.all2 <- bind_rows(fish.all %>% 
  filter(es_method != "Inferential"), 
  fish.all %>%
  filter(es_method == "Inferential") %>%
  mutate(effect_size = effect_size * (-1)) ) %>%
  arrange(., study_id)

filter(fish.all2, es_method == "Inferential") %>%
  select(author, year_published, study_id, genus, trait_measured, effect_size, es_method, t,f)