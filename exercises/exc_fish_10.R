#Load libraries and data
library(dplyr)
library(metafor)
fish.all2 <- read.csv("./binder/data/Macartney2019_effectsize2_fish.csv")
fish.all2 <- fish.all2 %>% arrange(., trait_category) #re-order by trait category

res.rand <- rma.mv(effect_size, variance, random = list(~ 1 | study_id, ~ 1 | effectsize_id, ~ 1 | genus), slab= paste(study_id, trait_measured, sep=", "), data = fish.all2)
print(res.rand, digits= 4)

I2 <- function(model){
    W <- solve(model$V) 
    X <- model.matrix(model)
    P <- W - W %*% X %*% solve(t(X) %*% W %*% X) %*% t(X) %*% W
    I2_total <- sum(model$sigma2) / (sum(model$sigma2) + (model$k - model$p) / sum(diag(P)))
    I2_each  <- model$sigma2 / (sum(model$sigma2) + (model$k - model$p) / sum(diag(P)))
    names(I2_each) = paste0("I2_", model$s.names)
    I2s <- c(I2_total = I2_total, I2_each)
    I2s
  }

print(I2(res.rand), digits= 3)