#Load libraries and data
library(metafor)
fish.all2 <- read.csv("./binder/data/Macartney2019_effectsize2_fish.csv")

res.mod <- rma.mv(effect_size, variance, mods = ~ trait_category, slab= paste(study_id, trait_measured, sep=", "), data = fish.all2)
print(res.mod, digits= 2)
forest(res.mod)