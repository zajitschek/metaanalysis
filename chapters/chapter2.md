---
title: 'Chapter 2: Step-by-step: The structure of a Meta-analysis'
description:
  'We will work through each specific step in a meta-analysis. Based on Losias papers_search material'
prev: /chapter1
next: /chapter3
type: chapter
id: 2
---

<exercise id="1" title="Research question and literature search">

# Formulating the question for a meta-analysis  

Often, a topic of interest is rather broad and vague. For a meta-analysis we need a much more concrete question, otherwise you will end up with tens of thousands of studies to include.
Generally, the more focused the question, the easier and quicker it is to perform the meta-analysis. The downside is of course, that the answer may be less general and there might be less evidence available.
<br>
<br>

# Literature search

There are different protocols for how to gather the literature for a systematic meta-analysis. We will walk through a specific literature search below, using one established protocol. Please note that this is in itself an active area of research though. For example, I would like to mention the *[metaverse](https://rmetaverse.github.io/)*, a collection of R packages that is aimed at integrating all steps of a meta-analysis. The package *[litsearchR](https://elizagrames.github.io/litsearchr/)* seems especially promising, and you could try it out on your local R installation (right now, I haven't installed it in the R software container you will be using during this course / online).


### How to get started:

 a) Check if there already is a good recent meta-analysis on the topic.  
 b) Find and carefully read key reviews on the topic.  
 c) Find and read a few representative empirical papers (hint: papers that attract a lot of citations may count as key paper)  
 d) Further refine the question (particularly important if your search returns many thousands of hits on your topic).  

## Example / Exercise
To show you how those steps can be done, we are doing this as a step-by-step exercise, using **terminal investment in animals** as a general research topic that we want to explore further, using meta-analytic approaches.

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)   What is [terminal investment?](https://en.wikipedia.org/wiki/Terminal_investment_hypothesis)
<br>
<br>

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)    
**Are there any meta-analyses (or similar) on terminal investment in animals?**

In [Google Scholar](https://scholar.google.com) run:   
*"meta-analytic" OR "meta-analysis" "terminal investment"*    

**you can paste this into search box or use Advanced search (in the Google Scholar menu on the left); see instructions and other Google Scholar tips [here](https://guides.library.ucsc.edu/c.php?g=745384&p=5361954) and [here](https://scholar.google.com/intl/en/scholar/help.html).**     

>You should get around 300 results. You may see a few meta-analyses on stress, diet, senescence, parasitism etc., but none probably specifically on terminal investment. There are many empirical papers coming up in this search because they mention meta-analysis in their body text or reference list - note that Google Scholar searches full text by default. Also by default, the returned results are arranged in order of relevance to the search (whatever that means - its a complex algorithm that decides), and only a few first pages contain some potentially relevant empirical papers.   


![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)  
You can restrict the search to titles only:    
*allintitle: "meta analytic" OR "meta analysis" "terminal investment"*    

>Now there are no matching hits; but there is no option for searching just in titles and abstracts.    
Unfortunately, Google Scholars' search interface is rather simplistic and restrictive. It shows only up to 1,000 results for any particular search query, ranking algorithms are obscured and it is hard to export references. In addition, the literature coverage may fluctuate (it is based on web scraping), and the searches may not be reproducible. Therefore, Google Scholar is not recommended for the main searches in meta-analyses and systematic reviews. On the upside, it can be helpful for additional searches and finding grey literature (not published in peer-review journals).

### Resources
![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) 
Other software useful for exploratory (scoping) and additional searches (check them out later, and note that they may have similar disadvantages to these of Google Scholar):

  * [Semantic Scholar](https://www.semanticscholar.org/)   
  * [Dimensions](https://www.dimensions.ai/)   
  * [CiteHero](https://citehero.com/)   
  * R package *[litsearchR](https://elizagrames.github.io/litsearchr/)* (which I haven't tested yet myself)
   
   
   
***It seems that the question "What is the evidence for terminal investment?" is too general and too broad in scope.***   

Let's try to narrow it down and focus on either *terminal investment in reproduction*, or *terminal investment under immune challenge* (notice the difference between effects *in* reproduction and effects *of* immune challenge.
<br>
<br>

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)  
Run another Google Scholar quick search, including *reproduction* (not in quotes):   
*"terminal investment" reproduction*   

>This time you should get over 2,000 records (you will be allowed to access only the first 1,000 - a limitation of Google Scholar). Note that Google Scholar does so-called 'Automated Query Expansion' for terms that are not set to be exact phrases (in quotes) - it uses alternative forms of these terms.  .

<br>
<br>

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)   
Try Google Scholar quick search:    *"terminal investment" "immune challenge"*    

>This time you should get just over 400 records. Skim through the first three pages of the results to get a feel of the diversity of the studies found (e.g. what taxa are studied and what traits the studies might measure to evaluate reproductive investment) and note the wording of their titles. 
In medical sciences, most meta-analyses (and systematic reviews) fit into the **PICO** (or related) question framework.   

<br>

## PICO stands for:   
  * P = Population   
  * I = Intervention  
  * C = Comparison/Control group   
  * O = Outcome   

Broadly, this should help you identify the key paremeters that you will be working with. You can use the PICO framework for any research outset, even though we might be used to slighly different terminology:  "Population" defines the group  or species of interest, "Intervention" is your "treatment", "Comparision" is the "control" and "Outcome" refers to the traits that you are investigating. In the current situation for example you might like to know if hand washing helps to prevent the spread of COVID19. Here you may define PICO as follows:

  P = humans in COVID affected areas   
  I  = hand washing   
  C = no wand washing   
  O = reduced infection rates   

To frame this in a biological context, perhaps using the [Macartney et al. (2019)](http://www.bonduriansky.net/Macartney_et_a_2019_Biological_Reviews.pdf) study we have mentioned in Chapter 1, the question if interest was to investigate if different diet interventions affect sperm traits. Here, a possible PICO would be 

  P = animal species   
  I = dietary treatment (either over- or underfeeding)   
  C = normal / control diet   
  O = sperm traits (swimming velocity, number, motility)   

Now try to frame our meta-analytic question "whether immune challenge can result in terminal investment" using PICO terms. Please reflect yourself and try to write down your own ideas of what you would define as "P" (Population), "I" (Intervention), "C" (Comparison/Control) and "O" (outcome) that fits this question before clicking on the sample solution below.

<choice id="1">
<opt text="Example solution" correct="true">
 <br> * P = Population                = animal species     
 <br> * I = Intervention              = immune challenge   
 <br> * C = Comparison/Control group  = unchallenged group of animals, otherwise in the same state    
 <br> * O = Outcome                   = reproduction-related traits 
</opt>
</choice>   
<br>
<br>

## Resources 
![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  
An extensive list of alternative systematic review formulation question frameworks can be found [here](https://www.networks.nhs.uk/nhs-networks/nwas-library-and-information-service/documents/alternative-question-structures-for-different-types-of-systematic-review)   
<br>

However, for your 
## question framework you should in general define   
   
•	Variables of interest   
•	research designs   
•	historical, geographical, theoretical context   
   
You will need to know what you're after and what you're not interested in, in order to ***discriminate relevant from irrelevant studies***   


![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) You should always be able to justify your question as important, relevant and timely. This holds true for other research questions as well, and will affect the likelihood of a meta-analysis you propose to perform to gain support (by an academic supervisor, a grant agency, in an academic and a non-academic environment), and its impact on the target audience. 

</exercise>

<exercise id="2" title="Inclusion criteria">

#  Deciding on inclusion criteria   

The basic PICO components are a good start to frame your question, but usually not sufficient to perform the effective screening of the papers for inclusion in meta-analysis.
There are additional technical and biological refinements to be considered for inclusion criteria in our project.

Most importantly, you always need to be able to justify your inclusion criteria, especially if you're planning on publishing your meta-analysis. Think about what you would do (particularly in the context of our "terminal investment" question) for the following questions. You can check what our opinion is by selecting the different options and clicking "submit".
<br>
<br>


**TIME-SPAN**   
**Should we include studies from any year?**

<choice id="1" >
<opt text="Probably yes, unless you can come up with a reason for not doing so" correct="true">
Yes
</opt>
<opt text="Probably not, because the quality of older studies is not good enough">
No, unless you have a very good reason to support this argument.
</opt>
</choice>
<br>
<br>


**LANGUAGE**   
**Should we include studies published in any language?**

<choice id="2">
<opt text="Yes">
Possible, but difficult to do and might not yield a lot more additional information.
</opt>
<opt text="Not necessarily"  correct="true">
Most meta-analyses only include studies published in English by default. However, if possible it is recommend to include studies also in other languages (usually not many are found, unless you also perform your searches in other languages). 
</opt>
</choice>
<br>
<br>

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) Publication status can be also used as a criterion - are you happy to include some types of grey literature (e.g. conference proceedings, theses)?
<br>
<br>
   
**STUDY TYPE**  
**Should we include any type of study? (e.g. correlational vs experimental, if experimental, what type of experiment?)**
>Since we investigate a specific intervention, we should restrict study type to "experimental" (we should explicitly exclude "simulation").

<br>

   
**TAXA**  
**Should we include any type of taxa?**
<choice id="3">
<opt text="Yes, all">
The animal kingdom is vast and diverse, and some species are especially odd (e.g. humans). Does it make sense to include single-cell animals? Does it make sense to include humans? Probably not.
</opt>
<opt text="No. Just include closely related species."  correct="true">
That is a difficult one. It depends on your specific question, and the number of studies available. If your interest is restricted to a specific taxonomic field, then yes, this would be your answer. However, you will loose the ability to generalise answers to your question if this is tightly restricted.
</opt>
<opt text="Exclude specific taxa"  correct="true">
This would probably be our answer for the here posed topic: How about multicellular animals, except humans? Also possible: If many studies across multiple taxa exist, we could focus on the most frequently studied taxa or biologically most interesting. Alternatively we could decide to investigate just vertebrates, except humans. 
</opt>
</choice>

>Another thing worth being specific about is that the animals should be wild-type (non-mutant, not disease models) and ideally not subject to any other significant manipulations that could affect their response (e.g. drug treatment; note there is a thin fuzzy line what these manipulations are). There might also be reasons to exclude standard laboratory species (mice, rat, yeast, fruit fly), or conversely just focus entirely on this group. 

   
   
**MANIPULATION TYPE**   
**Should we include all types of immune challenge?**
>There are several established types of experimental immune challenge (blood cells (e.g. SRBC), protein (e.g. PHA), dead or live pathogens or parasites), so its worth including these and similar procedures. Non-experimental immune challenge (e.g. natural infestation levels) should not be included. If something odd comes up later it can be listed under "exclusion criteria", with justification.

   
   
**CONTROL GROUP**   
**Should we accept any type of control group?**
> The control group (un-manipulated) should consist of similar individuals compared to the "treatment group", as far as reasonable. The "controls" should not be subject to any other manipulation.

   
   
**OUTCOME TYPE**   
**Should we accept any reproduction-related measurements and how do we define "reproduction-related" in the first place?**
>The definition of a *reproduction-related trait* will depend on the species studied (and may require additional reading or relying on the assertions of the authors), and possible refining. Different taxa will have different suites of reproduction related-traits, but these can be grouped into broader categories (e.g. mate attraction includes vocal signals, visual ornaments, pheromone production etc.; reproductive fitness will include number and quality of offspring) and different specific measurements will be available for different taxa and in different studies - this can be quite messy. If we do not have many studies on the topic and very specific question (e.g. "Is the number of offspring affected?") it is OK to be inclusive and later on try to figure out whether some traits are affected more than others.

   
   
**DATA TYPE**  
**Should we accept any type of data for a meta-analysis? (e.g. descriptive statistics (summarising populations), and which ones, or also inferential statistics (based on population samples and used to estimate parameters and test hypotheses), and which ones? This will be linked to the effect size you are planning to use!)**
>It depends on the effect size we are planning to use. In our project it can be Cohen's *d*(Hedges *g*) or *lnRR*, which are typically calculated from mean, SD or SE and N (sample sizes). However, Cohen's *d* (Hedges *g*) can be also inferred from some of the test statistics, or even proportions, if means and other descriptive statistics are not available. But one cannot calculate *lnRR* from inferential statistics. Other considerations include what to do if some data is missing or unclear.  

   
   
## Making decision trees for literature screening    

Decision trees are visual representations of our inclusion criteria and decisions we have to make when screening literature. Importantly, good decision trees can make screening the literature faster and more reliable. How does that work? Briefly, if the initial (most general) questions representing screening criteria are not fulfilled, the study gets excluded and there is no need to evaluate the remaining criteria, so we save some time.    

You can make your decision trees by hand, make a flow chart in Power Point or use any MindMapping software (if you want to go that route - I recommend Visually Understanding the Enviroment, [VUE](https://vue.tufts.edu/). 

The screening of literature is usually done in two stages:   
  1. abstract + title + keywords    
  *This will be done on the bulk of the papers found in your search*
  2. full text + supplementary information   
  *This requires that you carefully go through your list of "included" studies obtained in step 1 and more details in the "bottom branches"" of your decison tree*

## We need two decision trees!
#### one for each stage: Abstract / Full text
This is because abstracts, titles and keywords do not contain enough information to conclusively answer all of the inclusion criteria questions - you should be excluding every paper for which you cannot answer "yes" to all the questions. 

This first step of screening requires a relatively simple decision tree. A good tree starts from the questions that are easiest to answer (e.g., if we had any year or language restrictions we would put these on the top). During abstract screening, we exclude the records where a definite "no" can be inferred from available information. At the same time we allow for some uncertainty for the "yes" answers by allowing "probably" as an acceptable answer for inclusion. This will be doble checked in full text screening. 

An example decision tree for abstract screening looks like this:![](https://github.com/SusZaj/metaanalysis/blob/master/images/decisiontree.png?raw=true)


   
**In the abstract screening decision tree there is no question about the type of data used to express measurements reported in the study. Why?**   
>Full-text screening is more strict and we want answers to all our inclusion criteria. In principle, we only have "yes" and "no" answers to the screening questions. However, in practice, if a study looks very relevant but some information is ambiguous or missing, you may decide to contact the authors to get some extra information or data. In such case, you can provisionally include such papers and make final decision once you get, or not, the author's replies.  


### In a decision tree for full-text screening, we will include an additional rule:   
   
> Are means and SD (or SEs) and N (sample sizes) for treatment and control groups, or test statistics from which effect sizes for the difference between the two groups can be calculated, available?

If the answer is **yes**, the study can be included for meta-analysis.


**What question is missing on the top of the full-text decision tree?**
**(Tip: what happens between abstract and full text screening?)**
>The missing question is: **"Is the full text of this study available for our assessment?"**   
It is often not explicitly stated, but without the full text it is impossible to extract all the necessary information about the study and the data. 
It is a good practice to keep this in mind and use as one of your potential inclusion/exclusion criteria.

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  You can read more about how to come up with good decsicion trees on **[Losia's blog](http://www.i-deel.org/blog/around-meta-analysis-12-decision-trees)**

<br>

##  Performing searches for relevant literature  

Ideally, we attempt to do a fairly comprehensive literature search (a full systematic review). The reason for this is to gather as many relevant data points as possible, to increase the power of statistical analyses. In addition, we are making an effort to capture obscure studies that potentially are more likely to report non-significant results. This is importnat as it may help to reduce publication bias in our data set. 
<br>

### Search strategy

You should conduct your literature search on at least two wide-coverage/interdisciplinary databases (we recommend **Scopus** and **Web of Science**), and a few additional sources of literature such as forward and backward reference searching (looking at cited and citing papers), publication lists of the key authors or labs. In addition, one could also search for unpublished studies and data sets (this will not be covered here).   
<br>
    
#### For this exercise we recommend some core search using 2 databases:
Scopus and Web of Science.

## Resources
![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  
 * [Scopus](https://www.scopus.com/)   
 * [Web of Science (WoS)](http://apps.webofknowledge.com)   

WoS coverage depends on the institutional subscription package purchased, so results of searches can vary among institutions (so make sure to log in via your libarry, if working from home). Also searching just core collection vs. all available databases can make a difference.     


![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)   
Using Scopus **Advanced Search** (you can read more about the syntax [here](https://dev.elsevier.com/tips/ScopusSearchTips.htm) run these search strings:  

 **1** *TITLE-ABS-KEY ( "terminal investment"  AND  "immune challenge" )*    
> you'll likely only get a few hits - search terms too restrictive    
   
 <br>   

 **2** *TITLE-ABS-KEY ( ( "terminal investment"  OR  "reproductive effort" )  AND  ( "immune challeng\*" OR  "immunochalleng\*" ) )*
> a bit better, but still too restrictive    
   
 <br>   

 **3** *TITLE-ABS-KEY ( ( "terminal investment"  OR  "reproductive effort" )  AND  ( "immune challeng\*"  OR  "immunochalleng\*"  OR  "infect\*" ) )*
> the number of hits has improved, but we probably now have included many non-experimental studies while still missing relevant experimental ones   
   
 <br>   

 **4** *( TITLE-ABS-KEY ( ( "terminal investment"  OR  "reproductive effort" )  AND  ( "immune challeng\*"  OR  "immunochalleng\*"  OR  "infect\*" ) )  AND NOT  TITLE-ABS-KEY ( load  OR  human  OR  people ) )* 
>by adding a group of exclusion terms (AND NOT) we probably got rid of some irrelevant studies.   
    

Ideally, you run some scoping searchers, read some reviews and relevant papers and then test some more terms for inclusion. You should also do some pilot abstract screening on papers exported from just one database, to help you figure out additional exclusion terms which should be included in your search string.
   
   
![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  When you to register in Scopus and WoS, you can searches and alerts across multiple search sessions.
   
   
![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  The \* symbol stands for wildcard and indicates "any symbols" since these databases do not do Automatic Query Expansion.    
    
    
![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)    
We can easily translate our final search string from Scopus into Web of Science (WoS) **Advanced Search** (you can read more about the syntax [here](https://images.webofknowledge.com/images/help/WOS/hs_search_operators.html). 

### Run this search string:    
*TS = (( ( "terminal investment" OR "reproductive effort" ) AND ( "immune challeng\*"  OR  "immunochalleng\*"  OR  "infect\*"  ) ) NOT ( load OR human OR people ) )*  
> you may find that you get more in WoS than from Scopus   

Both Scopus and WoS allow exporting the found records (with limitations on the max. number per export, **remember to tick the boxes for exporting abstracts!**).  There are multiple file formats you can use, but .ris and .bib are most commonly used ones. You will need to figure out which ones work for your reference manager software \.

## Reference Managers
![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  You will need to use referencin software.  Your institution may have a subscription for ReferenceManager or Endnote - common free editors are for example [Mendeley](https://www.mendeley.com/) or [Zotero](https://www.zotero.org/). Check in with your libary on the use of such software, if you're not sure how to use it. 


The next step is to download all your found records from your "final" search into the reference manager of your choice. Combine the references from two databases into a single project/folder and remove duplicates (most reference managers have this function, but it never works perfectly - do a visual check after sorting by titles!) before proceeding to the reference screening stage. 

An R package *[revtools]* available [on cran](https://cran.rstudio.com/web/packages/revtools/) or [revtools.net](http://revtools.net/) can act as a reference manager and also has a good de-duplication function.      

## Pre-registering your meta analysis
![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  As we're aiming for maximum reprocicibility and transparancy, the gold standard would be to upload your meta-analysis protocol and pre-register your meta-analysis around this stage. If you want to know more about [pre-registration](https://en.wikipedia.org/wiki/Preregistration), consider signing up on  [OSF](https://osf.io/)!

</exercise>

<exercise id="3" title="Screening the literature">


Theoretically you could do screening in the database browser or your reference manager, but since it is recommended that 2 people do the screening independently (or at least part of the screening), it is good to use a dedicated tool to manage this process. 

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  
## Why two?
>To avoid bias - we all have preferences and biases, so having two people to independently think about which studies should or should not be included - and importanly, discuss the discrepancies - is considered good practise. The effect of single vs double screening has even been tested in a [study](https://bmcmedresmethodol.biomedcentral.com/articles/10.1186/s12874-019-0782-0)

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true)  For more insight on gold standards take a looks at the *Preferred Reporting Items for Systematic Reviews and Meta-Analyses (PRISMA)* [resources](http://prisma-statement.org/).

## Resources
 * [Rayyan](https://rayyan.qcri.org/welcome) (free, you can use it in the web browser or as a phone app; for more details [see](http://libraryguides.mcgill.ca/rayyan/home)  
 * [Abstrackr](http://abstrackr.cebm.brown.edu/account/login) (another free tool)
    

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) It is possible that the de-duplication algorithms in these are not very good, so it is advisable to de-duplicate and check your records in the reference manager before uploading to the screening software.    
   
   
![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)   
We prepared a file (for download: [Scopus10.ris](https://github.com/SusZaj/metaanalysis/blob/master/papers/scopus10.ris))
 with 10 references sampled from the set found using the search string in Scopus database (used *( ( "terminal investment"  OR  "reproductive effort" )  AND  ( "immune challeng\*"  OR  "immunochalleng\*" ) )  *) (same references came up in the equivalent search in WoS).    

![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) Sometimes the biblio-files with the same extension differ slightly in structure and across reference managers, which means that Rayyan may have problem opening them. Be aware that getting your files into exactly the right format may require some tweaking.   

## Abstract screeing in RAYYAN
We will use these ten references to practice title and abstract screening in Rayyan. Screening can be also done in Abstracker. (Rayyan is considered a little more reliable and more user-friendly, but may  be slow with updating the display).   

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)    
Create a new project in Rayyan:

 1. Open Rayyan (we assume you already created a free account) and log in.    
 2. My Reviews -> New REVIEW...   
 3. Enter project title, e.g. "Terminal Investment"" and description, e.g. "test"."   
 4. Select files -> upload *Scopus10.ris* from the *data* sub-folder and press Continue.   
 

It may take several minutes for larger files and slower connections, but eventually the uploaded references should appear in the left panel under "Search methods" (you can upload more files with references via "Add new" link). Click on the "Uploaded References [scopus10.ris]" link in this panel to see the references in the right panel. Generally clicking on the links within panels on the left will filter the records in the right panels to include only highlighted sets (to get rid of the filter click on it again to remove highlighting).  
In the left panels there are several sub-panels.   

a) In the "Keywords for include" you can add (via "Add new" link) following terms (or at least a few of these): challenge, challenged, injected, injection, infected, infection, PHA, SRBC, vaccine (these terms will be highlighted green in the titles and abstracts to help them find more easily; Rayyan tries to populate this list by itself - but its algorithm is medical-centered so you should adjust this list for your projects).   
 
b) "Keywords for exclude" - set to: review, reviewed, model, human, people, women, men (these terms will be highlighted red in the titles and abstracts to help them find more easily; again, Rayyan tries to populate this list by itself).    
 
c) Click on "All reviews" button in the top right corner to go to the project lists, then open your project again by choosing it from the list. A view with a pie chart (your screening progress) and a few buttons will appear. If you need to invite other people to do screening in parallel with you, do that by clicking on the "Invite" button. Stick with "Collaborator" selection and enter the email and message (e.g. "help me!"). Open your project again - you should see your collaborators added with some info on their work so far. Press on "Show" button to see the references view.   
 
d) Click on the first review from the top - an abstract and other record info will appear in the bottom panel.  
 
e) Using our abstract screening decision tree decide whether include this paper for the next stage of screening and press the "Include" or "Exclude" button accordingly. And do the assessment for the remaining records. As you go you can create and assign new labels to individual records, e.g.: "unsure/check". You could also enter reasons for exclusion, e.g. "human" (we normally don't do this as there are often hundreds or thousands of excluded records per project at this stage).  
 
f) Go to "All reviews" and check if other people finished their screening, if applicable. After that you can lift the "blind" mode (when collaborators cannot see each others decisions). For collaborative screens Rayyan will now provide filters to display all consensus included, consensus excluded and records with conflicting decisions. If you have any "conflicts" have a look again and discuss why you couldn't agree on a given record , come to agreement and make final decision. Export the records with final consensus decisions, for documentation, into a .csv file. You can filter the records into “Included” and just export those, also you can export them as a .bib or .ris file into a reference manager where you will collect full texts for the nest stage of the screening.   

How many papers did you exclude? How many conflicts did you have if you collaboratively screened and, if so, what was causing these conflicts? Can the decision tree be improved and how?   

>We think 4 should have been excluded:    
>**Simmons2009** and **Clancy2013** as human studies, but    
>**Gershman2010** and **Gonzales-Tokman2013** as not likely to have any reproduction-related measurements.   

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true) 
It is time to do the full-text screening for the papers that passed title and abstract screening. There are some full-text papers that passed the initial screening in the directory - assess (**[Nielsen2012.pdf](https://github.com/SusZaj/metaanalysis/blob/master/papers/Nielsen2012.pdf)**) and (**[Ardia2005.pdf](https://github.com/SusZaj/metaanalysis/blob/master/papers/Ardia2005.pdf)**) using our full-text screening decision tree. (Tip: do not read the whole paper - just try to skim it and look for the key information.)      

What is your decision about **Nielsen2012** and **Ardia2005** papers?   
<choice id="1">
<opt text="Include both"> 
Not quite.
</opt>
<opt text="Exlude both">
Unfortunately wrong.
</opt>
<opt text="Only include **Nielsen2012**" correct="true"> 
YES! Include **Nielsen2012**, exlude **Ardia2005**. Why? Exclude due to the lack of a good control group.
</opt>
<opt text="Only include _Ardia2005_"> 
Why exclude _Nielsen2012_?
</opt>
</choice>


## PRISMA and other documentation  

It is very important to keep detailed record of the whole searching, screening and data extraction process (= your protocol). Searching and screening are usually represented as some variant of a PRISMA diagram. If you need to refresh your memory, re-read the *Preferred Reporting Items for Systematic Reviews and Meta-Analyses (PRISMA)* [resources](http://prisma-statement.org/).

With our 144 records from Scopus, 249 from WoS (these two databases are our "main search"), and imaginary around 400 records from other searches of other sources of literature we might have done we would probably end up with something like this one:    

![](https://github.com/SusZaj/metaanalysis/blob/master/images/prisma.png?raw=true)
<br>

</exercise>
