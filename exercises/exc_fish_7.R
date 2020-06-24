###CODEBLOCK 11###

#Load libraries and data
suppressMessages(library(metafor))
fish.all2 <- read.csv("./binder/data/Macartney2019_effectsize2_fish.csv")

res2 <- rma(effect_size, variance, slab= paste(study_id, trait_measured, sep=", "), data = fish.all2)
print(res2, digits= 2)
forest(res2)