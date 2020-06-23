---
title: 'Chapter 3: Meta-analysis'
description:
  'Data organisation & extraction, meta analysis & quality checks'
prev: /chapter2
next: /chapter4
type: chapter
id: 3
---

<exercise id="1" title="Preparation & organisation"> 

### _Based on Losia's data_extraction workshop material_
     
Once you have have a good collection of (neatly organised and stored) full-text papers (aim for at least 20 but no more than 200 to keep it manageable), you can start extracting the data. 


## Organising your data set   

Before you start extracting actual data for the meta-analysis you need a system to manage data extractions and store the data. For data extractions, many people just stick to Excel spreadsheets, or any other spreadsheets or extraction forms that can be converted into spreadsheets (e.g. Google Forms). 

Whatever you choose, you need a platform where you can easily add and edit columns and be able to store different types of data, so rigid systems purpose-built for medical trial data are not recommended. In this exercise we will stick an Excel spreadsheet.    

We will be using two papers from our literature search in Chapter 2, as examples for data organisation and to demonstrate how to extract the necessary information **[Weil2006.pdf](https://github.com/SusZaj/metaanalysis/blob/master/papers/Weil2006.pdf)** and **[Sadd2006.pdf](https://github.com/SusZaj/metaanalysis/blob/master/Sadd2006.pdf)**

**What would be a minimum set of columns needed in an Excel sheet for a meta-analysis?**
**(Remember, you need a separate column for each data/information type)** 
<choice id="1">
<opt text="No minimum"> 
Good thought,  and potentially what you'll be aiming for - but here we're thinking "what is the absolute minimum of columns that we need to be able to run a meta analysis?"
</opt>
<opt text="6">
What would they be? While we might have 6 or more columns in our data set, the minimum set can be smaller.
</opt>
<opt text="3"  correct="true"> 
Study ID (String of characters), effect size and its variance (if we want to run a simple weighted meta-analytic model; both numeric).
</choice>

**What other columns would be useful? Give examples of at least 5 other columns that could be added?** 
***Hint: Think about our previously worked through inclusion criteria and their more fine-scale categories! Try to formulate some examples before pushing the Example solution button.***
<choice id="2">
<opt text="Example solution" correct="true"> 
Publication details, study system / species, methodology, treatment levels, sample sizes, traits investigated, ...
</opt>
</choice>

In particluar this could be: 
  1. More detailed information on each study: author, title, journal, publication year.    
  2. Information on the study system or species (e.g. species name, taxonomic group, biological details relevant to the studied question, such as age or reproductive status of the study subjects).    
  3. Descriptive and test statistics for conversion into effect sizes.    
  4. Where did the information come from? e.g. Figure/Table number, page, raw data, etc. ; if multiple comparisons were reported in the original paper, which exact groups were compared. This will help you find it again should you need to double-check.     
  5. Methodology - when / where / which measurements/data collected, specific procedures, etc.   
  6. Comments and additional information 

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)   This refers to point 3 above: Most papers will not report effect sizes but descriptive and test (inferential) statistics that need to be converted into effect sizes. This means we need to extract data from which effect sizes can be calculated. For the Terminal Investment project, since we want to compare challenged and unchallenged groups, we will need to collect means and standard errors, sample sizes, or test statistic that can be converted into effect sizes. Each data type needs its own column, therefore we would need several columns, e.g.: mean_control, SE_control, SD_control, N_control, mean_treat, SE_treat, SD_treat, N_treat, test_stat_type, test_stat_value, df. 

We will show later on some different ways on how you may convert SEs to SDs, and Means and SEs (or SDs) to effect sizes, and how to covert information from test statistics into effect sizes.   


**What is the purpose of extracting additional variables?**
>Potentially, there can be a lot of information that could and should be extracted from the original papers and sometimes supplemented by information from other sources (databases, publications). Some of the information can be used as effect size moderators in the statistical models. Other information can be used to characterise the data set (e.g., is it dominated by particular taxon or experimental methodology?).

   


**What is wrong with this table representing a fragment of an extraction spreadsheet?**

| StudyID  | Species           | mean1 | SD 1           | N 1   | P       |
| -------- | ----------------- | ----- | -------------- | ----- | ------- |
| Weil2006 | Phodopus sungorus | 45.4  | 6.4          . | 10    | 0.023   |
| Sadd2006 | mealworm beetle   | NA    | not reported   | 8 - 9 | < 0.011 |

> - Non-informative column names (which group should be N 1 ?)
> - column names should be one string (word) 
> - second study has non-numerical values in the columns that should be numerical (NA is good for missing values, but should be used consistently - avoid "not reported")    
> - the "Species"" column is a mix of Latin and common names (should be all Latin)   
> - there is an extra dot in "6.4         .""


​     

**What is the use of the CohortID column in the extraction table below (just a fragment of a larger example extraction sheet)?**

| StudyID | CohortID | Species           | sex  | age  | mean_control | SD_control | N_control |
| ------- | -------- | ----------------- | ---- | ---- | ------------ | ---------- | --------- |
| One2019 | One2019F | Phodopus sungorus | F    | 60   | 3.6          | 1.3        | 10        |
| One2009 | One2019M | Phodopus sungorus | M    | 60   | 12.1         | 3.1        | 12        |
| One2019 | One2019F | Phodopus sungorus | F    | 120  | 8.3          | 2.2        | 10        |
| One2009 | One2019M | Phodopus sungorus | M    | 120  | 14.5         | 4.4        | 12        |

> CohortID is used to indicate that the same cohorts/group of animals, of different sex (F, M), were measured repeatedly at different ages (60 and 120). These are not independent data points, and this is captured by CohortID. For different study question this could be an unique identifier of various study sites or populations that need to be distinguished within and between studies.      


​      

**What is the use of the CohortID column in the extraction table below [no, this is not the exact same as above!]?**

| StudyID | CohortID  | Species           | trait | age  | mean_control | SD_control | N_control |
| ------- | --------- | ----------------- | ----- | ---- | ------------ | ---------- | --------- |
| Two2019 | Two2019a1 | Phodopus sungorus | calls | 60   | 3.6          | 1.3        | 10        |
| Two2009 | Two2019a1 | Phodopus sungorus | mass  | 60   | 12.1         | 3.1        | 12        |
| Two2019 | Two2019a2 | Phodopus sungorus | calls | 120  | 8.3          | 2.2        | 10        |
| Two2009 | Two2019a2 | Phodopus sungorus | mass  | 120  | 14.5         | 4.4        | 12        |

> CohortID is used to indicate that the same cohorts/group of animals were measured repeatedly for different traits (calls, mass) at different ages (60 and 120). These are not independent data points, and this is captured by CohortID.   



**What is the use of the CohortID column in the extraction table below?**   

| StudyID   | CohortID    | Species           | trait | age  | mean_control | SD_control | N_control |
| --------- | ----------- | ----------------- | ----- | ---- | ------------ | ---------- | --------- |
| Three2019 | Three2019s1 | Phodopus sungorus | calls | 60   | 3.6          | 1.3        | 10        |
| Three2009 | Three2019s1 | Phodopus sungorus | mass  | 60   | 12.1         | 3.1        | 12        |
| Three2019 | Three2019s2 | Phodopus sungorus | calls | 120  | 8.3          | 2.2        | 10        |
| Three2009 | Three2019s2 | Phodopus sungorus | mass  | 120  | 14.5         | 4.4        | 12        |

> CohortID is used to indicate that the same cohorts/group of animals representing two species were measured once for different traits (calls, mass). We can also use combination of StudyID and Species columns to take this into account during statistical analyses. 




**What is the use of the Control_grID column in the extraction table below (just a fragment of a larger example extraction sheet)?**   

| StudyID  | CohortID  | Control_grID | treatment | mean_control | N_control | mean_treatm | N_treatm |
| -------- | --------- | ------------ | --------- | ------------ | --------- | ----------- | -------- |
| Four2019 | Four2019a | Four2019c1   | virus     | 4.8          | 20        | 21.1        | 14       |
| Four2009 | Four2019b | Four2019c1   | bacteria  | 4.8          | 20        | 11.3        | 16       |
| Four2009 | Four2009a | Four2019c2   | virus     | 6.3          | 19        | 33.3        | 10       |
| Four2009 | Four2009b | Four2019c2   | bacteria  | 6.3          | 19        | 14.4        | 12       |

> Control_grID is used to indicate that the same control group was used as a comparator to two different cohorts/group that were subject to different types of (could also be levels) of experimental treatment (virus, bacteria). This can be visually confirmed by the identical values of means and sample sizes for the control group, but different ones for the treatment groups. The resulting effect sizes are not independent, but in a different way than if the same animals were measured for different traits or more than once for the same trait (rows 3 and 4). This non-independence is captured by combination of CohortID and Control_grID and could be taken into account in statistical models.   



**Why should we record meta-data when extracting data for a meta-analysis?**  

Meta-data are the detailed description of all extracted variables/columns and all other variables/columns derived from them. More specifically, they describe how the data were coded (e.g. the measurement units, how conversions were made,  e.g. whether sex was coded as "F" and "M" and "B" [and what these values/letters mean], how missing values were coded, and anything else that would allow you or somebody to extract and code the same data). 

Meta-data are an essential part of the documentation of your meta-analysis and extremely useful when the data are double-checked, re-analysed or re-used. It is good practice to start creating such documentation when you start extractions and coding. Update your file as you make changes and progress to analyses.       

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) In your actual extraction sheet/form, try to group related columns together. You can also color-code them in Excel or put them on the same tab/section in a visual database interface, if used. Your extraction form (spreadsheet) should be tested on several papers (pilot extractions) to make sure it is easy to use and captures necessary information.  


##  Background: Extracting and coding

**Is one person sufficient to extract the data?**  

> Ideally, two people would be extracting the data in parallel (independently, in duplicate), to minimise errors. However it is often not practical. In such case one person could be extracting and another person checking the extractions for mistakes.

   

**In what order would you extract your included studies? Random? Chronological? Any other?**  

<choice id="3">
<opt text="Random"> 
Possible.
</opt>
<opt text="Chronological">
Possible, but might introduce some bias.
</opt>
<opt text="Based on similarity"  correct="true"> 
It is often easier and quicker to group similar studies together. Especially, grouping the studies by study/system and research group helps find overlapping studies (e.g. where the same experiment was reported in separate publications, but focusing on different aspects) or collect more details on how studies were done. Also leaving complicated and odd studies for later on might be a good idea.   
</choice>


**When numerical data are reported in the text or tables, it is easy to get exact values for your extraction columns. However, often data are reported in the figures. Can we extract such data?**

<choice id="4">
<opt text="Yes"  correct="true">  
Exactly! Read on in the next section how to do this...
</opt>
<opt text="No">
Don't worry, even if the reults don't appear numerically but are represented in a figure we can extract them.
</choice>
    
    
    

**Is it always possible?**

> There are several pieces of software that helps digitising various types of plots and extracting the data (you can find a list [here](https://besjournals.onlinelibrary.wiley.com/doi/10.1111/2041-210X.13118), so it is often possible.  However, sometimes plot resolution can be too low, or data points / lines are overlapping and obscuring some of the values. In such case, you can try to contact the authors for the actual numbers or raw data used to make the plot.   

</exercise>





<exercise id="2" title="Extracting data from the literature">

Ideally, means and SD or SE as well as sampe sizes for your traits of interest are are provided in the paper that you are examining, and can simply be transcribed into your data collection sheet. More often, however, these results are represented in figures. At the most basic, you can enlarge the figure on your screen and measure means and SE's with a ruler (don't forget to convert your measurements according to the Figure's axes!), and add the crude results into your spreadsheet. This may be sufficient for the exercise here, but assuming that you will have many Figures from many studies, for your own meta analysis we recommend to follow the steps below.


![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)  
We will practice data extraction on few of the Terminal investment papers. We will use the R package *metaDigitise*.  

Detailed package description and tutorial are available on [cran](https://cran.r-project.org/web/packages/metaDigitise/vignettes/metaDigitise.html) or [github](https://github.com/daniel1noble/metaDigitise).  Read more about it in this [publication](https://besjournals.onlinelibrary.wiley.com/doi/10.1111/2041-210X.13118).    

Even though we promised no local R environment is needed - *metaDigitise* includes functionality that requires a local RStudio installation (i.e. you can't run it on here, only on your computer). If you want to install and load the R packages and libraries on your local computer and in RStudio, you can use the code below:

```
install.packages("devtools")
devtools::install_github("daniel1noble/metaDigitise")
install.packages("metaDigitise")
install.packages("tidyverse") 
install.packages("compute.es")

# Load the packages:
library(metaDigitise)
library(tidyverse)
library(compute.es)
```


## Extracting means and variances from plots: metaDigitise
**We will now guide you through the necessary steps on your local RStudio.**

Let's try to extract data from two of the selected papers:   

 1. Figure 2a in the paper by Weil et al. 2006: Immune challenge retards seasonal reproductive regression in rodents: evidence for terminal investment (**[Weil2006.pdf](https://github.com/SusZaj/metaanalysis/blob/master/papers/Weil2006.pdf)**)
 
 2. Figure 2a in the paper by Sadd et al. 2006: Modulation of sexual signalling by immune challenged male mealworm beetles (*Tenebrio molitor*, L.): evidence for terminal investment and dishonesty (**[Sadd2006.pdf](https://github.com/SusZaj/metaanalysis/blob/master/Sadd2006.pdf)**)   

You will need to open the pdf files and take the snapshots of the relevant figures (for Mac OS the keyboard shortcut is easiest: press Command+Shift+4 and then select the screen fragment; for Windows see [here](https://www.windowscentral.com/how-take-windows-10-screenshot-7-best-techniques). Make sure you capture the axes and axes labels. Also, enlarge these figures to fill the screen before taking the snapshot to get a higher resolution image.   

We did this as well and named the snapshot files, which you can see as smaller images below, as following (the numbering makes it easy to keep track of the figures being digitised)     

![](https://github.com/SusZaj/metaanalysis/blob/master/images/001_Weil_2006_Fig2a_small.png?raw=true)   
<br>
**001_Weil_2006_Fig2a.png**     

and   
<br>
![](https://github.com/SusZaj/metaanalysis/blob/master/images/002_Sadd_2006_Fig2a_small.png?raw=true)   
<br>
**002_Sadd_2006_Fig2a.png**   
<br>


We're back to organisational skills - and are placing our picture shots into a new folder - let's call it **metaDigitise_figures** (read more about organising your extraction directories in the "Setting up directory structures" [section](https://cran.r-project.org/web/packages/metaDigitise/vignettes/metaDigitise.html).   

To extract our two figures we need to provide the directory path name of the folder with the images to the *metaDigitise()* function, in our case:

``` 
data <- metaDigitise(dir = "data/metaDigitise_figures/") 
```

Tell *metaDigitise* you would like to process new images by selecting option "1" (type 1 in the console, not in the script; hit the 'Enter'-key to enter input choices to *metaDigitise*).

The next question is whether the plots are different or same - this is about the plot type and since we have a box plot and bar plot with means and SE, we can treat them as the same plot types, so enter "s" and for the next question "m" (for <u>m</u>ean and error).   

The first plot (**001_Weil_2006_Fig2a.png**) should be loaded at this stage in your local environment. We do not need to rotate the image, so enter "c".   

Now we can store the information about y-variable type - enter "testes volume (mm3)".   

First you are asked to calibrate the y-axis. To do this as precisely as possible, enlarge the plot viewer before clicking on the lowest and highest marked values (in this case, 200 and 900). Enter these values as prompted. The program will then show you your calibration and ask if you want to re-calibrate; if it looks accurate enough, click “n” to proceed, otherwise click “y” to try again.      

It is a good idea to enter sample sizes at this point. Since there is no such info in the plot or under the plot, search the full text for the sample sizes (hint: look in "Statistical analysis"). Ideally, to do this efficiently, you might already have extracted this and other available information into your spreadsheet, then saved the figures, and then come back at the end to process all the figures at once. This way you have everything at hand when you do data extraction from the figures.   

Once you have the information on the group names and sample sizes, enter an identifier for the control group ("saline") and sample size for this group.    

Since we have multiple data points for each group of animals, we have to decide whether to extract all of them or just one (or some subset) - your decision should be biologically-informed and ideally **a priori**. For this exercise we will extract just the last one (at 6 weeks). Click on the outer edge of the error bar of the last black point, and then click the middle of the black dot. If it went well you can add the treatment group "LPS" in a similar manner. If something went wrong you can delete and repeat the extraction.  

Once you extract data for the treatment group, select "Finish plot" (enter "f"), select "se" and continue "y" to move to the next image.   

Now you should be able to extract data from **plot 002_Sadd_2006_Fig2a.png** (hint: extract "treatment control" and "treatment" groups).

Once you get a "Congratulations" message, you can look at the extracted data. *metaDigitise()* stores and sorts all the summary data for each of the figures in the "data" object.  

You can add more figures in the directory and add more data to this data table later, or save it and load back later to continue adding more data or merge with other data frames (see "Re-importing previously digitised data and accessing raw data" in the *metaDigitise* [tutorial](https://cran.r-project.org/web/packages/metaDigitise/vignettes/metaDigitise.html).   

```
write.csv(data, file = "filename.csv") #adjust the file name and path as needed
```


As you see, *metaDigitise* guides you through the steps of data extraction from figures. It also nicely organises and stores the data for you. It may be well worth it to invest some extra time into learning this handy tool.       

</exercise>





<exercise id="3" title="Calculating effect sizes">

###  Converting different types of information   

We now have a few data points extracted, and could calculate effect sizes. What do we mean by that?

### What is an "effect size"?
>'Effect size' is a way to quantify the size of the difference between two groups. It is particularly valuable for quantifying the effectiveness of a particular intervention or treatment. It looks at the relative outcome of the treatment, and allows us to use this (and the associated measures of uncertainty) as the basis to compare multiple studies. This can make generalisations even across different methodologies and taxa possible. 
>
>A common effect size measure is the <u>s</u>tandardized <u>m</u>ean <u>d</u>ifference (SMD), calculated as the difference in means, standardized (divided) most commonly by the pooled SD of the two compared sets of data values (treatment and control). SMD comes in two versions: *Cohen's d* and *Hedges' g*. *Hedges' g* is an unbiased version of *Cohen's d*, but gives very similar results. If you have small sample sizes, use of  *Hedges' g* might be recommended.

But let's back off a bit again, we need to prepare our dataset first. In our example case, we compare pairs of measurements for control and treatment groups. It is convenient to have these in the same row in the data frame. Therefore, we first need to reshape our data frame.   

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)  
Since we have only 2 data points per file, it is easy to reshape the data frame in R.   

<codeblock id="reshape_data_1">
The <- arrow sign specifies a definition: e.g. if we want to define the variable 'EXAMPLE' by the number 1, we would write EXAMPLE <- 1. Executing 'EXAMPLE' will make R return a '1'. If you write 'data' and press enter on your local R (or the 'Run Code' button above on this website), the information stored under 'data' will be displayed.
</codeblock>


Now the columns appended with .x contain control groups data values, and these with .y are for the treatment groups (you can rename the columns to make it easier to see, e.g. using the *rename* [function](https://dplyr.tidyverse.org/reference/select.html).   

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)  
We will now use the *escalc* function from the **metafor** package to calculate effect sizes. This function allows to calculate various effect sizes or outcome measures (and the corresponding sampling variances) that are commonly used in meta-analyses, including two effect sizes that are relevant to our data and question:   

 * "SMD" stands for standardised mean difference, in *metafor* only available as Hedges' *g* (potentially also "SMDH" for heteroscedastic variances).   
 
 * "ROM" for the log transformed ratio of means (Hedges et al., 1999; Lajeunesse, 2011), also named lnRR.   

We calculate these as follows:   

<codeblock id="effect_sizes_1">
No hints needed.
</codeblock>

The metafor code on its own looks like this:
```
SMD <- metafor::escalc(measure = "SMD", data=data_new, m1i=mean.y, m2i = mean.x, 
            sd1i=sd.y, sd2i= sd.x, n1i = n.y, n2i=n.x, append = FALSE) 
ROM <- metafor::escalc(measure = "ROM", data=data_new, m1i=mean.y, m2i = mean.x, 
            sd1i=sd.y, sd2i= sd.x, n1i = n.y, n2i=n.x, append = FALSE)
```


**What should you do next?**   

It would be good to merge these values back to the data frame.   

```
data_new <- bind_cols(data_new, SMD, ROM) #bind data
data_new
```
<br>

## What if I can't get means & variances from plots?

With these two papers we just extracted, we had a relatively easy job. There were descriptive statistics values reported in the plots. If we cannot get means and standard errors (or SD) from the text, tables and figures (or already-calculated effect sizes, which is still rare), we can look for test (inferential) statistics.   

Test statistics that are usable include t-values (from t-tests), F-values, Chi-square values, and p-values. These values from simple statistical tests (like independent or paired t-tests) are easily convertible into SMD (*d*, *g*) or r (correlation coefficient).   

These conversions and some others can be calculated in R (see below), but we will start with this web-based **[Practical Meta-Analysis Effect Size Calculator](https://campbellcollaboration.org/research-resources/effect-size-calculator.html)**.

## Calculating effect sizes from inferential statistics: online calculator

Open the just mentioned [webpage](https://campbellcollaboration.org/research-resources/effect-size-calculator.html). You see the available effect sizes (*d*, *r*, *OR* and *RR*). When you click on them, the type of data available for computing the effect size is shown.

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)    
[Weil (2006)](https://github.com/SusZaj/metaanalysis/blob/master/papers/Weil2006.pdf) reports in the results: "At the end of the experiment saline-injected animals had smaller testes (F 1,27 = 4.6875, p<0.05, figure 2b)" and in the methods it is noted these are calculated using ANOVA.   


Use the web-based **[Effect Size Calculator](https://campbellcollaboration.org/research-resources/effect-size-calculator.html)** sheet and selecting "Standarized Mean difference (d)" and "F-test, 2 groups" to calculate *d* from one-way ANOVA (you will need F-value and sample sizes of treatment and control groups).   

You should get *d* for the testes mass that is close to what we calculated for testes volume from Fig2a. Note that this web calculator provides confidence intervals (CI) and variance for the calculated effect sizes. 

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)    
Using the web-based **[Effect Size Calculator](https://campbellcollaboration.org/research-resources/effect-size-calculator.html)**, estimate a few other effect sizes using test (inferential) statistics reported in **[Sadd2006.pdf](https://github.com/SusZaj/metaanalysis/blob/master/papers/Sadd2006.pdf)**.   

## Calculating effect sizes from inferential statistics: using *compute.es* in R
If you are comfortable with R, then it is preferable to calculate your effect sizes here, because the online app cannot document our calculations. The R package *compute.es* allows us to not only compute various effect sizes from descriptive statistics, but also from inferential statistics.   

The *compute.es* function inputs and names are as follows:   
> * ANCOVA F-test: "a.fes()""   
> * ANCOVA means: "a.mes()"   
> * ANCOVA means (pooled sd): "a.mes2()"   
> * ANCOVA p-value: "a.pes()"    
> * ANCOVA t-test: "a.tes()"   
> * Chi-squared (1 df): "chies()"   
> * Correlation: "res()"    
> * d-statistic: "des()"    
> * Failure group (binary): "failes()"    
> * F-test: "fes()"   
> * Log odds ratio: "lores()"    
> * Means: "mes()"    
> * Means (pooled sd): "mes2()"   
> * Proportions (binary): "propes()"    
> * p-value: "pes()""    
> * t-test: "tes()""    

To learn more see the package vignette or [R documentation](https://www.rdocumentation.org/packages/compute.es/versions/0.2-5/topics/compute.es-package)    

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)    
As an example, we will use the F-value, calculated above from [Weil2006.pdf](https://github.com/SusZaj/metaanalysis/blob/master/papers/Weil2006.pdf). As a reminder: that was an ANOVA (F 1,27 = 4.6875, p<0.05, figure 2b). Note that functions from the *compute.es* packages automatically calculate all available effect sizes for the given input and if you run it on a data frame it will generate a new data.frame with several effect size estimates. Try:   

<codeblock id="effect_sizes_2">
Remember: F = 4.6875, N treat = 28, N control = 10. "R"" is the covariate correlation and "q" the" number of covariates (we have none in ANOVA).
</codeblock>

<br>
<br>

**If both descriptive statistics (mean, SE or SD) and test (inferential) statistics are reported, which one should we extract from a paper?**   
>We usually give priority to descriptive statistics (mean, SE or SD), which usually represent raw data, unadjusted for other variables and also can be converted to different units or used to calculate alternative types of effect sizes.   

<br>
<br>

**Is the sign of the effect size important? Imagine we use *d*, which represents mean_treatment - mean_control group trait values. How we would interpret *d* = 0.5 and how we would interpret *d* = -0.5?**   
>The sign represents direction of the effect on a given trait. *d* = 0.5 means that the trait value in the treatment group is moderately larger than the trait value in the control group, *d* = -0.5 would mean that the trait value in the treatment group is moderately smaller than the trait value in the control group.   

<br>
<br>

**If we have different traits in the data set (let's say number of eggs laid and probability of nest abandonment) what is the problem with the signs of effect sizes for these traits? What should we do about this?**   
>Larger numbers of eggs indicate increased reproductive effort (and thus reproductive investment), while increased probability to abandon the nest indicates reduced reproductive effort. This would translate to negative effect size sign if treatment group is less likely to abandon the nest. To fix this we need to reverse the sign of the effect sizes for traits where increased trait values represent LESS reproductive investment, so we have consistent biological interpretation over the whole data set.   



</exercise>



<exercise id="4" title="Meta-analysis, evidence summary & assessment of certainty">

Once all the data are prepared, we can run our first meta-analytical model and assess the overall effect that we are interested in, across studies. We will assess the effect based on the model summary and, visually,  with forest plots. Since we probably have other variables that could potentially explain variation in our data, we will try to account and test some of these other variables in slightly more complex models. 

We are most interested in being able to make a statement on differences between treatment and control which are based on differences in biological response, and not on methodological or other technical differences between studies or study types, for example. We will go through some ways of assessing the influence of heterogeneity in our data, and whether we have any indication of publication bias in our data set.    

​    

This is all best done hands-on:

# Worked Example

Using a subset of data (we decided to only go for fish) from a recent meta-analysis that investigated the relationship of dietary intervention on sperm traits across the animal kingdom (MacCartney et al. 2018), we will go through the steps explained previously.

We are using the fish data that Erin had already collected - i.e. all relevant data have already been either extracted from the figures, or calculated from inferential statistics. This means we have a detailed datasheet available that contains a lot of information, but most importantly sample sizes, means and variances for control and treatment groups, for quite a range of different sperm traits. We have prepared this in such a way that we can use this to start from calculating effect sizes.

​    

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)  
We downloaded the two deposited data files from osf.io and created a file that we will use here ([click here](https://github.com/SusZaj/metaanalysis/blob/master/binder/data/Macartney2019_processed_fish.csv) to see / download the source .csv from github). Alternatively, run the code block - but that may look a little messy, especially if you are not used to investigating the data structure of files in R yet

<codeblock id="fish_1">
Most of the variables will be self explanatory. Some aren't. We describe the ones that are important for our analysis below in more detail.
</codeblock>

Some variables are artefacts and we will leave them in the data set, but won't explain them further. 

| Variable name                          | Description                                        |
| -------------------------------------- | -------------------------------------------------- |
| *author* to *volume*                   | Publication information of specific studies        |
| *commonname_species* to *species_name* | Study organism identification                      |
| *trait_measured* and *trait_unit*      | Trait information                                  |
| *trait_category*                       | (see description below this table)                 |
| *mean_low* to *n_high*                | Descriptive statistics (extracted from literature) |
| *f* and *t*                | Inferential statistics (extracted from literature) |
| *es_method*                | Descriptive / inferential |
| *effect_size_id*              | Consecutive numbers for data manipulation (1 to 37)  |

** *Trait category* description**

| ID number | Category                   |
| --------- | ------------------------------- |
| 1|    bodysize      |
| 2|    sperm length      |
| 3|    spermatophore/testis size      |
| 4|    sperm movement (velocity, % motile)      |
| 5|    sperm number      |
| 6|    sperm viability (alive vs dead, normal vs abnormal)      |
| 7|    seminal protein quantity and accessory gland size    |

As said above, before we can analyse these data, we have to calculate the effect sizes. We will use the library *compute.es* to calculate SMD as *Cohen's d*. We have four different types of data to base our calculations on: 1) Descriptive statistics with SD, 2) Descriptive statistics with SE, 3) F-values (inferential statistic), and 4) t-values (inferential statistic). 

Different packages have different requirements in input variables and in syntax. *compute.es* requires SD and doesn't take SE. That's why we have to calculate SD from SE in one of the steps (you can find the simple formula in the code below - ). 
It also turns out that *compute.es* needs an id variable to do calculations for more than one provided value, which we provide (<pre>`id= effect_size_id`</pre>). You'll find yourselves in situations where something might not work immediately. Even the R package manual might not be able to help. Due to the huge R user base, you can often find solutions to very specific problems by googling them. Sometimes you have to find the solution yourself, by trying out possible versions. This was the case for us with the need to provide the id-argument in the following code (you can try what happens when you leave it out).

<codeblock id="fish_2">
No hints or solution necessary here.
</codeblock>

You will notice that you will not get any "output" here - that is because we haven't asked for any. You could look at the data by adding a last line: "str(fish.all)" or just call: "fish.all"

Let's run a first model. This is called a random effects model (in contrast to a fixed effects model, which is unlikely to be used by you and will therefore not be discussed here).

<codeblock id="fish_3">
No hints or solution necessary here.
</codeblock>

Nice, but before we go further: what about that value around 3? Whenever there seem to be outliers, always check. Sometimes it's biological,
but very often outliers turn out as errors (e.g. through mistakes in data entry or data re-coding)
Let's look at this data point, labelled (wrongly so far) study 23 then:

<codeblock id="fish_4">
No hints or solution necessary here.
</codeblock>

This is the only study with a provided F-value test statistic. Since F values are the ratios of two variances, they have to be positive.
This means we wouldn't be able to see a negative effect size for this statistic. We have to go back and see what was exactly done, and then tested in this study to add information to the F-value on whether it refers to a increase or a decrease in trait size (here: body mass).

O'Dea did xxx, so to have the same direction of effect as in the other studies that used means and SD/SE, we have to change sign.
Before we do that, what about the other effect sizes that we calculated based on inferential test statistics?

<codeblock id="fish_5">
No hints or solution necessary here.
</codeblock>

*t*-values can be negative (they are the difference between treatment and control means, divided by SE). However, are the means ordered in the same way as are our other mean to calculate teh difference, i.e. mean(low treatment) - mean(high/control treatment)? We have to check in Evans 2017.
It turns out that we have to change the sign of those effect sizes as well.

We can do this like this:

<codeblock id="fish_6">
No hints or solution necessary here.
</codeblock>

Now, let's start again and re-run the first meta-analysis. Let's also correct the labels (using the *slab* argument in the *rma* function call.

<codeblock id="fish_7">
No hints or solution necessary here.
</codeblock>

To see the results grouped by trait, instead of grouped by study, we can re-order the data and print (here without saving the data in the other format)

<codeblock id="fish_8">
No hints or solution necessary here.
</codeblock>

Add predictor / moderator variables. Here, we want to know whether traits in different *trait categories* respond differently to diet manipulation. We simply add: <code>mods = ~ trait_category</code>.

<codeblock id="fish_9">
No hints or solution necessary here.
</codeblock>

Add nested random effects to account for non-independence of data, here due to traits having been measured in the same study. We add <code>random = ~ 1 | study_id</code>.

<codeblock id="fish_10">
No hints or solution necessary here.
</codeblock>

Publication bias is commonly observed in academic research. This is due to the fact that studies with significant results are often more likely to be published than studies with null results (despite equal quality of execution and design).

Publication bias can be assessed visually with funnel plots. If there is no indication of publication bias, studies (shown as single dots) will be plotted in a funnel shaped distribution. A deviation from this shape can indicate publication bias.

<codeblock id="fish_11">
No hints or solution necessary here.
</codeblock>







## 



</exercise>



<exercise id="5" title="Report and interpret results">

# Documentation and reporting

As you hopefully remember, the PRISMA checklist is a document that helps ensure you report the key information on how a systematic review (including meta-analysis) was done.    

Have a look again at the [PRISMA checklist](http://prisma-statement.org/documents/PRISMA%202009%20checklist.pdf). **Find and read the items that are related to what we have covered in this exercise. What are the numbers (in the # column) of these items?**      

<choice id="1">
<opt text="Answer" correct="true"> 
Items 10: Data collection process: Describe method of data extraction from reports (e.g., piloted forms, independently, in duplicate) and any processes for obtaining and confirming data from investigators.   

11: Data items: List and define all variables for which data were sought (e.g., PICOS, funding sources) and any assumptions and simplifications made;    
18: Study characteristics: For each study, present characteristics for which data were extracted (e.g., study size, PICOS, follow-up period) and provide the citations; and we start started to have a stab at     
20: Results of individual studies: For all outcomes considered (benefits or harms), present, for each study: (a) simple summary data for each intervention group (b) effect estimates and confidence intervals, ideally with a forest plot.
</opt>
</choice>


![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  It is worth noting that PRISMA was designed for medical systematic reviews, and some items are not very relevant or useful for Biological meta analyses.   
<br>

Although not mentioned in the original PRISMA checklist, it is important to share the collected data, meta-data and analysis code. Generally speaking, this is for transparency, reproducibility and giving back to the community.   
<br>

The full-text screening of your includes studies should have given you a very solid overview over the general background of your research question - so summarising this into a polished paper should be easy
![](https://github.com/SusZaj/metaanalysis/blob/master/images/wink.png?raw=true) 

</exercise>