---
title: 'Chapter 2: Step-by-step: The structure of a Meta-analysis'
description:
  'We will work through each specific step in a meta-analysis.'
prev: /chapter1
next: /chapter3
type: chapter
id: 2
---

<exercise id="1" title="Overview: the complete meta-analysis">

# Overview

We will take the paper [Nakagawa 2017](https://bmcbiol.biomedcentral.com/articles/10.1186/s12915-017-0357-7) as a blueprint to walk you through all the steps of a meta-analysis.

However, as this is meant as a first step to get you started, we will provide some additional resources, exercises and guidelines in Chapter 3. This includes a section on phylogenetic trees (which you may need if the question you're planning on tackling spans across different species. To keep things simple initially, we are concentrating on an example within the same species), how to make a decision tree in R, and other usefull stuff.

Here is a graphical overview of the different parts of a meta analysis:

![](https://github.com/SusZaj/metaanalysis/blob/master/images/metaanalysis_overview.png?raw=true)
<br>
<br>
All of these steps have to be described and laid out in a protocol. We will see that there already exist general protocols for each step, which we can use and adapt to our research questions. The aim of having well defined protocols is for other researchers to be able to reproduce those steps. 

Protocols are necessary to minimize any bias that we might introduce - either knowingly, but most often unknowingly - into the decisions that have to be taken at each meta-analysis step. Bias might already be present in how the research question we want to tackle is phrased. Furthermore, bias can originate in the specific way we search for literature, both in where we search (for example, which databases we use, or whether we only include published results), and how we search (for example our choice of search terms).

The following diagram shows a more in depth overview, starting from the literature search (Figure 1 from Nakagawa et al. 2017). 

![](https://github.com/SusZaj/metaanalysis/blob/master/images/Nakagawa_etal_Fig1.gif?raw=true)
<br>
<br>

</exercise>

<exercise id="2" title="Research question and literature search">

# Literature search

There are different protocols for how to gather the literature for a systematic meta-analysis. We will walk through a specific literature search below, using one established protocol. Please note that this is in itself an active area of research though. For example, I would like to mention the *[metaverse](https://rmetaverse.github.io/)*, a collection of R packages that is aimed at integrating all steps of a meta-analysis. The package *[litsearchR](https://elizagrames.github.io/litsearchr/)* seems especially promising, and you could try it out on your local R installation (right now, I haven't installed it in the R software container you will be using during this course / online).

The following exercise is based on material originally prepared by Malgorzata (Losia) Lagisz, BEES, UNSW, Australia. 

#### In this exercise you get some practice and tips on:   

 * Formulating the question for a meta-analysis   
 * Deciding on inclusion criteria   
 * Making decision trees   
 * Performing searches for relevant literature   
 * Screening the literature  
 * PRISMA and other documentation  



###  Formulating the question for a meta-analysis  

A topic of interest is usually rather broad and vague. For a meta-analysis we need a much more concrete question.
Generally, the more focused the question, the easier and quicker it is to perform the meta-analysis, but the answer becomes less general and there might be less evidence available.
<br>
<br>


#### Start with these steps:

 a) Check if there already is a good recent meta-analysis on the topic.  
 b) Find and carefully read key reviews on the topic.  
 c) Find and carefully read a few representative empirical papers.  
 d) Further refine the question.  

For this exercise, we will choose *terminal investment* in animals as a general research topic that we want to explore further, using meta-analytic approaches.
<br>
<br>

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)    
**Are there any meta-analyses (or similar) on terminal investment in animals?**

In [Google Scholar](https://scholar.google.com) run:   *"meta-analytic" OR "meta-analysis" "terminal investment"*    

(you can paste this into search box or use Advanced search (in the Google Scholar menu on the left); see instructions and other Google Scholar tips [here](https://guides.library.ucsc.edu/c.php?g=745384&p=5361954) and [here](https://scholar.google.com/intl/en/scholar/help.html).   

***You should get around 300 results. By skimming the first few pages you can see a few meta-analyses on stress, diet, senescence, parasitism etc., but none probably specifically on terminal investment. There are many empirical papers coming up in this search because they mention meta-analysis in their body text or reference list - note that Google Scholar searches full text by default. Also by default, the returned results are arranged in order of relevance to the search (whatever that means - its a complex algorithm that decides), and only a few first pages contain some potentially relevant empirical papers.***    
<br>
<br>

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)  
You can restrict the search to titles only:    *allintitle: "meta analytic" OR "meta analysis" "terminal investment"*    

***Now there are no matching hits; but there is no option for searching just in titles and abstracts.    
It turns out that Google Scholars' search interface is rather simplistic and restrictive. It shows only up to 1,000 results for any particular search query, ranking algorithms are obscured, it is hard to export references, the literature coverage may fluctuate (it is based on web scraping), and the searches may not be reproducible. Therefore, Google Scholar is not recommended for the main searches in meta-analyses and systematic reviews. On the upside, it can be helpful for additional searches and finding grey literature (not published in peer-review journals).***
<br>

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) **RESOURCES**   
Other software useful for exploratory (scoping) and additional searches (check them out later, and note that they may have similar disadvantages to these of Google Scholar):
 * [Semantic Scholar](https://www.semanticscholar.org/)
 * [Dimensions](https://www.dimensions.ai/)
 * [CiteHero](https://citehero.com/)
 * R package *[litsearchR](https://elizagrames.github.io/litsearchr/)* (which I haven't tested yet myself)
   
**It seems that the question "What is the evidence for terminal investment happening?" is too general and too broad in scope. Let's try to narrow it down and focus on either *terminal investment in reproduction*, or *terminal investment under immune challenge* (notice the difference between effects *in* reproduction and effects *of* immune challenge*.**

   
![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)  
Run another Google Scholar quick search, including *reproduction* (not in quotes):  
*"terminal investment" reproduction*   

This time you should get over 2,000 records (you will be allowed to access only the first 1,000). Note that Google Scholar does so called Automated Query Expansion for terms that are not set to be exact phrases (in quotes) - it uses alternative forms of these terms.  

   
![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)   
Try Google Scholar quick search:    *"terminal investment" "immune challenge"*    

This time you should get just over 400 records. Skim through the first three pages of the results to get a feel of the diversity of the studies found (e.g. what taxa are studied and what traits the studies might measure to evaluate reproductive investment) and note the wording of their titles.  
In medical sciences, most meta-analyses (and systematic reviews) fit into the PICO (or related) question framework.

PICO stands for:   
  * P = Population   
  * I = Intervention  
  * C = Comparison/Control group   
  * O = Outcome   

Frame our meta-analytic question "whether immune challenge can result in terminal investment" using PICO terms (actually this fits really well because we can use experimental data). Please reflect yourself and try to write down your own ideas of what you would define as "P" (Population), "I" (Intervention), "C" (Comparison/Control) and "O" (outcome) that fits this question before clicking on the sample solution below.

<choice id="1">
<opt text="Example solution" correct="true">
 <br> * P = Population                = animal species     
 <br> * I = Intervention              = immune challenge   
 <br> * C = Comparison/Control group  = unchallenged group of animals, otherwise in the same state    
 <br> * O = Outcome                   = reproduction-related traits 
</opt>
</choice>

   
![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) **RESOURCES:**   
An extensive list of alternative systematic review formulation question frameworks can be found [here](https://www.networks.nhs.uk/nhs-networks/nwas-library-and-information-service/documents/alternative-question-structures-for-different-types-of-systematic-review)

    
![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) You should always be able to justify your question as important, relevant and timely. This holds true for other research questions as well, and will affect the likelihood of a meta-analysis you propose to perform to gain support (by an academic supervisor, a grant agency, in an academic and a non-academic environment), and its impact on the target audience. 

   
##  Deciding on inclusion criteria   

The basic PICO components are usually not sufficient to perform the effective screening of the papers for inclusion in meta-analysis.
There are additional both technical and biological refinements to be considered for inclusion criteria in our project.
Most importantly, you always need to be able to justify your inclusion criteria, especially if you're planning on publishing your meta- analysis.  

   
   **TIME-SPAN**: Should we include studies from any year?  

<choice id="2" >
<opt text="Probably yes, unless you can come up with a reason for not doing so" correct="true">
Yes
</opt>
<opt text="Probably not, because the quality of older studies is not good enough">
No, unless you have a very good reason to support this argument.
</opt>
</choice>

    
**LANGUAGE**: Should we include studies published in any language? 

<choice id="3">
<opt text="Yes">
Possible, but difficult to do and might not yield a lot more additional information.
</opt>
<opt text="Not necessarily"  correct="true">
Most meta-analyses only include studies published in English by default. However, if possible it is recommend to include studies also in other languages (usually not many are found, unless you also perform your searches in other languages). 
</opt>
</choice>

    
![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) Publication status can be also used as a criterion - are you happy to include some types of grey literature (e.g. conference proceedings, theses)?

    
**STUDY TYPE**: Should we include any type of study? (e.g. correlational vs experimental, if experimental, what type of experiment?)    

  ***Since we investigate a specific intervention, we should restrict study type to "experimental" (we should explicitly exclude "simulation").***  

    
**TAXA**: Should we include any type of taxa?   

***That is a difficult one. The animal kingdom is vast and diverse, and some species are especially odd (e.g. humans). Does it make sense to include single-cell animals? Does it make sense to include humans? Probably not.
How about multicellular animals, except humans? If many studies across multiple taxa exist, we could focus on the most frequently studied taxa or biologically most interesting. Alternatively just vertebrates, except humans? Another thing worth being specific about is that the animals should be wild-type (non-mutant, not disease models) and ideally not subject to any other significant manipulations that could affect their response (e.g. drug treatment; note there is a thin fuzzy line what these manipulations are). There might also be reasons to exclude standard laboratory species (mice, rat, yeast, fruit fly) or maybe focus just on them? But, for now, we will stick to any multicellular animals, except humans.***

    
**MANIPULATION TYPE**: Should we include all types of immune challenge?   

***There are several established types of experimental immune challenge (blood cells (e.g. SRBC), protein (e.g. PHA), dead or live pathogens or parasites), so its worth including these and similar ones. Non-experimental immune challenge (e.g. natural infestation levels)  should not be included. If something odd comes up later it can come under "exclusion criteria", with justification.*** 

    
**CONTROL GROUP**: Should we accept any type of control group?  

***Control group (un-manipulated) should consist of similar individuals, as far as reasonable and not be subject to any other manipulations.***  

    
**OUTCOME TYPE**: Should we accept any reproduction-related measurements and how do we define "reproduction-related" in the first place?   

***The definition of a *reproduction-related trait* will depend on the species studied (and may require additional reading or relying on the assertions of the authors). Different taxa will have different suites of reproduction related-traits, but these can be grouped into broader categories (e.g. mate attraction includes vocal signals, visual ornaments, pheromone production etc.; reproductive fitness will include number and quality of offspring) and different specific measurements will be available for different taxa and in different studies - this can be quite messy. If we do not have many studies on the topic and very specific question (e.g. "Is the number of offspring affected?") it is OK to be inclusive and later on try to figure out whether some traits are affected more than others.***

    
**DATA TYPE**: Should we accept any type of data for a meta-analysis? (e.g. descriptive statistics (summarising populations), and which ones, or also inferential statistics (based on population samples and used to estimate parameters and test hypotheses), and which ones? This will be linked to the effect size you are planning to use!)   

***It depends on the effect size we are planning to use. In our project it can be Cohen's *d*(Hedges *g*) or *lnRR*, which are typically calculated from mean, SD or SE and N (sample sizes). However, Cohen's *d* (Hedges *g*) can be also inferred from some of the test statistics, or even proportions, if means and other descriptive statistics are not available. But one cannot get *lnRR* from inhferential statistics. Other considerations include what to do if some data is missing or unclear.***   

     
## Making decision trees for the literature screening    

Decision trees are visual representations of our inclusion criteria and decisions we have to make when screening literature. Importantly, good decision trees can make screening the literature faster and more reliable. Briefly, if the initial (most general) questions representing screening criteria are not fulfilled, the study gets excluded and there is no need to evaluate the remaining criteria, so we save some time.    

You can make your decision trees by hand, make a flow chart in Power Point or use any MindMapping software (if you want to go that route - I recommend Visually Understanding the Enviroment, [VUE] (https://vue.tufts.edu/)). 

The screening of literature is usually done in two stages:   
  1. abstract +  title + keywords  
  2. full text + supplementary information  

**Accordingly, we need two decision trees (one for each stage).**
This is because abstracts, titles and keywords do not contain enough information to conclusively answer all of the inclusion criteria questions - you should be excluding every paper for which you cannot answer "yes"" to all the questions. 

Thus this first stage of screening has to be more tentative, and we would use a more permissive and simpler decision tree. A good tree starts from the questions that are easiest to answer (if we had any year or language restrictions we would put these on the top). Note that during abstract screening we exclude the records where a definite "no" can be inferred from available information, but we allow for some uncertainty for the "yes" answers by allowing "probably" as an acceptable answer for inclusion, so we can check for more info in the full text. 

An example decision tree for abstract screening looks like this:![](https://github.com/SusZaj/metaanalysis/blob/master/images/decisiontree.png?raw=true)
    

In the abstract screening decision tree there is no question about the type of data used to express measurements reported in the study. Why?   
    
***Full-text screening is more strict and we want to have answers to all our inclusion criteria. In principle we only have "yes" and "no" answers to the screening questions. However, in practice, if a study looks very relevant but some information is ambiguous or missing, you may decide to contact the authors to get some extra information or data. in such case, you can provisionally include such papers and make final decision once you get, or not, the replies.***   

    
In a decision tree for full-text screening, we will include an additional rule:
  * Are means and SD (or SEs) and N (sample sizes) for treatment and control groups, or test statistics from which effect sizes for the difference between the two groups can be calculated, available?

If the answer is **yes**, the study can be included for meta-analysis.

    
**What question is missing on the top of the full-text decision tree? **
(Tip: what happens between abstract and full text screening?)  
    
***The question is*** **"Is the full text of this study available for our assessment?"**   
***It is often not explicitly stated, but without the full text it is impossible to extract all the necessary information about the study and the data. 
It is a good practice to keep this in mind and use as one of your potential inclusion/exclusion criteria.*** 
   
   

###  Performing searches for relevant literature  

Normally, we attempt to do a fairly comprehensive literature search (a full systematic review). The reason is that we want to have as many relevant data points as possible to increase the power of statistical analyses. The other reason is that we want to make an effort to capture obscure studies that potentially are more likely to report non-significant results, and therefore help reduce publication bias in our data set. 

Search strategy should include using at least two wide-coverage/interdisciplinary databases (we recommend **Scopus** and **Web of Science**), and a few additional sources of literature such as forward and backward reference searching (looking at cited and citing papers), publication lists of the key authors or labs, searching for unpublished studies and data sets (we will not cover these here).   

**In this exercise we only do a bit of the core search using 2 databases:
Scopus and Web of Science.**

    
![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  **RESOURCES:** 
 * [Scopus](https://www.scopus.com/)   
 * [Web of Science (WoS)](http://apps.webofknowledge.com)   
 
 WoS coverage depends on the institutional subscription package purchased, so results of searches can vary among institutions (so make sure to log in via your libarry, if working from home). Also searching just core collection vs. all available databases can make a difference.     

   
![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true) 

Using Scopus **Advanced Search** (you can read more about the syntax [here](https://dev.elsevier.com/tips/ScopusSearchTips.htm) run these search strings:  

 **1** *TITLE-ABS-KEY ( "terminal investment"  AND  "immune challenge" )*    
(approx. 14 hits - search terms too restrictive)   
 **2** *TITLE-ABS-KEY ( ( "terminal investment"  OR  "reproductive effort" )  AND  ( "immune challeng\*"  OR  "immunochalleng\*" ) )  *
(approx. 25 hits - a bit better, but still too restrictive)   
 **3** *TITLE-ABS-KEY ( ( "terminal investment"  OR  "reproductive effort" )  AND  ( "immune challeng\*"  OR  "immunochalleng\*"  OR  "infect\*" ) )  *
(approx. 180 hits - much better number, but we probably now have included many non-experimental studies while still missing relevant ones)    
 **4** *( TITLE-ABS-KEY ( ( "terminal investment"  OR  "reproductive effort" )  AND  ( "immune challeng\*"  OR  "immunochalleng\*"  OR  "infect\*" ) )  AND NOT  TITLE-ABS-KEY ( load  OR  human  OR  people ) )* 
(approx. 144 hits - by adding a group of exclusion terms (AND NOT) we probably got rid of some irrelevant ones).  

Ideally, we should think and test some more terms for inclusion, after doing some scoping searches, reading reviews and seminal relevant empirical papers. Also, it is important to validate the search by checking how many papers it finds that we know contain useable data. You should also do some pilot abstract screening on papers exported from just one database, to check whether there’s some exclusion words you did not think about, and which could be included in your search string as exclusion terms.   

We stop for now and assume that the string above is our final search string. Note that Scopus Advanced Search stores all your searches and search strings in a neat table at the bottom of the search window - it's easy to copy this out and to include it in the documentation on how you developed your search strategy (same applies to WoS database; you need to register in Scopus and WoS to save searches and alerts across multiple search sessions). The \* symbol stands for wildcard and indicates "any symbols" since these databases do not do Automatic Query Expansion.    
   
   
![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true) 

We can easily translate our final search string from Scopus into Web of Science (WoS) **Advanced Search** (you can read more about the syntax [here](https://images.webofknowledge.com/images/help/WOS/hs_search_operators.html). Run this search string:    
*TS = (( ( "terminal investment" OR "reproductive effort" ) AND ( "immune challeng\*"  OR  "immunochalleng\*"  OR  "infect\*"  ) ) NOT ( load OR human OR people ) )*  
(approx. 249 hits - more than from Scopus).   WoS stores your search history and also which sub-data bases were included in the search: Indexes=SCI-EXPANDED, SSCI, A&HCI, CPCI-S, CPCI-SSH, BKCI-S, BKCI-SSH, ESCI, CCR-EXPANDED, IC Timespan=All years" (you can restrict these in the Advanced Search).   

Both Scopus and WoS allow exporting the found records (with limitations on the max. number per export, **remember to tick the boxes for exporting abstracts!**) - there are multiple file formats you can use, but .ris and .bib are most commonly used ones- you will need to figure out which ones work for your reference manager software. The next step would be downloading all found records from your "final" search into the reference manager of your choice. Combine the references from two databases into a single project/folder and remove duplicates (most reference managers have this function, but it never works perfectly - do a visual check after sorting by titles!) before proceeding to the reference screening stage. An R package *revtools* (https://cran.rstudio.com/web/packages/revtools/ and http://revtools.net/) can act as a reference manager and also has a good de-duplication function.      

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) This is also a good time to write up your meta-analysis protocol and register your meta-analysis (e.g. on OSF)!

*******************************************************************************
###  Screening the literature   

Theoretically you could do screening in the database browser or your reference manager, but since it is recommended that 2 people do the screening independently (or at least part of the screening), it is good to use a dedicated tool to manage this process.  

**RESOURCES:** 
 * Rayyan: https://rayyan.qcri.org/welcome (free, you can use it in the web browser or as a phone app; for more details see: http://libraryguides.mcgill.ca/rayyan/home)  
 * Abstrackr:  http://abstrackr.cebm.brown.edu/account/login (another free tool)

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) It is possible that the de-duplication algorithms in these are not very good, so it is advisable to de-duplicate and check your records in the reference manager before uploading to the screening software.    

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true) 

We prepared a file (for download: [Scopus10.ris](/papers/Scopus10.ris)) with 10 references sampled from the set found using the search string in Scopus database (used *( ( "terminal investment"  OR  "reproductive effort" )  AND  ( "immune challeng\*"  OR  "immunochalleng\*" ) )  *) (same references came up in the equivalent search in WoS).    

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) Sometimes the biblio-files with the same extension differ a bit in structure and reference managers, and Rayyan may have problem opening them. Getting your files into exactly the right format can sometimes be frustrating.   

We will use these ten references to practice title and abstract screening in Rayyan. Screening can be also done in Abstracker, but we find Rayyan a bit more reliable and more user-friendly (could be slow with updating the display).   

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true) 

Create a new project in Rayyan:

 1. Open Rayyan (we assume you already created a free account) and log in.    
 2. My Reviews -> New REVIEW...   
 3. Enter project title, e.g. "Terminal Investment"" and description, e.g. "test"."   
 4. Select files -> upload *Scopus10.ris* from the *data* sub-folder and press Continue.     
It may take several minutes for larger files and slower connections, but eventually the uploaded references should appear in the left panel under "Search methods" (you can upload more files with references via "Add new" link). Click on the "Uploaded References [scopus10.ris]" link in this panel to see the references in the right panel. Generally clicking on the links within panels on the left will filter the records in the right panels to include only highlighted sets (to get rid of the filter click on it again to remove highlighting).  
In the left panels there are several sub-panels.  
 5. In the "Keywords for include" you can add (via "Add new" link) following terms (or at least a few of these): challenge, challenged, injected, injection, infected, infection, PHA, SRBC, vaccine (these terms will be highlighted green in the titles and abstracts to help them find more easily; Rayyan tries to populate this list by itself - but its algorithm is medical-centered so you should adjust this list for your projects).   
 6. "Keywords for exclude" - " set to: review, reviewed, model, human, people, women, men (these terms will be highlighted red in the titles and abstracts to help them find more easily; again, Rayyan tries to populate this list by itself).    
 7. Click on "All reviews" button in the top right corner to go to the project lists, then open your project again by choosing it from the list. A view with a pie chart (your screening progress) and a few buttons will appear. If you need to invite other people to do screening in parallel with you, do that by clicking on the "Invite" button. Stick with "Collaborator" selection and enter the email and message (e.g. "help me!"). Open your project again - you should see your collaborators added with some info on their work so far. Press on "Show" button to see the references view.  
 8. Click on the first review from the top - an abstract and other record info will appear in the bottom panel.  
 9. Using our abstract screening decision tree decide whether include this paper for the next stage of screening and press the "Include" or "Exclude" button accordingly. And do the assessment for the remaining records. As you go you can create and assign new labels to individual records, e.g.: "unsure/check". You could also enter reasons for exclusion, e.g. "human" (we normally don't do this as there are often hundreds or thousands of excluded records per project at this stage).  
10. Go to "All reviews" and check if other people finished their screening, if applicable. After that you can lift the "blind" mode (when collaborators cannot see each others decisions). For collaborative screens Rayyan will now provide filters to display all consensus included, consensus excluded and records with conflicting decisions. If you have any "conflicts" have a look again and discuss why you couldn't agree on a given record , come to agreement and make final decision. Export the records with final consensus decisions, for documentation, into a .csv file. You can filter the records into “Included” and just export those, also you can export them as a .bib or .ris file into a reference manager where you will collect full texts for the nest stage of the screening.   

How many papers did you exclude? How many conflicts did you have if you collaboratively screened and, if so, what was causing these conflicts? Can the decision tree be improved and how?   

>We think 4 should have been excluded:    
>**Simmons2009** and **Clancy2013** as human studies, but    
>**Gershman2010** and **Gonzales-Tokman2013** as not likely to have any reproduction->related measurements.   

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true) 

It is time to do the full-text screening for the papers that passed title and abstract screening. There are some full-text papers that passed the initial screening in the directory - assess **Nielsen2012** and **Ardia2005** (they are in "pdf" sub-folder) using our full-text screening decision tree. (Tip: do not read the whole paper - just try to skim it and look for the key information.)      


What was your decision about **Nielsen2012** and **Ardia2005** papers?   
<choice id="4">
<opt text="Include both"> 
Not quite.
</opt>
<opt text="Exlude both">
Unfortunately wrong.
</opt>
<opt text="Only include **Nielsen2012**" correct="true"> 
YES! Include **Nielsen2012**, exlude **Ardia2005**. Why? Exclude due to the lack of a good control group. 
</opt>
<opt text="Only include **Ardia2005**"> 
Why exclude **Nielsen2012**?
</opt>
</choice>

*******************************************************************************
###  PRISMA and other documentation  

It is very important to keep detailed record of the whole searching, screening and data extraction process (= your protocol). Searching and screening are usually represented as some variant of a PRISMA diagram.
With our 144 records from Scopus, 249 from WoS (these two databases are our "main search"), and imaginary around 400 records from other searches of other sources of literature we might have done if we had more time, we would probably end up with something like this one:    

![](https://github.com/SusZaj/metaanalysis/blob/master/images/prisma.png?raw=true)
<br>
<br>

</exercise>

<exercise id="3" title="Paper selection">

# Paper selection

</exercise>

<exercise id="4" title="Extraction of effect sizes">

Based on material prepared by Malgorzata (Losia) Lagisz, BEES, UNSW, Australia, losialagisz@gmail.com.   

## Introduction for extracting effect sizes

Imagine, you quickly got well and decided to carry on the Terminal Investment Meta-analysis Project.   
After a few weeks you finished searching and screening literature for the relevant papers. You now have a collection of around 30 included full-text papers (relatively manageable; some projects have 300 or more), stored neatly as pdf files and supplementary information, in whatever format available. It is time to start extracting the data (ideally, you should have planned this in detail while writing up your protocol/preregistration, but in this exercise we assume you did not).   

*******************************************************************************

###  Organising your data set   

Before you extract actual data for the meta-analysis you need some sort of system to manage data extractions and store the data (we assume by now you already have a system for organising and storing your references and papers, so we don't cover this). For data extractions, many people just stick to Excel spreadsheets, or any other spreadsheets or extraction forms that can be converted into spreadsheets (e.g. Google Forms). Some researchers even build elaborated relational databases (which recoup the high initial investment cost with many benefits later on). Whatever you chose, you need a platform where you can freely add and edit columns and be able to store different types of data, so rigid systems purpose-built for medical trial data are not recommended. In this exercise we will stick to the simplest, but flexible platform - an Excel spreadsheet.    

**QUESTION 1:**  
What would be a minimum set of columns needed in an Excel sheet for a meta-analysis?   
(Remember, you need a separate column for each data/information type)   

**QUESTION 2:**   
What other columns would be useful? Give examples of at least 5 other columns that could be added?   


**QUESTION 3:**   
What is the purpose of extracting additional variables?   


**QUESTION 4:**   
What is wrong with this table representing a fragment of an extraction spreadsheet?        

+---------------+--------------------+---------------+-------------+-------------+-------------+   
| StudyID       | Species            | mean 1        | SD 1        | N 1         | P           |   
+===============+====================+===============+=============+=============+=============+   
| Weil2006      | Phodopus sungorus  | 45.4          | 6.4      .  | 10          | 0.023       |   
+---------------+--------------------+---------------+-------------+-------------+-------------+   
| Sadd2006      | mealworm beetle    | NA            |not reported | 8 - 9       | < 0.011     |   
+---------------+--------------------+---------------+-------------+-------------+-------------+    


**QUESTION 5:**    
What is the use of the CohortID column in the extraction table below (just a fragment of a larger example extraction sheet)?    

+----------+----------+------------------+-------+-------+-------------+------------+-----------+
| StudyID  | CohortID |Species           | sex   | age   | mean_control| SD_control | N_control |
+==========+==========+==================+=======+=======+=============+============+===========+
| One2019  | One2019F |Phodopus sungorus | F     | 60    | 3.6         | 1.3        | 10        |
+----------+----------+------------------+-------+-------+-------------+------------+-----------+
| One2009  | One2019M |Phodopus sungorus | M     | 60    | 12.1        | 3.1        | 12        |
+----------+----------+------------------+-------+-------+-------------+------------+-----------+
| One2019  | One2019F |Phodopus sungorus | F     | 120   | 8.3         | 2.2        | 10        |
+----------+----------+------------------+-------+-------+-------------+------------+-----------+
| One2009  | One2019M |Phodopus sungorus | M     | 120   | 14.5        | 4.4        | 12        |
+----------+----------+------------------+-------+-------+-------------+------------+-----------+


**QUESTION 6:**    
What is the use of the CohortID column in the extraction table below (just a fragment of a larger example extraction sheet)?   

+----------+----------+------------------+-------+-------+-------------+------------+-----------+
| StudyID  | CohortID |Species           | trait | age   | mean_control| SD_control | N_control |
+==========+==========+==================+=======+=======+=============+============+===========+
| Two2019  | Two2019a1|Phodopus sungorus | calls | 60    | 3.6         | 1.3        | 10        |
+----------+----------+------------------+-------+-------+-------------+------------+-----------+
| Two2009  | Two2019a1|Phodopus sungorus | mass  | 60    | 12.1        | 3.1        | 12        |
+----------+----------+------------------+-------+-------+-------------+------------+-----------+
| Two2019  | Two2019a2|Phodopus sungorus | calls | 120   | 8.3         | 2.2        | 10        | 
+----------+----------+------------------+-------+-------+-------------+------------+-----------+
| Two2009  | Two2019a2|Phodopus sungorus | mass  | 120   | 14.5        | 4.4        | 12        |
+----------+----------+------------------+-------+-------+-------------+------------+-----------+


**QUESTION 7:**    
What is the use of the CohortID column in the extraction table below (just a fragment of a larger example extraction sheet)?   

+----------+------------+------------------+-------+------+-------------+------------+-----------+
| StudyID  | CohortID   |Species           | trait | age  | mean_control| SD_control | N_control |
+==========+============+==================+=======+======+=============+============+===========+
| Three2019| Three2019s1|Phodopus sungorus | calls | 60   | 3.6         | 1.3        | 10        |
+----------+------------+------------------+-------+------+-------------+------------+-----------+
| Three2019| Three2019s1|Phodopus sungorus | mass  | 60   | 12.1        | 3.1        | 12        |
+----------+------------+------------------+-------+------+-------------+------------+-----------+
| Three2019| Three2019s2|Phodopus campbelli| calls | 60   | 8.3         | 2.2        | 10        |
+----------+------------+------------------+-------+------+-------------+------------+-----------+
| Three2019| Three2019s2|Phodopus campbelli| mass  | 60   | 14.5        | 4.4        | 12        |
+----------+------------+------------------+-------+------+-------------+------------+-----------+


**QUESTION 8:**    
What is the use of the Control_grID column in the extraction table below (just a fragment of a larger example extraction sheet)?   

+----------+----------+-------------+----------+-------------+----------+------------+---------+
| StudyID  | CohortID | Control_grID| treatment| mean_control| N_control| mean_treatm| N_tratm |
+==========+==========+=============+==========+=============+==========+============+=========+
| Four2019 | Four2019a| Four2019c1  | virus    | 4.8         | 20       | 21.1       | 14      |
+----------+----------+-------------+----------+-------------+----------+------------+---------+
| Four2009 | Four2019b| Four2019c1  | bacteria | 4.8         | 20       | 11.3       | 16      |
+----------+----------+-------------+----------+-------------+----------+------------+---------+
| Four2009 | Four2009a| Four2019c2  | virus    | 6.3         | 19       | 33.3       | 10      |
+----------+----------+-------------+----------+-------------+----------+------------+---------+
| Four2009 | Four2009b| Four2019c2  | bacteria | 6.3         | 19       | 14.4       | 12      |
+----------+----------+-------------+----------+-------------+----------+------------+---------+


**QUESTION 9:**   
Why should we record meta-data when extracting data for a meta-analysis?   


**Note:** In your actual extraction sheet/form, try to group related columns together. You can also color-code them in Excel or put them on the same tab/section in a visual database interface, if used. Your extraction form (spreadsheet) should be tested on several papers (pilot extractions) to make sure it is easy to use and captures necessary information.  

*******************************************************************************

###  Extracting and coding

**QUESTION 10:**   
Is one person sufficient to extract the data? 


**QUESTION 11:**   
In what order would you extract your included studies? Random? Chronological? Any other?


**QUESTION 12:**   
When numerical data is reported in the text or tables, it is easy to get exact values for your extraction columns. However, often data is reported in the figures. Can we extract such data? Is it always possible?   


**TASK 1**:  
We will practice data extraction on few of the Terminal investment papers. We will use the R package *metaDigitise*.  

Detailed package description and tutorial are available at: https://cran.r-project.org/web/packages/metaDigitise/vignettes/metaDigitise.html or     

https://github.com/daniel1noble/metaDigitise and this publication:  
https://besjournals.onlinelibrary.wiley.com/doi/10.1111/2041-210X.13118   

I installed the packages and loaded the R packages and libraries beforehand, for you to use below. If you want to do this on your local computer and R, you can use the following code:

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

Let's try to extract data from two selected papers::   
 1. Figure 2a in the paper by Weil et al. 2006: Immune challenge retards seasonal reproductive regression in rodents: evidence for terminal investment (**[Weil2006.pdf](https://github.com/SusZaj/metaanalysis/blob/master/papers/Weil2006.pdf)**)
 2. Figure 2a in the paper by Sadd et al. 2006: Modulation of sexual signalling by immune challenged male mealworm beetles (*Tenebrio molitor*, L.): evidence for terminal investment and dishonesty (**[Sadd2006.pdf](https://github.com/SusZaj/metaanalysis/blob/master/Sadd2006.pdf)**)   

You will need to open the pdf files and take the snapshots of the relevant figures (for Mac OS the keyboard shortcut is easiest: press Command+Shift+4 and then select the screen fragment; for Windows see https://www.windowscentral.com/how-take-windows-10-screenshot-7-best-techniques). Make sure you capture the axes and axes labels. Also, enlarge these figures to fill the screen before taking the snapshot to get a higher resolution image.   

We did this as well and named the snapshot files, which you can see as little thumbnails below,  as following (this makes it easy to keep track of the figures being digitised)     
**001_Weil_2006_Fig2a.png**    ![](https://github.com/SusZaj/metaanalysis/blob/master/images/001_Weil_2006_Fig2a_small.png?raw=true)
<br>
and   
<br>
**002_Sadd_2006_Fig2a.png**   ![](https://github.com/SusZaj/metaanalysis/blob/master/images/002_Sadd_2006_Fig2a_small.png?raw=true)
<br>

We have to place them in a new folder - let's call it **metaDigitise_figures** (read more about organising your extraction directories in the "Setting up directory structures " section of https://cran.r-project.org/web/packages/metaDigitise/vignettes/metaDigitise.html).   

To extract our two figures we need to provide the directory path name of the folder with the images to the *metaDigise()* function, in our case::

<codeblock id="ch2_ex4_a">

data <- metaDigitise(dir = "data/metaDigitise_figures/") 

</codeblock>


Tell *metaDigitise()* you would like to process new images by selecting option "1".   

The next question is whether the plots are different or same - this is about the plot type and since we have a box plot and bar plot with means and SE, we can treat them as the same plot types, so enter "s" and for the next question "m".   

The first plot (**001_Weil_2006_Fig2a.png**) should be loaded at this stage. We do not need to rotate the image, so enter "c".   

Now we can store the information about y-variable type - enter "testes volume (mm3)".   

First you are asked to calibrate the y-axis. To do this as precisely as possible, enlarge the plot viewer before clicking on the lowest and highest marked values (in this case, 200 and 900). Enter these values as prompted. The program will then show you your calibration and ask if you want to re-calibrate; if it looks accurate enough, click “n” to proceed, otherwise click “y” to try again.      

Its good to enter sample sizes at this point. Since there is no such info in the plot or under the plot, search the full text for the sample sizes (hint: look in "Statistical analysis"). Ideally, to do it efficiently you would already have extracted this and other available information into your spreadsheet, then saved the figures, and then come back at the end to process all the figures at once. This way you have everything at hand when you do data extraction from the figures.   

Once you have the information on the group names and sample sizes, enter an identifier for the control group ("saline") and sample size for this group.    

Since we have multiple data points for each group of animals, we have to decide whether to extract all of them or just one (or some subset) - your decision should be biologically-informed and ideally a priori. For this exercise we will extract just the last one (at 6 weeks). Click on the outer edge of the error bar of the last black point, and then click the middle of the black dot. If it went well you can add the treatment group "LPS" in a similar manner. If something went wrong you can delete and repeat the extraction.  

Once you extract data for the treatment group, select "Finish plot" (enter "f"), select "se" and continue "y" to move to the next image.   

Now you should be able to extract data from **plot 002_Sadd_2006_Fig2a.png**! (hint: extract "treatment control" and "treatment" groups).

Once you get a "Congratulations" message, you can look at the extracted data. *metaDigitise()* stores and sorts all the summary data for each of the figures in the "data"" object:   

```{r see extractions metadigitise, eval=FALSE, message = FALSE}
data
```

You can add more figures in the directory and add more data to this data table later, or save it and load back later to continue adding more data or merge with other data frames (see "Re-importing previously digitised data and accessing raw data" in the *metaDigitise* tutorial at https://cran.r-project.org/web/packages/metaDigitise/vignettes/metaDigitise.html).   

```{r save metadigitise, eval=FALSE, message = FALSE}
write.csv(data, file = "filename.csv") #adjust the file name and path as needed
```


As you see, *metaDigitise* guides you gently through the all steps of data extraction from figures. It also nicely organises and stores the data for you. You should invest some extra time into learning this handy tool. If you have some time left after this exercise go through the full tutorial at https://cran.r-project.org/web/packages/metaDigitise/vignettes/metaDigitise.html       

*******************************************************************************

###  Converting different types of information   


Since now we have a few data points extracted we could calculate effect sizes from them. We first need to reshape our data frame.   

**QUESTION 13:**   
Why do we need to change our data frame (and how)?      


**TASK 2**:
Since we have only 2 data points per file, it is easy to reshape the data frame in R.   

```{r reshape data, eval=FALSE, message = FALSE}
data$group <- c("c","t") #assign rows to control or treatment codes (in this case its easy, but be careful)
tdata <- filter(data, group == "t") #extract treatment data rows
cdata <- select(filter(data, group == "c"), filename, group_id, mean, sd, n, se) #extract control data rows
data_new <- full_join(cdata, tdata, by = "filename") #join data
data_new <- select (data_new, -c(plot_type, error_type)) #remove unnecessary coumns
data_new
```

Now the columns appended with .x contain control groups data values, and these with .y are for the treatment groups (you can rename the columns to make it easier to see, e.g. using the *rename* function https://dplyr.tidyverse.org/reference/select.html).   

**TASK 3**:  
We will now use the *escalc* function from *metafor* package to calculate effect sizes. This function allows to calculate various effect sizes or outcome measures (and the corresponding sampling variances) that are commonly used in meta-analyses, including two effect sizes that are relevant to our data and question:   
 * "SMD" stands for standarised mean difference, i.e. Hedges' *g* (potentially also "SMDH" for heteroscedastic variances).   
 * "ROM" for the log transformed ratio of means (Hedges et al., 1999; Lajeunesse, 2011), also named lnRR.   
We calculate them as follows:   

```{r calculate SMD , eval=FALSE, message = FALSE}
SMD <- metafor::escalc(measure = "SMD", data=data_new, m1i=mean.y, m2i = mean.x, sd1i=sd.y, sd2i= sd.x, n1i = n.y, n2i=n.x, append = FALSE) #note we have treatemnt group as 1 and control as 2, so we can get possitive effect size for larger investment in treatment group
SMD
```

```{r calculate ROM , eval=FALSE, message = FALSE}
ROM <- metafor::escalc(measure = "ROM", data=data_new, m1i=mean.y, m2i = mean.x, sd1i=sd.y, sd2i= sd.x, n1i = n.y, n2i=n.x, append = FALSE)
ROM
```


**QUESTION 14:**   
What should you do next?   

<br>

With these two papers we just extracted, we had a relatively easy job. There were descriptive statistics values reported in the plots. If we cannot get means and standard errors (or SD) from the text, tables and figures (or already-calculated effect sizes, which is still rare), we can look for test (inferential) statistics. Test statistics that are usable include t-values form t-tests, F-values, Chi-square values, and p-values. These values from simple statistical tests (like independent or paired t-tests) are easily convertible into SMD (*d*, *g*) or r (correlation coefficient). These conversions and some others can be calculated in R if you know the formulas (including conversion from SMD to correlation coefficient), but for the exercise purpose we will use this web-based Practical Meta-Analysis Effect Size Calculator:   
https://www.campbellcollaboration.org/research-resources/research-for-resources/effect-size-calculator.html   


```{r webEScalcualtor, echo=FALSE, fig.cap=" ", out.width='100%'}
knitr::include_graphics("../images/webEScalcualtor.png")
```

Open the above webpage. The main menu has an expandable list of types of effect sizes, and statistical tests you can use to calculate these effect sizes (only *d*, *r*, *OR* and *RR*).   


**TASK 4**:   
Weil (2006) reports in the results: "At the end of the experiment saline-injected animals had smaller testes (F 1,27 = 4.6875, p<0.05, figure 2b)" and in the methods it is noted these are calculated using ANOVA.
Use the web-based effect size calculator sheet selecting "Standarized Mean difference (d)" and "F-test, 2 groups" to calculate *d* from one-way ANOVA (you will need F-value and sample sizes of treatment and control groups).   

You should get *d* for the testes  mass that is close to what we calculated for tests volume from Fig2a. Note that this web calculator provides confidence intervals (CI) and variance for the calculated effect sizes.

**TASK 5**:   
Using the web-based effect size calculator, estimate a few other effect sizes using test (inferential) statistics reported in **Sadd2006.pdf**.   

In practice, we would prefer to do this in R, rather than in an online app or any other non-scriptable software that cannot document our calculations. Luckily, the R package *compute.es* allows us to not only compute various effect sizes from descriptive statistics, but also from inferential statistics.   

The *compute.es* function inputs and names are as follows:   
 * ANCOVA F-test: "a.fes()""   
 * ANCOVA means: "a.mes()"   
 * ANCOVA means (pooled sd): "a.mes2()"   
 * ANCOVA p-value: "a.pes()"    
 * ANCOVA t-test: "a.tes()"   
 * Chi-squared (1 df): "chies()"   
 * Correlation: "res()"    
 * d-statistic: "des()"    
 * Failure group (binary): "failes()"    
 * F-test: "fes()"   
 * Log odds ratio: "lores()"    
 * Means: "mes()"    
 * Means (pooled sd): "mes2()"   
 * Proportions (binary): "propes()"    
 * p-value: "pes()""    
 * t-test: "tes()""    

To learn more see the package vignette or https://www.rdocumentation.org/packages/compute.es/versions/0.2-4/topics/compute.es-package    

As an example, we will use the F-value from **TASK 4**. Note that functions from the *compute.es* packages automatically calculate all available effect sizes for the given input and if you run it on a data frame it will generate a new data.frame with several effect size estimates. Try:   

```{r use compute.es, eval=TRUE, echo = TRUE, message = FALSE}
#single calculation:
a.fes(f = 4.6875, n.1 = 28, n.2 = 10, R = 0, q = 0) #where we enter F-value, sample sizes of treatment and control group, covariate correlation and number of covariates (we have none in ANOVA))

#for vectors of values (like in a data frame):
results_ES <- a.fes(f = c(4.6875, 4.6875), n.1 = c(28, 10), n.2 = c(10, 10), R = c(0, 0), q = c(0, 0))
str(results_ES)
```


**QUESTION 15:**   
If both descriptive statistics (mean, SE or SD) and test (inferential) statistics are reported, which one should we extract from a paper?


**QUESTION 16:**    
Is the sign of the effect size important? Imagine we use *d*, which represents mean_treatment - mean_control group trait values. How we would interpret *d* = 0.5 and how we would interpret *d* = -0.5?


**QUESTION 17:**    
If we have different traits in the data set (let's say number of eggs laid and probability of nest abandonment) what is the problem with the signs of effect sizes for these traits? What should we do about this?   

*******************************************************************************

### Documentation and reporting


**QUESTION 18:**   
As you hopefully remember, the PRISMA checklist is a document that helps ensure you report the key information on how a systematic review (including meta-analysis) was done.    

Have a look again at the PRISMA checklist (http://prisma-statement.org/documents/PRISMA%202009%20checklist.pdf). Find and read the items that are related to what we have covered in this exercise. What are the numbers (in the # column) of these items?    


**Note:** worth repeating again, this PRISMA was designed for medical systematic reviews, and some items are not very relevant or useful. Also, it is due to be updated.   
<br>


**QUESTION 19:**   
Although not mentioned in the original PRISMA checklist, it is important to share the collected data, meta-data and analysis code. Think of at least 3 reasons for doing so.


</exercise>

<exercise id="5" title="Data analysis">

# Data analysis

</exercise>

<exercise id="6" title="Evidence summary & assessment of certainty">

# Evidence summary & assessment of certainty

</exercise>

<exercise id="7" title="Report and interpret results">

# Report and interpret results

</exercise>
