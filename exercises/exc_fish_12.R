###CODEBLOCK 16###

#Load libraries and data
suppressMessages(library(metafor))
suppressMessages(library(dplyr))
fish.all2 <- read.csv("./binder/data/Macartney2019_effectsize2_fish.csv")
fish.all2 <- fish.all2 %>% arrange(., trait_category) #re-order by trait category

res.mod <- rma.mv(effect_size, variance, mods = ~ factor(trait_category)-1, random = list(~ 1 | study_id, ~ 1 | effectsize_id, ~ 1 | genus), slab= paste(study_id, trait_measured, sep=", "), data = fish.all2)

funnel(res.mod)