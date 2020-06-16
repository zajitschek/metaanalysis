---
title: 'Chapter 1: Getting started: Introduction to Meta-Analysis'
description:
  'This chapter will introduce where meta-analysis fits into the scientific method, give some background, and examples.'
prev: null
next: /chapter2
type: chapter
id: 1
---

<exercise id="1" title="Preface & Disclaimer">

Please have patience with us while we build this online resource - it's brand new and nowhere near finished!
Apologies if exercises and questions may not work (yet), this is an ongoing project.   
Please check back a little later if things aren't performing as they should... 
Thanks!

# About this course

Hi and welcome, I am **[Susi Zajitschek](https://www.ljmu.ac.uk/about-us/staff-profiles/faculty-of-science/school-of-biological-and-environmental-sciences/susanne-zajitschek), a Senior Lecturer in Animal Behaviour at Liverpool John Moores University**. This course is meant mainly as a primer for students who would like to know more about meta-analysis. I will give you an overview on what meta-analyses are and on why they are useful. I will include hands-on exercises to conduct meta-analyses, step-by-step (based on material developed by my collaborators **[Shinichi Nakagawa](http://www.i-deel.org/shinichi-nakagawa.html)** and **[Malgorzata  Lagisz](https://mlagisz.weebly.com/)**). The actual statistical analyses will be performed in the [software R](https://www.r-project.org/about.html), and you will have the opportunity to run R software scripts right here, on this website, without the need to install software on your computer.

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) Please note, if you plan on actually doing a meta-analysis yourself, beyond just going through this exercise, you will have to download R or [R studio](https://rstudio.com/products/rstudio/download/), if you haven't already. 

# How do use this resource

The main content has been split into three Chapters. In Chapters 2 and 3  I will explain the structure and processes involved in conducting a meta-analysis from conception to write-up. 

Chapter 4 gives an overview over different methods to build your phylogeny, in case your meta analysis spans across different taxa. 

You will also have the opportunity to perform steps directly in R, without having to open it locally. This will look like this grey block below.  

<codeblock id="intro_1">
Write your name where the dotted line is!
</codeblock>

Just click on the "Run Code" button and see what happens. 
You can also use the "Show hints", "Show solution" and "Reset" tabs. Don't worry about doing in anything "wrong" - you will not be breaking these code blocks! You can also use these blocks to calculate whatever else you think of - try for example writing "1+1", and run it again! (For advanced R users - you can't import your own datasets, but of course could add them manually!)


Each section may contain links to online resources, such as this [link to google scholar](https://scholar.google.com/), Questions to answer (including feedback on getting it right or wrong), and tasks to do on your own - as indicated by this laptop icon  ![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true). If we think we have a particuarly useful note or resource, you will see this pushpin  ![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true).
<br>

Please note, this is meant as a quick primer to give you some overview of how a meta-analysis is done. Perhaps it will be a student project, but  perhaps it may serve as a starting point for you if you're planning on doing your own, publishable and solid meta-analysis. If that's the case, I'd highly recommend to check out some of the additional resources that are out there. For a small collection of free resources please see the relevant section in Chapter 4.

</exercise>

<exercise id="2" title="Introduction">

# WHAT IS A META-ANALYSIS and WHY TO META-ANALYSE?   




## A short side-trip to the roots of knowledge

Humans strive to understand the world. The organized framework to do this is science, more specifically the *[scientific method](https://en.wikipedia.org/wiki/Scientific_method)*. Science is cumulative in nature. This means that studies and experiments build upon the findings of previous studies and experiments. New scientific insights might be gained by a more or less progressive accumulation of knowledge about a specific question, adding on to existing knowledge. Or, according to [Thomas Kuhn](https://en.wikipedia.org/wiki/Thomas_Kuhn), real progression in science might require [paradigm shifts](https://en.wikipedia.org/wiki/Paradigm_shift) that throw old theories over board and make way for new better theories. These shifts in how we explain the world depend themselves on the accumulation of results, which did not fit the old established theories, but which turned out to be not due to error of any kind (for example methodological mistakes or human error in performing studies).

## What makes a successful scientific theory?

We are talking about empirical research here, meaning results from studies and experiments that are based on observations. But what is the criterion that scientists use to accept a scientific theory as the currently most successful theory to explain observed phenomena?

- A successful scientific theory should give a good explanation and make accurate predictions
- This should be the case in a wide range of circumstances, i.e. it shouldn't be hyper-sensitive to natural variation in traits that are not the direct focus of the studies

Different scientific disciplines will have different criteria for how we define *good explanation*, *accurate prediction*, *sensitive*, and *natural variation* that I used above.
This self-guided course is mainly focussed on research in biological sciences. My own research involves the study of animal behaviour, which often has a high level of noise in the data, especially when compared to some studies in physics or geology (if interested, read up on the colloquial terms of soft and hard sciences, e.g. [here](https://en.wikipedia.org/wiki/Hard_and_soft_science)). 

# Meta-analysis can help

We established that science works cumulatively. To gain support for specific hypothesis, we do not want to rely on the outcome of single studies. We can try to combine the knowledge gained in multiple studies which tested specific traits of interest. This can be achieved while still taking into account that studies differ in their quality and their size, for example, lending different levels of weights to their results. 

This combination of multiple test results can be achieved by qualitatively summarising previous work on a specific subject. Classically, this was done in a literature review, for example at the beginning of a graduate or postgraduate degree. While this type of review has still its merit (especially if it is done ***systematically***), we want to introduce you here to the meta-analytical approach (which sctrictly specaking is a **quantitative systematic review**), which can provide a quantitative summary and test of specific research questions (the Greek prefix *meta* (μετά, "after" or "beyond") means *more comprehensive*).

</exercise>

<exercise id="3" title="Overview: the structure of a meta-analysis and some examples">

# Overview

We will take the paper [Nakagawa 2017](https://bmcbiol.biomedcentral.com/articles/10.1186/s12915-017-0357-7) as a blueprint to walk you through all the steps of a meta-analysis.

However, as this is meant as a first step to get you started, we will provide some additional resources, exercises and guidelines (Chapters 2, 3 and 4). This includes a section on phylogenetic trees (which you may need if the question you're planning on tackling spans across different species - quite likely to happen if you're a evolutinary biologist, and the "question" more important than a particular taxon. This will be covered in Chapter 4). To keep things simple initially, we will leave the phylogenies aside and go over the first steps: how  to narrow your question, how to find relevant literature, how to make decisions on which studies to include, how to extract the relevant info from your selected papers, and run the actual meta-analysis. We'll explain how to interpret the output and plot your results. 

We hope to also help to improve your organisational skills - as for all of the above it will be really important to carefully keep track & record of all your steps and decisions. This is necessary to make your meta-analysis reproducible and understandable, for whoever will be reading the resulting work. 

Here is a list of the different parts of a meta-analysis, and where to find the respcetive bits in this book:

![](https://github.com/SusZaj/metaanalysis/blob/master/images/overview.png?raw=true)
<br>
<br>
All of these steps have to be described and laid out in a protocol. We will see that there already exist general protocols for each step, which we can use and adapt to our research questions. The aim of having well defined protocols is for other researchers to be able to reproduce those steps. 

Protocols are necessary to minimize any bias that we might introduce - either knowingly, but most often unknowingly - into the decisions that have to be taken at each meta-analysis step. Bias might already be present in how the research question we want to tackle is phrased. Furthermore, bias can originate in the specific way we search for literature, both in where we search (for example, which databases we use, or whether we only include published results), and how we search (for example our choice of search terms).

The following diagram shows a more in depth overview, starting from the literature search (Figure 1 from Nakagawa et al. 2017). 

![](https://github.com/SusZaj/metaanalysis/blob/master/images/Nakagawa_etal_Fig1.gif?raw=true)
<br>
<br>

**Some examples**. You can have a glance and see what questions were asked and how the results are presented. Especially the first in the list (Macartney et al. 2019) is a very good example, with protocols, data, and R code published and made freely available (see *Data & R Code* below):

- [Effects of nutrient limitation on sperm and seminal fluid: a systematic review and meta‐analysis (Macartney et al. 2019)](http://www.bonduriansky.net/Macartney_et_a_2019_Biological_Reviews.pdf) [Data & R code on osf.io](https://osf.io/aqw8u/)
- [The repeatability of behaviour: a meta-analysis (Bell et al. 2009)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3972767/).
- [Individual differences in behaviour explain variation in survival: a meta‐analysis (Niemelä & Dingemanse 2018)](https://royalsocietypublishing.org/doi/10.1098/rspb.2017.2823).
- [The effect of dietary restriction on reproduction: a meta-analytic perspective (Moatt et al. 2016)](https://bmcevolbiol.biomedcentral.com/articles/10.1186/s12862-016-0768-z).

**Meta-analysis and research synthesis: an outlook**

- [Research Weaving: Visualizing the Future of Research Synthesis](https://ecoevorxiv.org/ga2qz/)

**Key reference for how to conduct a meta-analysis**

- [Meta-evaluation of meta-analysis: Ten appraisal questions for biologists](https://bmcbiol.biomedcentral.com/articles/10.1186/s12915-017-0357-7)

</exercise>
