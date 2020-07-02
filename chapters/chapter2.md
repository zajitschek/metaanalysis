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

There are different protocols for how to gather the literature for a systematic meta-analysis. Please note that the process of correctly, transparently and reproducibly searching for literature  is in itself an active area of research. For example, I would like to mention the *[metaverse](https://rmetaverse.github.io/)*, a collection of R packages that is aimed at integrating all steps of a meta-analysis. 


## How to get started

It is a good idea to check on [Google Scholar](https://scholar.google.com) what is already out there on the question that you are investigating.
 
Ideally, literature searches should be conducted within a range of different search engines, to provide you with the most comprehensive range of avaiable resources.   
   

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) ***Note***   
One problem with all searchable databases for scientific literature that exist at present is that their results depend not only on internal search algorithms, but also on the operator's choice of literature that is searchable. Internal search algorithms should probably improve and get us better results, i.e. citations that are closer to what we try the software to search for. While this is a good development, it is not optimal for the larger endeavour of reproducible research. Any changes to the pool of literature that is made searchable by the operator of the search engine or by your institution is a more evident problem. This sounds as if it should not be an issue with ever decreasing cost of electronic storage. Unfortunately it is. For example, the lower year limit of Web of Scinece depends on your institution's subscription. Be also aware that the description that you find on your library's homepage might be outdated, since this is apparently a dynamic field of development. All this means:

Researchers might be very meticulous in protocolling and reporting their search engine, the exact search string and when performed the search. It might still be that their literature search can't be excatly replicated even a year later. This problem will probably persist and you should be aware of it. This doesn't mean that we should stop and not use systematic literature search at all. It means that we should pay attention of what might have changed (e.g. being aware that you might not find any publications prior to e.g. 1970), and it means that we have to try and use several search engines to make up for potential deficiencies in some search engines.

## TOOLS

The most important tools (most comprehensive, flexible and stable) for your full search are search engines that require subscription, so make sure to log in via your instution's library:

* [Web of Science (WoS)](http://apps.webofknowledge.com)  
* [Scopus](https://www.scopus.com/)   
 

Excellent free options include 
*[BASE (Bielefeld Academic Search Engine, provided by the University of Bielefeld,  Germany)](https://www.base-search.net/)
*[Dimensions](https://app.dimensions.ai/) 
*[Microsoft Academic](https://academic.microsoft.com/), and 
*[Goggle Scholar](https://scholar.google.com/).\

Other honourable mentions are
*[pubmed](https://pubmed.ncbi.nlm.nih.gov/)
*[Open Science Directory](http://www.opensciencedirectory.net/)
*[Directory of Open Access Journals](https://www.doaj.org/)

It that's not enough or you would like to checkout more, browse [Wikipedia's list of databases & search engines](https://en.wikipedia.org/wiki/List_of_academic_databases_and_search_engines)


![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  We like BASE a lot: you can select and export all citations of a search at once (check the left bottom corner for this option), something you can't do as easily in Goggle Scholar or Microsoft Academic (there, you'd have to add each citation to your library or your citations, using the star symbol (google) or the quotation mark(MS), and then export them from *My library* or *Citations*). In *Dimensions, you have to get a Readcube account in order to save your search results, 1-by-1, to a library that can be exported.

## How to fine-tune your search

Bolean Characters - what are they, how to use them?

What follows - perefecting your search string

Identifying key parameters for your inclusion decisions - see Frameworks below.


## Merging search results from different search engines

What all search engines have in common, though, is the option to export to RIS / RefMan format. Therefore, we recommend to do that, in order to merge citation lists from different search engines in the next step. If you use a local or web-based reference manager, such as Endnote or Zotero, it might be easiest to employ their merging and de-duplicating functions, i.e. load your search results from different search engines into your reference manager software and merge them there.

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  In contrast to R, these managers allow you to easily visually double check for duplicates by sorting a few different ways (most revealing: including title of the paper).

### R
If you prefer to go straight to R, this is how your next step could look like. Here, we show an example using the package revtools, with  4 different .ris search result files from 4 different search engines:

library(revtools)

```
data1 <- read_bibliography("./bib/WoS.bib")
data2 <- read_bibliography("./bib/scopus.bib")
data3 <- read_bibliography("./bib/base.ris")
data4 <- read_bibliography("./bib/googlescholar.ris")

data_all <- merge_columns(data1, data2) #you can only merge 2 bibliographies at a time
data_all2 <- merge_columns(data_all, data3) 
data_all3 <- merge_columns(data_all2, data4) 
```




</exercise>

<exercise id="2" title="Systematic Review Frameworks">


## Different Frameworks & Protocols, an overview

## Transparent and reproducible science

In recent years, scientists have increasingly acknowledged that many fields of research are in a [reproducibility crisis](https://en.wikipedia.org/wiki/Replication_crisis). This means that many published studies that have shown major effects can not be reproduced. Obviously this is a problem, as it not only erodes public trust in science, but it makes it very hard to drive knowledge and scientific discovery in the "right" direction. This doesn't mean that most of the science that is out there is meaningless, it just means that in order to make it reproducible, exact methods, (raw) data, (detailed) analyses and code should be made available. Read a recent opionin and summary on this crisis on social scienes and psychology [here](http://proust.ui.ac.id/index.php/journal/article/view/85). 

In addition, it has been traditinally much easier to get "significant" results published (compared to equally well-conducted null-results), especially in high-impact journals. Meta-analysis actually aims to check for this publication bias (not that you can do much about it, but if it's decteced it has to be reported, and may point towards the need for more research to investigate... This will be briefly covered towards the end of Chapter 4).
Nowadays, *pre-registration* of your publication plan is an option (for meta-analysis, too!) to get your science published, regardless of outcome. Check out the ***[Center for Open Science](https://en.wikipedia.org/wiki/Center_for_Open_Science)*** and their platform [OSF](osf.io) for more details on reproducible and transparent research, and sign up to pre-register your next study.

The quest for reproducibility and trasparency applies to all science, not just primary research, but just the same to systematic reviews and meta analyses. There a a mutitude of tools out there to not only quality-control meta-science, but to help achieve gold standards. The most important to mention here is [PRISMA, Preferred Reporting Items for Systematic Reviews and Meta-Analyses](https://en.wikipedia.org/wiki/Preferred_Reporting_Items_for_Systematic_Reviews_and_Meta-Analyses).

## PRISMA Checklist

The [Prisma checklist](http://www.prisma-statement.org/PRISMAStatement/Checklist) gives a detailed account of the items that should be included in a meta-analysis, from title to acknowledgements. It may help structure the writing process and will help stay organised during all stages, from Literature search to data sextraction, so it is worth checking this out early on.

## Frameworks for Literature searches

An overview with examples for a range of different frameworks can be found [here](https://libguides.city.ac.uk/postgraduate_research/frameworks). Most relevant for biological questions may be the PICO, PEO, and SPICE approaches, which we will briefly introduce below.

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


## PEO
  * Population - who is my question focussed on?
  * Exposure - what is the issue I'm interested in?
  * Outcomes or themes - what, in relation to the issue, do I want to examine?
  

## SPICE (medically-related)
  * Setting - where is the study set e.g. in a specific country, community, etc.
  * Perspective - from whose perspective is the study done e.g. the patients, the health professionals., the carers etc.
  * Intervention - what intervention is being examined?
  * Comparison - is the intervention being compared with another?
  *Evaluation - the outcome measures
  
## SPIDER
  * Sample - the group of people being looked at, because qualitative research is not easy to generalize, sample is preferred over patient.
Phenomenon of Interest -  reasons for behaviour and decisions, rather than an intervention.
Design - the form of research used, such as interview or survey.
Evaluation - outcome measures.
Research type - qualitative, quantitative and/or mixed methods.

## Create your own...
These frameworks are not set in stone and you can come up with your own, if that suits your questions better. In general, however, your framework should define   
   
•	Variables of interest   
•	research designs   
•	historical, geographical, theoretical context   
   

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) 
You will need to know what you're after and what you're not interested in, in order to ***discriminate relevant from irrelevant studies***   

Having clearly defined critera is essential to decide which papers should get included (or excluded) during the screening process.

</exercise>

<exercise id="3" title="Literature screening">

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  
Ideally, the screening of the literature for inclusion should be conducted by two (or more) people.

## Why two?
>To avoid bias - we all have preferences and biases, so having two people to independently think about which studies should or should not be included - and importanly, discuss the discrepancies - is considered good practise. The effect of single vs double screening has even been tested in a [study](https://bmcmedresmethodol.biomedcentral.com/articles/10.1186/s12874-019-0782-0). 

A "systematic quantitiative review" aims for an objective summary of the evidence available at a given time. This may eventually include quite different papers to the ones that you are closely familiar with alreday, even though you may be an expert on the topic yourself. A meta-analysis should not just summarise the output produced by a dominant group in the field, but aim to consolidate all available evidence, as far as the question and search string allow.

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) Remider: If you haven't already, for more insight on gold standards take a looks at the *Preferred Reporting Items for Systematic Reviews and Meta-Analyses (PRISMA)* [resources](http://prisma-statement.org/).

## Resources (free)

To help you screen your collected literature lists for initial suitability for inclusion, there are free tools available:

 * [Rayyan](https://rayyan.qcri.org/welcome), [see](http://libraryguides.mcgill.ca/rayyan/home). Downloadable app allows screeing on you mobile phone! 
 * [Abstrackr](http://abstrackr.cebm.brown.edu/account/login) Requires registration. Simple interface, relatively self explanatory use. 
 
## Screening stages

Once you've got reduced your list of "possibly-include" papers after abstract screening, It is time to verify that they're indeed matching your criteria by having a look at the full-texts. 

Make sure to take note of the reasons why you're excluding any given paper, ideally you will provide a diagram like this [template from PRISMA](http://prisma-statement.org/PRISMAStatement/FlowDiagram) into your meta-research, providing both reasons and numbers excluded for each step of the way.


  

</exercise>