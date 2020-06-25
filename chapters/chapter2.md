---
title: 'Chapter 2: Systematic search'
description:
  'Searching and finding literature.'
prev: chapter1
next: chapter3
type: chapter
id: 2
---

<exercise id="1" title="Finding relevant papers">

# Literature search

There are different protocols for how to gather the literature for a systematic meta-analysis. Please note that the process of correctly, transparently and reproducibly searching for literature  is in itself an active area of research. For example, I would like to mention the *[metaverse](https://rmetaverse.github.io/)*, a collection of R packages that is aimed at integrating all steps of a meta-analysis. The package *[litsearchR](https://elizagrames.github.io/litsearchr/)* seems especially promising, and you could try it out on your local R installation (right now, I haven't installed it in the R software container you will be using during this course / online).


### How to get started

It is a good idea to check on [Google Scholar](https://scholar.google.com) what is already out there on the question that you are investigating.

Specifically, already available reviews, previous meta-analyses, and highly-cited papers may give  some idea how to refine your question and in which directon to take it. This is particularly important if the initial search ended up with too many hits.
 
Ideally, literature searches should be conducted within a range of different search engines, to provide you with the most comprehensive range of avaiable resources.   
   
Possible free resources include
* [Google Scholar](https://scholar.google.com)
* [Semantic Scholar](https://www.semanticscholar.org/)   
* [Dimensions](https://www.dimensions.ai/)   
* R package *[litsearchR](https://elizagrames.github.io/litsearchr/)* (which I haven't tested yet myself)

The most important tools (most comprehensive, flexible and stable) for your full search are search engines that require subscription, so make sure to log in via your instution's library:

* [Web of Science (WoS)](http://apps.webofknowledge.com)  
* [Scopus](https://www.scopus.com/)   
 
![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  Why should we use multiple databases?



</exercise>

<exercise id="2" title="Systematic Review Frameworks">

## Frameworks for systematic reviews
### In general, your framework should in general define   
   
•	Variables of interest   
•	research designs   
•	historical, geographical, theoretical context   
   
You will need to know what you're after and what you're not interested in, in order to ***discriminate relevant from irrelevant studies***   


## Different Frameworks, an overview

## PICO   
stands for:   
  * P = Population   
  * I = Intervention  
  * C = Comparison/Control group   
  * O = Outcome   

Broadly, this framework will help you identify the key paremeters that you will be working with. You can use the PICO framework for any research outset, even though we might be used to slighly different terminology:  "Population" defines the group  or species of interest, "Intervention" is your "treatment", "Comparision" is the "control" and "Outcome" refers to the traits that you are investigating. In the current situation for example you might like to know if hand washing helps to prevent the spread of COVID19. Here you may define PICO as follows:

  P = humans in COVID affected areas   
  I = hand washing   
  C = no wand washing   
  O = reduced infection rates   

To frame this in a biological context, we will be using the [Macartney et al. (2019)](http://www.bonduriansky.net/Macartney_et_a_2019_Biological_Reviews.pdf) study we have mentioned in Chapter 1.  The question of interest here is to investigate if different diet interventions affect sperm traits. Perhaps read the Abstract and think of how you would frame this.

Here, a possible PICO would be...

<choice id="1">
<opt text="Example solution" correct="true">
 <br> * P = Population                = animal species     
 <br> * I = Intervention              = dietary treatment (either over- or underfeeding)   
 <br> * C = Comparison/Control group  = normal / control diet  
 <br> * O = Outcome                   = sperm traits (swimming velocity, number, motility)   
</opt>
</choice>   
<br>

</exercise>

<exercise id="3" title="Literature screening">

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  

## Why two?
>To avoid bias - we all have preferences and biases, so having two people to independently think about which studies should or should not be included - and importanly, discuss the discrepancies - is considered good practise. The effect of single vs double screening has even been tested in a [study](https://bmcmedresmethodol.biomedcentral.com/articles/10.1186/s12874-019-0782-0)

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  For more insight on gold standards take a looks at the *Preferred Reporting Items for Systematic Reviews and Meta-Analyses (PRISMA)* [resources](http://prisma-statement.org/).

## Resources (free)
 * [Rayyan](https://rayyan.qcri.org/welcome), [see](http://libraryguides.mcgill.ca/rayyan/home)  
 * [Abstrackr](http://abstrackr.cebm.brown.edu/account/login) (requires registration)
    

</exercise>