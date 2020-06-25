---
title: 'Chapter 3: Data extraction & preparation'
description:
  'We have the papers- what now?'
prev: chapter2
next: chapter4
type: chapter
id: 3
---

<exercise id="1" title="Getting the data from the literature">

So what happens after you have collected all the papers you would like to get started?

What information do you need to extract?

And how can you do it?


Ideally, means and SD or SE as well as sampe sizes for your traits of interest are are provided in the paper that you are examining, and can simply be transcribed into your data collection sheet. More often, however, these results are represented in figures. At the most basic, you can enlarge the figure on your screen and measure means and SE's with a ruler (don't forget to convert your measurements according to the Figure's axes!), and add the crude results into your spreadsheet. This may be sufficient for the exercise here, but assuming that you will have many Figures from many studies, for your own meta analysis we recommend to use the R package *metaDigitise*.



</exercise>

<exercise id="2" title="Preparing your data for Meta-analysis">


If you have a few data points extracted (either form Figures or Tables), you can now calculate effect sizes. What are they, and how do I get them?

### What is an "effect size"?
>'Effect size' is a way to quantify the size of the difference between two groups. It is particularly valuable for quantifying the effectiveness of a particular intervention or treatment. It looks at the relative outcome of the treatment, and allows us to use this (and the associated measures of uncertainty) as the basis to compare multiple studies. This can make generalisations even across different methodologies and taxa possible. 
>
>A common effect size measure is the <u>s</u>tandardized <u>m</u>ean <u>d</u>ifference (SMD), calculated as the difference in means, standardized (divided) most commonly by the pooled SD of the two compared sets of data values (treatment and control). SMD comes in two versions: *Cohen's d* and *Hedges' g*. *Hedges' g* is an unbiased version of *Cohen's d*, but gives very similar results. If you have small sample sizes, use of  *Hedges' g* might be recommended.

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)  
We canw use the *escalc* function from the **metafor** package to calculate effect sizes. This function allows to calculate various effect sizes or outcome measures (and the corresponding sampling variances) that are commonly used in meta-analyses, including two effect sizes that are relevant to our data and question:   

 * "SMD" stands for standardised mean difference, in *metafor* only available as Hedges' *g* (potentially also "SMDH" for heteroscedastic variances).   

 * "ROM" for the log transformed ratio of means (Hedges et al., 1999; Lajeunesse, 2011), also named lnRR.   

We calculate these as follows:   

***coming soon***


## Calculating effect sizes from inferential statistics

The R package *compute.es* allows us to not only compute various effect sizes from descriptive statistics, but also from inferential statistics. We will go over this usinh Macartney's data.

***coming soon***

</exercise>