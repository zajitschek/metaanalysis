###CODEBLOCK 3###

#Load libraries
suppressMessages(library(metafor))
suppressMessages(library(dplyr))

#We quickly re-create our 'new-data' object from above
data <- read.csv("./binder/data/data.csv") 
data$group <- c("c","t")
tdata <- filter(data, group == "t")
cdata <- select(filter(data, group == "c"), filename, group_id, mean, sd, n, se)
data_new <- full_join(cdata, tdata, by = "filename") #cdata=control first, denoted by .x; Weil2006 will be in the first row
data_new <- select (data_new, -c(plot_type, error_type))
select(data_new, c("filename", "mean.x", "mean.y"))

#Your first meta-calculation :-)

SMD <- metafor::escalc(measure = "SMD", data = data_new, m1i = mean.y, m2i = mean.x, sd1i = sd.y, sd2i = sd.x, n1i = n.y, n2i = n.x, append = FALSE) 
print("SMD:")
SMD

# Note: In 'data_new', 'treatment group' is coded as '1' and 'control' is '2'.            #
# We can therefore get a positive effect size for a larger investment in treatment group  #

ROM <- metafor::escalc(measure = "ROM", data = data_new, m1i = mean.y, m2i = mean.x, sd1i = sd.y, sd2i = sd.x, n1i = n.y, n2i = n.x, append = FALSE)
print("ROM:")
ROM


