###CODEBLOCK 6b###

## Load libaries and data
suppressMessages(library(dplyr))
suppressMessages(library(ggplot2))
library(compute.es)
fish <- read.csv("./binder/data/Macartney2019_processed_fish.csv")

# Calculation of Standardized Mean Difference (our Effect Size) as Cohen's d, 
# using function 'mes' from package compute.es
# The mes function of compute.es requires SD values. 
# Since we also have cases with SE, we calculate SD with the mes call below

## For all cases where SD is provided

fish.sd <- fish %>% 
    filter(sd_low>0) %>%
    #when calculating more than one value, 'id' has to be specified 
    #(id is just an individual identifier of each effect size)
    mes(m.1= mean_low, m.2= mean_high, sd.1= sd_low, sd.2= sd_high, n.1= n_low, n.2= n_high, id= effectsize_id, data= .) %>%
    select(effectsize_id = id, effect_size = d, variance = var.d)

## For all cases where SE is provided: SD is calculated from SE as sd = se * sqrt(n)

fish.se <- fish %>% 
    filter(is.na(sd_low) & is.na(f) & is.na(t)) %>%
    mes(m.1= mean_low, m.2= mean_high, sd.1= se_low*sqrt(n_low), sd.2= se_high*sqrt(n_high), n.1= n_low, n.2= n_high, id= effectsize_id, data= .) %>%
    select(effectsize_id = id, effect_size = d, variance = var.d)

## For one case where only an F-value is provided

fish.f <- fish %>% 
    filter(is.na(sd_low) & !is.na(f) & is.na(t)) %>%
    #We use function 'a.fes' instead of function 'fes' to be able to provide the data in our pipe; 
    #again, we have to specify 'id' to get the function to run
    a.fes(f = f, n.1 = n_low, n.2 = n_high, R= 0, q= 0, id= effectsize_id, data= .) %>%
    select(effectsize_id = id, effect_size = d, variance = var.d)

## For cases where only t-values are provided

fish.t <- fish %>% 
  filter(is.na(sd_low) & is.na(f) & !is.na(t)) %>%
  #We use function 'a.tes' instead of function 'tes' 
  #and we have to specify 'id' to get the function to run
  a.tes(t = t, n.1 = n_low, n.2 = n_high, R= 0, q= 0, id= effectsize_id, data= .) %>%
  select(effectsize_id = id, effect_size = d, variance = var.d)

## Combine data
 #join/merge calculated data with previous data; 
 #we start with data 'fish' here so that columns 'effect_size' and 'variance' 
 #will be added at the end, not in the beginning

fish.all <- left_join(fish,  
                      (bind_rows(fish.sd, fish.se, fish.f, fish.t) %>%   #combine all data
                      arrange(., effectsize_id)) )  #order by effectsize_id

#How many studies?
print(paste0("How many studies? ", length(unique(fish.all$study_id))))

#Which species and how many traits per species?
plot(fish.all$commonname_species, main= "Traits per species")

#Overall mean of effect sizes
print(paste0("Overall mean: ", mean(fish.all$effect_size)))

#Plot effect sizes per study (with variances as error bars)
ggplot(fish.all, aes(x= effectsize_id, y= effect_size, fill= trait_category)) + 
  geom_bar(stat="identity") +
  geom_errorbar(aes(ymin= effect_size-variance/2, ymax= effect_size+variance/2),
                width=.4) +
  facet_wrap(~ study_id, scale="free") +
  ggtitle("Effect sizes within study") 

