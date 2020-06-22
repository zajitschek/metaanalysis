#Load libraries
library(metafor)
library(dplyr)

#We quickly re-create our 'new-data' object from above
data <- read.csv("./binder/data/data.csv") 
data$group <- c("c","t")
tdata <- filter(data, group == "t")
cdata <- select(filter(data, group == "c"), filename, group_id, mean, sd, n, se)
data_new <- full_join(cdata, tdata, by = "filename")
data_new <- select (data_new, -c(plot_type, error_type))

#Your first meta-calculation :-)

SMD <- metafor::escalc(measure = "SMD", data = data_new, m1i = mean.y, m2i = mean.x, sd1i = sd.y, sd2i = sd.x, n1i = n.y, n2i = n.x, append = FALSE) 
SMD

# Note: In 'data_new', 'treatment group' is coded as '1' and 'control' is '2'.            #
# We can therefore get a positive effect size for a larger investment in treatment group  #

ROM <- metafor::escalc(measure = "ROM", data = data_new, m1i = mean.y, m2i = mean.x, sd1i = sd.y, sd2i = sd.x, n1i = n.y, n2i = n.x, append = FALSE)
ROM


