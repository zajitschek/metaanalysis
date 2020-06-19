---
title: 'Chapter 4: Additional Resources'
description:
  'Hints on Phylogenetic trees; tips and tricks'
prev: /chapter3
next: null
type: chapter
id: 4
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

First, check if there is any phylogenetic tree available that already contains all your species (e.g. a super-tree). Currently, the easiest way to build a custom phylogenetic tree usable for meta-analysis is by using an R package called *rotl*, which accesses a synthetic super-tree from [Open Tree of Life database](https://	opentreeoflife.org). 

However, we currently can't provide the pre-installation here on this website, but as before for metaDigitize, we will guide you through how this is done in your local environment in our example below. 
   
   
# Different Tools 

Most of the time *rotl* will work well, especially with the common species. There are other super-trees available, e.g. for birds - we will use one of these as our example too. Overall, if you can find a tree that contains all your species, you just trim (subset) it down to your species. If only a few species are missing, it is sometimes possible to substitute them with closely related species. If no existing phylogeny is readily usable, there are a few non-exclusive options depending on the range of species in the data set:  

 - If the species are highly diverged (e.g. mixture of vertebrates and invertebrates), use the [NCBI Taxonomy Common Tree tool](http://www.ncbi.nlm.nih.gov/Taxonomy/CommonTree/wwwcmt.cgi). On the webpage, use the input box at the top of the page to search for each species name. Alternatively, you can upload your list of species names from a file. This list allows to generate a scaffold for a tree (i.e. the pattern of basal branching for the main clades).  
 
 - If few major clades are present, assemble together sub-trees created from bigger trees, if these exist for these clades.    
 
 - Use [phyloGenerator](http://willpearse.github.io/phyloGenerator/) or other phylogenetic software to create phylogeny based on DNA sequences, if a shared sequence set exists for a given set of species (check if the resulting phylogeny makes sense).  

If the resulting tree contains polytomies, these can be resolved at random, or based on information from more detailed trees (e.g. published phylogenies of specific lower taxa). You can also graft missing species on your tree. Be aware of species names problems: typos, scientific name synonyms, subspecies - have to be re-checked / corrected / substituted if generate errors at any stage. Again, your final tree, must contain exactly the same list of species names as your meta-analytic data set.   

![Phylogenetic Tree workflow](https://github.com/SusZaj/metaanalysis/blob/master/images/guide.png?raw=true)

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


## Examples and exercises

Here are some examples on how to use the *rotl* package to download sub-trees from the Open Tree of Life super-tree, resolve polytomies, trim and plot trees and deal with some of the most common issues. This resource covers how to  do most of theses tasks in R, but many of these steps may be done outside R (using websites, text and tree editors, etc.). However, this is not covered here.



### EXAMPLE 1 - Using the *rotl* package   

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



### EXAMPLE 2 - using a supertree from a file   


We will now create a phylogenetic tree for 65 bird species used in Rutkowska, J., Dubiec, A. & Nakagawa, S. (2014) All eggs are made equal: meta-analysis of egg sexual size dimorphism in birds. Journal of Evolutionary Biology. 27: 153-160 http://onlinelibrary.wiley.com/doi/10.1111/jeb.12282/abstract  

There are a few main existing and established super-trees for birds, so they can be used to create a sub-tree containing only the species from the list.  
Here we will use on of these super-trees called "Ericson backbone", which is downloadable from http://birdtree.org/ (Jetz, W., G. H. Thomas, J. B. Joy, K. Hartmann, and A. O. Mooers. 2012. The global diversity of birds in space and time. Nature 491:444-448.). The website http://birdtree.org/ also has an online tool for subsetting their super-trees generating distribution of trees rather than one tree. For simplicity and demonstration purposes we will use R to subset (prune) a single bird super-tree down to a smaller list of species.  

We have provided a custom list of bird species stored in a file *bird_list.csv* as a simple string factor, as well as the Ercison tree stored in a file *Ericson.tre*, in Newick format with branch lengths included. Load these files can be loaded in the code block below. First, we will check the species overlap.    


<codeblock id="birds">
No hints needed.
</codeblock>


![](https://github.com/SusZaj/metaanalysis/blob/master/images/pushpin.svg?raw=true) **Note**: In this example all species had matches on the super-tree. Quite often there are no matches for some of the species, which could be due to typos or synonymous names. If no match can be found, a sister species may be used when a species is truly missing. [Remember to match the names on the final tree back to the original species list from the data set - see the E. coli example above in the rotl example!].



### EXAMPLE 3 - using the *rotl* package again  

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

You will be running into a few issues with these data, including alternative species names, true hypbrids, etc, leading to polytomies in the tree. 

## Some approaches for resolving polytomies:  

1. at random, using rotl

2. Resolving one or more multifurcations (i.e. polytomies) in all possible ways, as outlined on this [blog](http://blog.phytools.org/2016/08/resolving-one-or-more-multifurcations.html)  

3. Package for resolving by known discrete characters of the [species_Curtis1998](https://www.rdocumentation.org/packages/paleotree/versions/3.1.3/topics/resolveTreeChar)  

4. Resolving manually by using information from known more specialized published phylogeny without polytomies (see next exercise for how to try to find these).  


### EXAMPLE 4 - using the *treebase* package  


We can try to find some relevant trees using Treebase database and *treebase* package (see [Treebase package tutorial](https://cran.r-project.org/web/packages/treebase/vignettes/vignette.html) and [here](https://www.carlboettiger.info/2011/05/16/treebase-in-r-a-first-tutorial.html).  

As an exercise, we will try to find more resolved phylogeny for the four species from genus 'Acer' that were included in Curtis1998 from R. You can try search Treebase directly at www.treebase.org, but it can be slow. Try to find a tree via [Treebase website search](https://treebase.org/treebase-web/search/studySearch.html) and enter "Acer" in the search box, then select "Title" from the drop-down menu next to it, press "Search" button.   


Of the 57 studies that we end up with not may contain relevant trees and species: S2155, S2157 and S342. Tick boxes next to these and  "Discard unchecked items" at the bottom.

Select just one of the remaining 3 studies and go to the 'Taxa' tab, which shows the list of taxa associated with this study.  

Here we will use study S342 Ackerly D., Donoghue M.J.	1998, so check the box next to it and discard the rest. Go to the "Trees" tab : there are 2 trees from this study. 

We have done this already, and pick Tr418 (consensus, i.e. made from collapsing multiple possible similar single trees).   

Now we will try to do similar work from R. First, we create a custom search string with our four Acer species names from Curtis1998 data set.  

```{r make treebase searchstring}
Acer4sp <- species_Curtis1998[grep("Acer ", species_Curtis1998)]
Acer4sp #you should get "Acer rubrum"        "Acer saccharinum"   "Acer pensylvanicum" "Acer saccharum"  
Acer4sp <- gsub(" ","_", Acer4sp) #put underscores back in the names
Acer4sp_string <- paste(Acer4sp, sep = "", collapse = ' and ') 
Acer4sp_string #you should get "Acer_rubrum and Acer_saccharinum and Acer_pensylvanicum and Acer_saccharum"
```

Run the treebase search - get max 50 trees that contain exactly these four species names.   

```{r search treebase}
#this is an example of how to search for a single species:
# Acer <- search_treebase("Acer_saccharinumc", by="taxon", max_trees=10) #example of using with a single species name - note different commas than in the tutorial and the underscores!

Acer_treebase <- search_treebase(Acer4sp_string, by=c("taxon","taxon","taxon","taxon"), max_trees=50, exact_match = TRUE, only_metadata = TRUE) #note different commas than in the treebase tutorial!
# Acer_treebase #list of 49 meta-data results of our search 
# str(Acer_treebase) #some more info can be seen here

#Unfortunately the functions in treebase that are supposed to fetch metadata for the trees dont seem to work (show_metadata, metadata - if you get them workinng please let me know). 
#For easier viewing we will put these inn a data frame (note that multiple tree IDs can come from the same study).
t(data.frame(matrix(unlist(Acer_treebase), nrow=6, byrow=F), row.names = c("S.id", "Tr.id", "type", "kind", "quality", "ntax"))) #note the study IDs that you are using - you can find these on Treebase
```

There are multiple trees available from several studies. Note that the lost of found results includes the tree 418 from study 342 we already identified in our Treebase website search.  
So, we will request specifically tree Tr418 from Study S342 (the one we already found via Treebase website search; Ackerly D., Donoghue M.J.	1998	Leaf size, sapling allometry, and Corner's rules: phylogeny and correlated evolution in maples (Acer).	American Naturalist). It may take a moment, depending on the size of the tree. You can try requesting different trees later and comparing whether you get different sub-trees after pruning.      

```{r dwonload one tree from treebase, results=FALSE}
Acers_tree <- search_treebase("418", by="id.tree", exact_match = TRUE) #returns a single tree in a list
Acers_tree <- Acers_tree[[1]] #extract the tree from the list
```

If downloading from R treebase did not work, upload tree saved in a file:
```{r dwonload one tree from file, eval = FALSE}
Acers_tree <- read.nexus(file = "../data/T418.nex") #read Nexus tree file
```

Plot the Acers tree from Treebase - looks good.     

```{r plot Acers_tree, fig.width=10, fig.height=8, echo=TRUE, message=FALSE}
plot(Acers_tree, cex=.8, label.offset =.1, no.margin = TRUE)
```

Prune this tree to our four species.   

```{r prune Acers_tree}
#Prune Acers_tree to a list of four taxa from our list
Acers4sp_tree <- drop.tip(Acers_tree, Acers_tree$tip.label[-match(Acer4sp, Acers_tree$tip.label)])
```

Plot the pruned tree.  

```{r plot pruned Acers_tree, fig.width=10, fig.height=3.2, echo=TRUE, message=FALSE}
plot(Acers4sp_tree, cex=.8, label.offset =.1, no.margin = TRUE)
```

Final checks.  

```{r check Acers_tree}
###check the overlap between species name from the data fila nad the tree file
intersect(as.character(Acers4sp_tree$tip.label), Acer4sp) # all matching
setdiff(Acer4sp, as.character(Acers4sp_tree$tip.label)) #no mismatches
is.binary.tree(Acers4sp_tree) #TRUE
```

We can graft this tree on the Curtis1998 tree to non-randomly resolve polytomy for genus Acer.   
**Note:** when grafting you lose branch lengths on the original tree, if present.   

We first need to prune given branch from the main tree to remove all but one species affected by polytomy. Then we can replace this species with the resolved sub-tree (Acers4sp_tree):   

```{r graft Acers_tree}
tree_pruned <- drop.tip(tree, c("Acer saccharum", "Acer rubrum", "Acer saccharinum")) #prune 3 species
tree_grafted <- bind.tree(tree_pruned, Acers4sp_tree, where=which(tree_pruned$tip.label=="Acer pensylvanicum")) #graft 3 species to the remaining Acer species
```

```{r plot tree_grafted Acers, fig.width=10, fig.height=8, echo=TRUE, message=FALSE}
plot(tree_grafted, cex=.8, label.offset =.1, no.margin = TRUE)
```



### EXAMPLE 5 - try it yourself - rotl


Use *rotl* to create a tree for this list of reptiles.   
**Remember**: Double check that species names match tree tip labels.

```
myspecies2 <- c("Gekko japonicus", "Geochelone sulcata", "Gopherus agassizii", "Gopherus polyphemus", "Graptemys ouachitensis", "Graptemys pseudogeographica", "Hemidactylus bowringii", "Heterodon platirhinos", "Heteronotia binoei", "Iberolacerta cyeni", "Lacerta schreiberi", "Lampropholis delicata", "Lampropholis guichenoti", "Liasis fuscus")
```


### EXAMPLE 6 - try it yourself- treebase


Use *treebase* to create a tree for the three Quercus species from dat.Curtis1998. You can try to graft them on the Curtis 1998 tree.

**Hint**: Quercus prinus is also called Quercus montana (https://en.wikipedia.org/wiki/Quercus_montana).   
Once you substitute, all three species can be found on Tree 113123 of Study 22057, and also in several other studies and trees.

```
Quercus3sp <- species_Curtis1998[grep("Quercus ", species_Curtis1998)]
```





## RESOURCES

In some cases getting "perfect" tree may not be possible - but phylogenies are always just estimates of the species relationships, and as long as you get the key features right, the tree will be OK, and usually so will your analyses. Remember, the phylogeny will be added as a moderator - helping to explain differences across taxa. However, if the phenomenon you're interested in is highly conserved across taxa (i.e. the species react similarly to the treatment) the phylogeny will probably not play a significant role.

### Further help
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
