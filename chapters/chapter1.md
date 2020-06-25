---
title: 'Chapter 1: Getting started: Introduction to Meta-Analysis'
description:
  'This chapter will introduce where meta-analysis fits into the scientific method, give some background, and examples.'
prev: null
next: null
type: chapter
id: 1
---

<exercise id="1" title="Preface & Disclaimer">

We are currently restructuring this - which means this course will not be online & working for some time. Apologies to those who participated in the online workshop this morning - please get in touch and I will send you the material I introduced! s.r.zajitschek[@]ljum.ac.uk

Thanks!

# About this course

Hi and welcome, I am **[Susi Zajitschek](https://www.ljmu.ac.uk/about-us/staff-profiles/faculty-of-science/school-of-biological-and-environmental-sciences/susanne-zajitschek), a Senior Lecturer in Animal Behaviour at Liverpool John Moores University**. This course is meant mainly as a primer for students who would like to know more about meta-analysis. I will give you an overview on what meta-analyses are and on why they are useful. I will include hands-on exercises and step-by-step examples on how to conduct meta-analyses. 

**please get in touch and I can provide associated material while this is not running! s.r.zajitschek[@]ljum.ac.uk**

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

This is meant as a first step to get you started.  Here's an overview over the workflow:

![](https://github.com/SusZaj/metaanalysis/blob/master/images/overview2.png?raw=true)
<br>
<br>
As just mentioned, all of these steps have to be described and laid out in a protocol. 

Protocols are necessary to minimize any bias that we might introduce - either knowingly, but most often unknowingly - into the decisions that have to be taken at each meta-analysis step. Bias might already be present in how the research question we want to tackle is phrased. Furthermore, bias can originate in the specific way we search for literature, both in where we search (for example, which databases we use, or whether we only include published results), and how we search (for example our choice of search terms).

The following diagram (Figure 1 from Nakagawa et al. 2017) shows a more in depth overview over steps and quality control that are part of a well-conducted meta-analysis. The questions on the right hand side need to be answered in your final product to provide reproducibility, the flow chart on the left details the methods and options that have to be considered for each step. 

![](https://github.com/SusZaj/metaanalysis/blob/master/images/Nakagawa_etal_Fig1.gif?raw=true)
<br>
<br>

## Some examples 
If you haven't looked at many meta-analyses yet, you can have a glance and see what questions were asked and how the results are presented in the examples below. Especially the first in the list (Macartney et al. 2019) is a very good example, with protocols, data, and R code published and made freely available (see *Data & R Code* below). In fact, we'll use a subset of their data in our guided example in the data analysis parts in Chapter 3:

- [Effects of nutrient limitation on sperm and seminal fluid: a systematic review and meta‐analysis (Macartney et al. 2019)](http://www.bonduriansky.net/Macartney_et_a_2019_Biological_Reviews.pdf) [Data & R code on osf.io](https://osf.io/aqw8u/)

- [The repeatability of behaviour: a meta-analysis (Bell et al. 2009)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3972767/).

- [Individual differences in behaviour explain variation in survival: a meta‐analysis (Niemelä & Dingemanse 2018)](https://royalsocietypublishing.org/doi/10.1098/rspb.2017.2823).

- [The effect of dietary restriction on reproduction: a meta-analytic perspective (Moatt et al. 2016)](https://bmcevolbiol.biomedcentral.com/articles/10.1186/s12862-016-0768-z).

**Meta-analysis and research synthesis: an outlook**

- [Research Weaving: Visualizing the Future of Research Synthesis (Nakagawa et al., 2018)](https://ecoevorxiv.org/ga2qz/)

**A key reference for how to conduct a meta-analysis**

- [Meta-evaluation of meta-analysis: Ten appraisal questions for biologists (Nakagawa et al. 2017)](https://bmcbiol.biomedcentral.com/articles/10.1186/s12915-017-0357-7)

</exercise>
