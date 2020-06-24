###CODEBLOCK 17###

#Load libraries
library(dplyr)
library(ape)


birds <- unique(read.csv("./binder/data/bird_list.csv")$species_name)  #load our list of bird species, 
# "unique" will make sure we're listing each species name only once
birds_stree <- read.tree("./binder/data/Ericson.tre") #load provided bird supertree
birds_stree # 9993 tips = species
# str(birds_stree) # ypu can see this tree has edge (branch) lengths

### checking for the overlap between species name from our list  and the bird supertree
intersect(as.character(birds_stree$tip.label), birds) #51 - all our species matching 
setdiff(birds, as.character(birds_stree$tip.label)) #0 mismatches - no typos

# we can now reduce (prune) the supertree to maatch our selection
pruned_birds_stree <- drop.tip(birds_stree,birds_stree$tip.label[-match(birds, birds_stree$tip.label)]) 
#check the pruned tree
is.binary.tree(pruned_birds_stree) #TRUE
is.ultrametric(pruned_birds_stree) #TRUE
has.singles(pruned_birds_stree) #check for singles - the single nodes (i.e., with a single descendant) in a tree
# pruned_birds_stree <- collapse.singles(pruned_birds_stree) 
#if singles are preset, you can clean them up using collapse.singles function
#if you want to run this, delete the "#" in front of and pruned_birds_stree <- ... & run code!

# And FINALLY: Plot the tree
plot(pruned_birds_stree, cex= 0.7) #plots with branch lengths, when available
