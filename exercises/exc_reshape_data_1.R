###CODEBLOCK 2###

## In R script/code, everything to the right of a hashtag-sign in a line is 'commented out' and won't be executed by R ##

## Exercise: substitute the underscores below. To execute the code script, press 'Run Code' below. 

#Load libraries
library(dplyr)

data <- read.csv("./binder/data/data.csv")  #load the prepared data produced with metaDigitise. We name it 'data' here.

data$group <- c("c","t") #assign rows to control ("c") or treatment ("t)") codes (in this case its easy, but be careful)

#data #you check the result by deleting the hashtag in the first position
str(data) #check the result in the summary of the data structure (using function 'str')

tdata <- filter(data, group == "t") #extract treatment data rows

cdata <- select(filter(data, group == "c"), filename, group_id, mean, sd, n, se) #extract control data rows

data_new <- full_join(cdata, tdata, by = "filename") #join data

data_new <- select (data_new, -c(plot_type, error_type)) #remove unnecessary columns and overwrite data_new

str(data_new)
