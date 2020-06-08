---
title: 'Chapter 3: Additional Resources'
description:
  'Hints on Phylogenetic trees, tips and tricks'
prev: /chapter2
next: null
type: chapter
id: 3
---

<exercise id="1" title="Phylogenies">



</exercise>

<exercise id="2" title="How to make a decision tree in R">

# R code

Of course you can draw your decision trees by hand, make a flow chart in Power Point or use any MindMapping software (if you go that route - I recommend Visually Understanding the Enviroment, [VUE] (https://vue.tufts.edu/)). However, perhaps you really would like to use R for this, too!

Below is Losia's code for a nice home-made decision tree.
Change the text to make it fit your own needs!

```{r diagram decision tree abstracts, fig.width=10, fig.height=6, echo=FALSE, message=FALSE}
install.packages("diagram")
library(diagram)
par(mar=c(1,1,1,1))
openplotmat() #create an empyty plot
elpos <- coordinates (pos = c(2, 2, 2, 2, 2))
fromto <- matrix(ncol = 2, byrow = TRUE, data = c(1,2, 1,3, 3,4, 3,5, 5,6, 5,7, 7,8, 7,9))
nr <- nrow(fromto)
arrpos <- matrix(ncol = 2, nrow = nr)
for (i in 1:nr) (arrpos[i, ] <- straightarrow (to = elpos[fromto[i, 2], ], from = elpos[fromto[i, 1], ], lwd = 2, arr.pos = 0.7, arr.length = 0.4, arr.type = "simple"))

textrect (mid = elpos[1,], radx = 0.15, rady = 0.05, lwd = 1, lab = c("Study on non-human","multicellular animal?"), box.col = "white", shadow.col = "grey", shadow.size = 0, cex = 0.6)

textellipse (mid = elpos[2,], radx = 0.15, rady = 0.05, lwd = 1, lab = "EXCLUDE", box.col = "coral1", shadow.col = "grey", shadow.size = 0, cex = 0.8)

textrect (mid = elpos[3,], radx = 0.15, rady = 0.05, lwd = 1, lab = c("Experimental study?"), box.col = "white", shadow.col = "grey", shadow.size = 0, cex = 0.6)

textellipse (mid = elpos[4,], radx = 0.15, rady = 0.05, lwd = 1, lab = "EXCLUDE", box.col = "coral1", shadow.col = "grey", shadow.size = 0.001, cex = 0.8)

textrect (mid = elpos[5,], radx = 0.15, rady = 0.05, lwd = 1, lab = c("Experimental","immune challenge?"), box.col = "white", shadow.col = "grey", shadow.size = 0, cex = 0.6)

textellipse (mid = elpos[6,], radx = 0.15, rady = 0.05, lwd = 1, lab = "EXCLUDE", box.col = "coral1", shadow.col = "grey", shadow.size = 0, cex = 0.8)

textrect (mid = elpos[7,], radx = 0.15, rady = 0.05, lwd = 1, lab = c("Reproduction-related","traits measured?"), box.col = "white", shadow.col = "grey", shadow.size = 0, cex = 0.6)

textellipse (mid = elpos[8,], radx = 0.15, rady = 0.05, lwd = 1, lab = "EXCLUDE", box.col = "coral1", shadow.col = "grey", shadow.size = 0, cex = 0.8)

textellipse (mid = elpos[9,], radx = 0.15, rady = 0.05, lwd = 1, lab = c("INCLUDE", "for full-text screening"), box.col = "light green", shadow.col = "grey", shadow.size = 0, cex = 0.8)

text(arrpos[1, 1] - 0.1, arrpos[1, 2] + 0.02, "no")
text(arrpos[2, 1] + 0.07, arrpos[2, 2] + 0.03, "yes/probably")
text(arrpos[3, 1] - 0.1, arrpos[3, 2] + 0.02, "no")
text(arrpos[4, 1] + 0.07, arrpos[4, 2] + 0.03, "yes/probably")
text(arrpos[5, 1] - 0.1, arrpos[5, 2] + 0.02, "no")
text(arrpos[6, 1] + 0.07, arrpos[6, 2] + 0.03, "yes/probably")
text(arrpos[7, 1] - 0.1, arrpos[7, 2] + 0.02, "no")
text(arrpos[8, 1] + 0.07, arrpos[8, 2] + 0.03, "yes/probably")
```

</exercise>
