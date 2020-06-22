#Load libraries and data
library(metafor)
fish.all2 <- read.csv("./binder/data/Macartney2019_effectsize2_fish.csv")

res.mod.rand <- rma.mv(effect_size, variance, mods = ~ trait_category, random = ~ 1 | study_id, slab= paste(study_id, trait_measured, sep=", "), data = fish.all2)
funnel(res.mod.rand)