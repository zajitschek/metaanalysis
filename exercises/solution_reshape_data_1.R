## In R script/code, everything to the right of a hashtag-sign in a line is 'commented out' and won't be executed by R ##

## Exercise: substitute the underscores below. To execute the code script, press 'Run Code' below. 

#Load libraries
library(tidyverse)

data <- read.csv("./binder/data/data.csv")  #load the prepared data produced with metaDigitise. We name it 'data' here.

data$group <- c("c","t") #assign rows to control ("c") or treatment ("t)") codes (in this case its easy, but be careful)

data #check the result by looking at the whole data set you created
str(data) #check the result in the summary of the data structure (using function 'str')

tdata <- filter(data, group == "t") #extract treatment data rows
tdata  #look at tdata to check

cdata <- select(filter(data, group == "c"), filename, group_id, mean, sd, n, se) #extract control data rows
cdata #look at cdata to check

data_new <- full_join(cdata, tdata, by = "filename") #join data
data_new  #look at the joined data to check

data_new <- select (data_new, -c(plot_type, error_type)) #remove unnecessary columns and overwrite data_new
data_new
