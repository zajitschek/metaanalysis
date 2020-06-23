#Load libraries and data
library(metafor)
fish.all2 <- read.csv("./binder/data/Macartney2019_effectsize2_fish.csv")

res.mod.rand <- rma.mv(effect_size, variance, random = list(~ 1 | study_id, ~ 1 | effectsize_id, ~ 1 | genus), slab= paste(study_id, trait_measured, sep=", "), data = fish.all2)
print(res.mod.rand, digits= 2)
forest(res.mod.rand)