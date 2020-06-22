#Load libraries and data
library(dplyr)
fish.all <- read.csv("./binder/data/Macartney2019_effectsize_fish.csv")

filter(fish.all, es_method == "Inferential")