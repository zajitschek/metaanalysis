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