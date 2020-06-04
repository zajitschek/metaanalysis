---
title: 'Chapter 1: Getting started: Introduction to Meta-Analysis'
description:
  'This chapter will give you an introduction to meta-analysis, some background, why they are useful and examples.'
prev: null
next: /chapter2
type: chapter
id: 1
---

<exercise id="1" title="Introduction">

# Getting started: Introduction to Meta-analysis

Hi, I'm **[Susi Zajitschek](https://www.ljmu.ac.uk/about-us/staff-profiles/faculty-of-science/school-of-biological-and-environmental-sciences/susanne-zajitschek), a Senior Lecturer in Animal Behaviour at Liverpool John Moores University**. This course is meant as a primer for students who would like to know more about meta-analysis. I will give you an overview on what meta-analyses are and on why they are useful. In later chapters I will include hands-on exercises to conduct meta-analyses, step-by-step (based on material developed by my collaborators **[Shinichi Nakagawa](http://www.i-deel.org/shinichi-nakagawa.html)** and **[Malgorzata  Lagisz](https://mlagisz.weebly.com/)**. The actual statistical analyses will be performed in the [software R](https://www.r-project.org/about.html), and you will have the opportunity to run R software scripts right here, through this website, without the need to install software on your computer.

---

# What is a Meta-analysis?
## A short side-trip to the roots of knowledge
Humans strive to understand the world. The organized framework to do this is science, more specifically the *[scientific method](https://en.wikipedia.org/wiki/Scientific_method)*. Science is cumulative in nature. This means that studies and experiments build upon the findings of previous studies and experiments. New scientific insights might be gained by a more or less progressive accumulation of knowledge about a specific question, adding on to existing knowledge. Or, according to [Thomas Kuhn](https://en.wikipedia.org/wiki/Thomas_Kuhn), real progression in science might require [paradigm shifts](https://en.wikipedia.org/wiki/Paradigm_shift) that throw old theories over board and make way for new better theories. These shifts in how we explain the world depend themselves on the accumulation of results, which did not fit the old established theories, but which turned out to be not due to error of any kind (for example methodological mistakes or human error in performing studies).

---
## What makes a successful scientific theory?
We are talking about empirical research here, meaning results from studies and experiments that are based on observations. But what is the criterion that scientists use to accept a scientific theory as the currently most successful theory to explain observed phenomena?

- a successful scientific theory should give a good explanation and make accurate predictions
- this should be the case in a wide range of circumstances, i.e. it shouldn't be hyper-sensitive to natural variation in traits that are not the direct focus of the studies

Different scientific disciplines will have different criteria for how we define *good explanation*, *accurate prediction*, *sensitive*, and *natural variation* that I used above.
This course is mainly focussed on research in biological sciences. My own research involves the study of animal behaviour, which often has a high level of noise in the data, especially when compared to some studies in physics or geology (if interested, read up on the colloquial terms of soft and hard sciences, e.g. [here](https://en.wikipedia.org/wiki/Hard_and_soft_science)). 

---

# Meta-analysis can help
We established that science works cumulatively. To gain support for specific hypothesis, we do not want to rely on the outcome of single studies. We can try to combine the knowledge gained in multiple studies which tested specific traits of interest. This can be achieved while still taking into account that studies differ in their quality and their size, for example, lending different levels of weights to their results. 

This combination of multiple test results can be achieved by qualitatively summarising previous work on a specific subject. Classically, this was done in a literature review, for example at the beginning of a graduate or postgraduate degree. While this type of review has still its merit, we want to introduce you here to the meta-analytical approach, which can provide a quantitative summary and test of specific research questions.

Some examples. You can have a glance and see, what questions were asked and how the results are presented.:
- [The repeatability of behaviour: a meta-analysis](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3972767/).
- [Individual differences in behaviour explain variation in survival: a meta‐analysis](https://royalsocietypublishing.org/doi/10.1098/rspb.2017.2823).
- [The effect of dietary restriction on reproduction: a meta-analytic perspective](https://bmcevolbiol.biomedcentral.com/articles/10.1186/s12862-016-0768-z).

</exercise>



<exercise id="2" title="Step-by-step Meta-analysis?">

Let's ask some questions about the slides. Whats the correct answer?

<choice>
<opt text="Answer one">

This is not the correct answer.

</opt>

<opt text="Answer two" correct="true">

Good job!

</opt>

<opt text="Answer three">

This is not correct either.

</opt>
</choice>

</exercise>

<exercise id="3" title="Meta-analysis in R">

This is a code exercise. The content can be formatted in simple Markdown – so
you can have **bold text**, `code` or [links](https://spacy.io) or lists, like
the one for the instructions below.

- These are instructions and they can have bullet points.
- The code block below will look for the files `exc_01_03`, `solution_01_03` and
  `test_01_03` in `/exercises`.

<codeblock id="01_03">

This is a hint.

</codeblock>

</exercise>
