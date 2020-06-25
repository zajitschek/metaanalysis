---
title: 'Chapter 4: Additional Resources'
description:
  'Hints on Phylogenetic trees; tips and tricks'
prev: /chapter3
next: null
type: chapter
id: #4
---

<exercise id="1" title="Phylogenies">

# Introduction
***based on Losia's "Trees - making" workshop***   
   
Ecological and evolutionary meta-analyses often aggregate data across multiple species. Since species are more or less closely related, depending on evolutionary history, effect sizes of closely related species can be more similar to these of less-related species. This means that the level of relatedness between species will influence outcomes, and their non-independence  needs to be accounted for.
We can add a random factor to multilevel meta-analytic models, which consists of a  correlation matrix of phylogenetic relatedness. 
To create such a a relatedness matrix among species, we need a phylogenetic tree, specifically for the list of species that are occuring in our data set.  

***A few things to note:***

**1**  We can use a tree with or without branch lengths (divergence measures) although we do need branch lengths for analysis (often making certain assumptions).  

**2**  The tree has to be binary (strictly bifurcating = no polytomies, i.e. only two branches are coming from each node). Here is a simple example: 

**3**  The tree needs to be rooted (has a node representing the most recent common ancestor of all the species in the tree). 

![Phylogenetic Tree examples](https://github.com/SusZaj/metaanalysis/blob/master/images/trees.png?raw=true)


**4**   The tree tip labels (representing species) must match **exactly** with the species names in the data set (otherwise MA models will not run with them).  

**5**   Trees can be also made and used for higher taxonomic levels than species, e.g. genus-level, following the same logic.   

**4**  The tree tip labels (representing species) must match **exactly** with the species names in the data set (otherwise MA models will not run with them).  

**5**  Trees can be also made and used for higher taxonomic levels than species, e.g. genus-level, following the same logic.   


# Making a Phylogenetic Tree

The general flow of tree-making work is shown in the diagram below.  
You will usually start with species list from the meta-analytic data set (use binomial Latin names for the species list and in your database). 

![Phylogenetic Tree workflow](https://github.com/SusZaj/metaanalysis/blob/master/images/guide.png?raw=true)

First, check if there is any phylogenetic tree available that already contains all your species (e.g. a super-tree). Currently, the easiest way to build a custom phylogenetic tree usable for meta-analysis is by using an R package called *rotl*, 
   
   
# Different Tools 

I'll introduce how to use a "supertree" (i.e. a well establish phylogenetic tree, published and available), to create your own tree with a subset of species. Such supertrees are for example available for birds (as in the example below). 

Also, if you're a plant biologist (and perhaps specializing on trees) you're lucky  - there's an entire package for you to use (see [Treebase package tutorial](https://cran.r-project.org/web/packages/treebase/vignettes/vignette.html) and [Treebase website search](https://treebase.org/treebase-web/search/studySearch.html), as well as [online tutorials](https://www.carlboettiger.info/2011/05/16/treebase-in-r-a-first-tutorial.html).However, this will not be covered here.

Additionally (and perhaps more importantly, if you need to create your own phylogeny), we will introduce the R package *rotl*, which accesses a synthetic super-tree from [Open Tree of Life database](https://	opentreeoflife.org). I will leave this for later though, as ***rotl*** has to be run on our own locally installed R version, while the supertree exercise can be conducted here on the website.


## EXAMPLE 1 - using a supertree from a file   

We here create a phylogenetic tree for 65 bird species, used in [Rutkowska et al. (2014)](http://onlinelibrary.wiley.com/doi/10.1111/jeb.12282/abstract). We will use the ["Ericson backbone"](http://birdtree.org/) supertree as basis to create a sub-tree that contains only the species from our list of 65. 
***Please note:***
The [birdtree website](http://birdtree.org/) also has an online tool for subsetting their super-trees.

Here, we will use R to subset (prune) a single bird super-tree down to a smaller list of species.  

We have saved both a custom list of bird species stored in a file *bird_list.csv* as a simple string factor, as well as the Ercison tree stored in a file *Ericson.tre*, in Newick format with branch lengths included. These files can be loaded in the code block below. Have a look at the code, and see what hapens if you run it.


<codeblock id="birds">
No hints needed.
</codeblock>


![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) If you want to save this picture (or any other graph procuded with the codeblocks in this course), you can do this: right click and save image to save the .png locally on your computer.


![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) **Note**: In this example all species had matches on the super-tree. Quite often there are no matches for some of the species, which could be due to typos or synonymous names. If no match can be found, a sister species may be used when a species is truly missing. [Remember to match the names on the final tree back to the original species list from the data set - how this is done will be shown for E. coli below in the rotl example!].

If no existing phylogeny is readily usable, there are a few non-exclusive options depending on the range of species in the data set:  

 - If the species are highly diverged (e.g. mixture of vertebrates and invertebrates), use the [NCBI Taxonomy Common Tree tool](http://www.ncbi.nlm.nih.gov/Taxonomy/CommonTree/wwwcmt.cgi). On the webpage, use the input box at the top of the page to search for each species name. Alternatively, you can upload your list of species names from a file. This list allows to generate a scaffold for a tree (i.e. the pattern of basal branching for the main clades).  
 
 - If few major clades are present, assemble together sub-trees created from bigger trees, if these exist for these clades.    
 
 - Use [phyloGenerator](http://willpearse.github.io/phyloGenerator/) or other phylogenetic software to create phylogeny based on DNA sequences, if a shared sequence set exists for a given set of species (check if the resulting phylogeny makes sense).  

If the resulting tree contains polytomies, these can be resolved at random, or based on information from more detailed trees (e.g. published phylogenies of specific lower taxa). You can also graft missing species on your tree. Be aware of species names problems: typos, scientific name synonyms, subspecies - have to be re-checked / corrected / substituted if generate errors at any stage. Again, your final tree must contain exactly the same list of species names as your meta-analytic data set.   



## EXAMPLE 2 - Using the *rotl* package   

![](https://github.com/SusZaj/metaanalysis/blob/master/images/computertaskicon.svg?raw=true)
Copy the code chunks below into your local R script to install the packages that are required to build your tree (it may take 15-20 minutes to install all).   

```
install.packages("metafor")
install.packages("diagram")
install.packages("tidyverse")
install.packages("ape")
install.packages("curl")
install.packages("fulltext")
install.packages("treebase")
install.packages("devtools")
devtools::install_github("ropensci/rotl", dependencies = TRUE, build_vignette=TRUE)
install.packages("rotl")
```

```
library(diagram, tidyverse)
library(ape, curl)
library(fulltext, metafor)
library(treebase, devtools)
library(rotl)
```

We will try to create a simple tree using 10 commonly used taxa (lab model species) from across the tree of life.  
[Rotl](https://peerj.com/preprints/1471/) is an R package  allowing us to access synthetic phylogenetic tree available at [Open Tree of Life database](https://opentreeoflife.org/).   

**Important**: use Latin names, not common names.   
**Notes**: *rotl* crashes on some species lists. Also, Open Tree of Life database gets constantly updated with new info, so you can get different outputs at different time-points.   

We use a function *tnrs_match_names*, which returns a data frame that lists the Open Tree identifiers potentially matching our species.  
The function also returns other information, including alternative species names, to help users ensure that the taxa matched are the correct ones.  

```
myspecies <- c("Escherichia coli", 
               "Chlamydomonas reinhardtii", 
               "Drosophila melanogaster",
               "Arabidopsis thaliana",
               "Rattus norvegicus",
               "Mus musculus",
               "Cavia porcellus",
               "Xenopus laevis",
               "Saccharomyces cerevisae",
               "Danio rerio")
taxa <- tnrs_match_names(names = myspecies)
taxa
```
This will return a list of species in your console. If you have introduced typos, this will be labelled "TRUE" in a column named "approximate_match". Correct mistakes and re-run the tree search.  
You can then can pass your file to the function tol_induced_subtree to retrieve the relationships among these taxa (a trimmed sub-tree from the synthetic phylogenetic tree).  

```
tree <- tol_induced_subtree(ott_ids = taxa[["ott_id"]], label_format = "name") 
#it is possible/ quite likely that you will get a Warning meassage about collapsing single nodes
```


The tree is returned as an ape::phylo object and it can be manipulated, printed and saved easily using functions from the ape package. This is how you call the plot:  

```
plot(tree, cex=.8, label.offset =.1, no.margin = TRUE)
```
and you should be getting something that looks like this:
![](https://github.com/SusZaj/metaanalysis/blob/master/images/rotl.png?raw=true)


Note that the species names have the Open Tree identifiers appended to them and *E.coli* was replaced with "mrcaott616ott617", which is non-taxon node within Bacteria. Below some code to help you convert this back.

```
tree$tip.label #shows you the current tree tip labels
ecoli <- tol_node_info(ott_id=474506, include_lineage=TRUE)
tax_lineage(ecoli) #defines the  domain within Bacteria
tnrs_match_names(names = ("Escherichia")) # shows that the available info is flagged "INCONSISTENT"
tree$tip.label <- gsub("mrcaott616ott617", "Escherichia coli", tree$tip.label) # replace the tip label with species name
tree$tip.label <- gsub("_"," ", tree$tip.label) #getting rid of underscores

# Final checks:  is the tree really binary 
is.binary.tree(tree) #TRUE (i.e. there are no polytomies)
#check overlap between the species names 
intersect(as.character(tree$tip.label), myspecies_fixed) #10 matching names (i.e. data set matches tree)
setdiff(myspecies_fixed, as.character(tree$tip.label)) #0 mismatches
setdiff(as.character(tree$tip.label), myspecies_fixed) #0 mismatches
```

Please note: this tree contains no branch lenghts - this would have to be added via simulations, and is not covered here.    



### EXAMPLE 2b 

If you're still keen to have another go on your locally enstalled R version, you can try to handle a larger set of more closely related taxa, from a real data set.  
The data set for this is the data set *dat.curtis1998* (contains studies on the Effects of Elevated CO2 Levels on Woody Plant Mass), which is included in the *metafor* package.  

```
dat <- metafor::dat.curtis1998
str(dat) #102 rows, many columns including various data
```

With the below code you extract and clean the list of species. Note that genus and species name are stored in separate columns. Also, same species name can appear several times in the data set, but since we need a species list, we need each name to appear only once (i.e. unique names), and capitalisation to be consistent (letter case matters when matching strings).   

```
species_Curtis1998 <- paste(dat$genus, dat$species, sep=" ")
# str(species_Curtis1998) # if you want to see what the dataframe structure loks like
species_Curtis1998 <- unique(tolower(species_Curtis1998)) #make species name unique
length(species_Curtis1998) # should be 37
species_Curtis1998 #note: "populusx euramericana" should be same as "populus euramericana"
species_Curtis1998 <- gsub("populusx euramericana", "populus euramericana", species_Curtis1998) #merge, # but potentially fix in the main data set!

species_Curtis1998 <- unique(tolower(species_Curtis1998)) #make the names unique again
length(species_Curtis1998) #36
species_Curtis1998 <- paste(toupper(substr(species_Curtis1998, 1, 1)), substr(species_Curtis1998, 2, nchar(species_Curtis1998)), sep="") #capitalise first letters
species_Curtis1998 # shows your list
```

You can now run your 36 unique species_Curtis1998 names in a *rotl* search  

```
taxa <- tnrs_match_names(names = species_Curtis1998)
dim(taxa) #36 species
```

You will likely be running into a few issues with these data, including alternative species names, true hypbrids, etc, leading to polytomies in the tree. 

# Some approaches for resolving polytomies

 1.at random, using rotl

 2.Resolving one or more multifurcations (i.e. polytomies) in all possible ways, as outlined on this [blog](http://blog.phytools.org/2016/08/resolving-one-or-more-multifurcations.html)  

 3.Package for resolving by known discrete characters of the [species_Curtis1998](https://www.rdocumentation.org/packages/paleotree/versions/3.1.3/topics/resolveTreeChar)  

 4.Resolving manually by using information from known more specialized published phylogeny without polytomies (see next exercise for how to try to find these).  




### EXAMPLE 2c 


Use *rotl* to create a tree for this list of reptiles.   
**Remember**: Double check that species names match tree tip labels.

```
myspecies2 <- c("Gekko japonicus", "Geochelone sulcata", "Gopherus agassizii", "Gopherus polyphemus", "Graptemys ouachitensis", "Graptemys pseudogeographica", "Hemidactylus bowringii", "Heterodon platirhinos", "Heteronotia binoei", "Iberolacerta cyeni", "Lacerta schreiberi", "Lampropholis delicata", "Lampropholis guichenoti", "Liasis fuscus")
```




# RESOURCES

In some cases getting "perfect" tree may not be possible - but phylogenies are always just estimates of the species relationships, and as long as you get the key features right, the tree will be OK, and usually so will your analyses. Remember, the phylogeny will be added as a moderator - helping to explain differences across taxa. However, if the phenomenon you're interested in is highly conserved across taxa (i.e. the species react similarly to the treatment) the phylogeny will probably not play a significant role.

##  Further help   
   
- discussion list [R-sig-phylo archive](http://www.mail-archive.com/r-sig-phylo@r-project.org/)

- [Tree manipulation in R](http://www.r-phylo.org/wiki/HowTo/DataTreeManipulation)

- R-based [GUI tree viewer](https://klash.shinyapps.io/shinyTreeViewer)




</exercise>

<exercise id="2" title="Other resources">

**[If you work on / have published on meta analyses and think your work should be included here, please get in touch!]**

## Other online resources / courses / tutorials on meta analyses 
All of the freely available resources listed here provide much more detail, specifically on the stats, than what has been provided here. Please note, there are many more (print and online) resources on Meta analysis available, but I have decided to her only provide links to freely accessible resources. You may notice that the focus quickly shifts away from biology, more towards psychology / social sciences, as these are highly active fields of research utilizing meta analysis, and hence have developed great resources:

- Shinichi's short workshops on the "Environmental Computing" site, [Meta analysis 1](http://environmentalcomputing.net/meta-analysis-1/), [2](http://environmentalcomputing.net/meta-analysis-2/) and [3](http://environmentalcomputing.net/meta-analysis-3/)

- Background on [OpenMEE](https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.12708)    

- Balduzzi, Rücker  & Schwarzer (2019): [How to perform a meta-analysis with R: a practical tutorial](https://ebmh.bmj.com/content/22/4/153.long)
   
- Basu's preprint tutorial on [PeerJ 2017](https://peerj.com/preprints/2978v1/)
    
- Thomas Pollet's [online course](https://tvpollet.github.io/Meta-analysis_course)
    
- A full online book by Mathias Harrer et al.: [Doing Meta-Analysis in R: A Hands-on Guide](https://bookdown.org/MathiasHarrer/Doing_Meta_Analysis_in_R/)

- Pim Cuijper's video course on [youtube](https://www.youtube.com/playlist?list=PL-h5cI5Bkvt0J-O0kq_9J9_aksWFPgR7s) (also availavle as free book, downloadable [here](https://indd.adobe.com/view/5fc8f9a0-bf1e-49d3-bf5f-a40bfe5409e0) )
    
- Stephanie Kovalchik's [2013 tutorial](http://edii.uclm.es/~useR-2013/Tutorials/kovalchik/kovalchik_meta_tutorial.pdf)


## Some links to how to use R


</exercise>
