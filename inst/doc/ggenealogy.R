### R code from vignette source 'ggenealogy.Rnw'

###################################################
### code chunk number 1: ggenealogy.Rnw:55-56
###################################################
rm(list=ls())


###################################################
### code chunk number 2: ggenealogy.Rnw:77-78 (eval = FALSE)
###################################################
## install.packages("ggenealogy")


###################################################
### code chunk number 3: ggenealogy.Rnw:84-85
###################################################
library(ggenealogy)


###################################################
### code chunk number 4: ggenealogy.Rnw:90-91 (eval = FALSE)
###################################################
## help(package="ggenealogy")


###################################################
### code chunk number 5: ggenealogy.Rnw:96-97 (eval = FALSE)
###################################################
## help(getChild)


###################################################
### code chunk number 6: ggenealogy.Rnw:102-105 (eval = FALSE)
###################################################
## data(sbGeneal)
## getChild("Tokyo", sbGeneal)
## getChild("Essex", sbGeneal)


###################################################
### code chunk number 7: ggenealogy.Rnw:112-116
###################################################
data(sbGeneal)
head(sbGeneal)
dim(sbGeneal)
str(sbGeneal)


###################################################
### code chunk number 8: ggenealogy.Rnw:123-124
###################################################
help(dfToIG)


###################################################
### code chunk number 9: ggenealogy.Rnw:131-133
###################################################
ig <- dfToIG(sbGeneal)
class(ig)


###################################################
### code chunk number 10: ggenealogy.Rnw:146-148
###################################################
isParent("Young","Essex",sbGeneal)
isParent("Essex","Young",sbGeneal)


###################################################
### code chunk number 11: ggenealogy.Rnw:153-155
###################################################
isChild("Young","Essex",sbGeneal)
isChild("Essex","Young",sbGeneal)


###################################################
### code chunk number 12: ggenealogy.Rnw:160-162
###################################################
getYear("Young",sbGeneal)
getYear("Essex",sbGeneal)


###################################################
### code chunk number 13: ggenealogy.Rnw:167-170
###################################################
getParent("Young",sbGeneal)
getParent("Tokyo",sbGeneal)
getYear("Tokyo", sbGeneal)


###################################################
### code chunk number 14: ggenealogy.Rnw:175-177
###################################################
getChild("Tokyo",sbGeneal)
getChild("Ogden",sbGeneal)


###################################################
### code chunk number 15: ggenealogy.Rnw:186-187
###################################################
getAncestors("Young",sbGeneal,1)


###################################################
### code chunk number 16: ggenealogy.Rnw:192-194
###################################################
getAncestors("Young",sbGeneal,5)
nrow(getAncestors("Young",sbGeneal,5))


###################################################
### code chunk number 17: ggenealogy.Rnw:201-202
###################################################
getDescendants("Ogden",sbGeneal,1)


###################################################
### code chunk number 18: ggenealogy.Rnw:207-208
###################################################
getDescendants("Ogden",sbGeneal,2)


###################################################
### code chunk number 19: ggenealogy.Rnw:217-219
###################################################
getDegree("Tokyo", "Ogden", ig, sbGeneal)
getDegree("Tokyo", "Holladay", ig, sbGeneal)


###################################################
### code chunk number 20: ggenealogy.Rnw:230-231
###################################################
getBasicStatistics(ig)


###################################################
### code chunk number 21: ggenealogy.Rnw:238-241
###################################################
eList = getEdges(ig, sbGeneal)
head(eList)
nrow(eList)


###################################################
### code chunk number 22: ggenealogy.Rnw:246-249
###################################################
nList = getNodes(sbGeneal)
head(nList)
length(nList)


###################################################
### code chunk number 23: plotAncDes1
###################################################
plotAncDes("Lee", sbGeneal,5,4)


###################################################
### code chunk number 24: plotAncDes1
###################################################
plotAncDes("Lee", sbGeneal,5,4)


###################################################
### code chunk number 25: plotAncDes2
###################################################
plotAncDes("Tokyo", sbGeneal, vColor = "blue") + ggplot2::labs(x="Generation index",y="")


###################################################
### code chunk number 26: plotAncDes2
###################################################
plotAncDes("Tokyo", sbGeneal, vColor = "blue") + ggplot2::labs(x="Generation index",y="")


###################################################
### code chunk number 27: ggenealogy.Rnw:312-313
###################################################
getPath("Brim","Bedford", ig, sbGeneal, isDirected=FALSE)


###################################################
### code chunk number 28: ggenealogy.Rnw:318-320 (eval = FALSE)
###################################################
## dirIG = dfToIG(sbGeneal, isDirected = TRUE)
## getPath("Brim", "Bedford", dirIG, sbGeneal, isDirected = TRUE)


###################################################
### code chunk number 29: ggenealogy.Rnw:325-326 (eval = FALSE)
###################################################
## getPath("Bedford", "Brim", dirIG, sbGeneal, isDirected=TRUE)


###################################################
### code chunk number 30: ggenealogy.Rnw:333-334
###################################################
pathBB = getPath("Bedford","Brim", ig, sbGeneal, isDirected=FALSE)


###################################################
### code chunk number 31: plotPath1
###################################################
plotPath(pathBB)


###################################################
### code chunk number 32: plotPath1
###################################################
plotPath(pathBB)


###################################################
### code chunk number 33: plotPath2
###################################################
pathNT = getPath("Narow", "Tokyo", ig, sbGeneal, isDirected=FALSE)
plotPath(pathNT)


###################################################
### code chunk number 34: plotPath2
###################################################
pathNT = getPath("Narow", "Tokyo", ig, sbGeneal, isDirected=FALSE)
plotPath(pathNT)


###################################################
### code chunk number 35: ggenealogy.Rnw:380-382 (eval = FALSE)
###################################################
## pathNT = getPath("Narow", "Tokyo", dirIG, sbGeneal, isDirected=TRUE)
## plotPath(pathNT)


###################################################
### code chunk number 36: ggenealogy.Rnw:385-387 (eval = FALSE)
###################################################
## pathTN = getPath("Tokyo", "Narow", dirIG, sbGeneal, isDirected=TRUE)
## plotPath(pathTN)


###################################################
### code chunk number 37: plotPathOnAll1
###################################################
plotPathOnAll(pathNT, sbGeneal, ig, binVector = 1:3)


###################################################
### code chunk number 38: plotPathOnAll1
###################################################
plotPathOnAll(pathNT, sbGeneal, ig, binVector = 1:3)


###################################################
### code chunk number 39: plotPathOnAll2
###################################################
plotPathOnAll(pathNT, sbGeneal, ig, binVector = 1:6)


###################################################
### code chunk number 40: plotPathOnAll2
###################################################
plotPathOnAll(pathNT, sbGeneal, ig, binVector = 1:6)


###################################################
### code chunk number 41: plotDegMatrix1
###################################################
varieties=c("Brim", "Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
p = plotDegMatrix(varieties, ig, sbGeneal, "Soybean label", "Soybean label", "Degree")
p + ggplot2::scale_fill_continuous(low="white", high="darkgreen")


###################################################
### code chunk number 42: plotDegMatrix1
###################################################
varieties=c("Brim", "Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
p = plotDegMatrix(varieties, ig, sbGeneal, "Soybean label", "Soybean label", "Degree")
p + ggplot2::scale_fill_continuous(low="white", high="darkgreen")


###################################################
### code chunk number 43: ggenealogy.Rnw:474-475
###################################################
getDegree("Bedford", "Zane", ig, sbGeneal)


###################################################
### code chunk number 44: plotYearMatrix1
###################################################
varieties=c("Brim", "Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
plotYearMatrix(varieties,sbGeneal)


###################################################
### code chunk number 45: plotYearMatrix1
###################################################
varieties=c("Brim", "Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
plotYearMatrix(varieties,sbGeneal)


###################################################
### code chunk number 46: ggenealogy.Rnw:506-509
###################################################
data("statGeneal")
dim(statGeneal)
colnames(statGeneal)


###################################################
### code chunk number 47: ggenealogy.Rnw:518-523 (eval = FALSE)
###################################################
## indVec <- getNodes(statGeneal)
## indVec <- indVec[which(indVec != "", )]
## dFunc <- function(var) nrow(getDescendants(var, statGeneal, gen = 100))
## numDesc <- dplyr::sapply(indVec, dFunc)
## table(numDesc)


###################################################
### code chunk number 48: ggenealogy.Rnw:534-535 (eval = FALSE)
###################################################
## which(numDesc == 159)


###################################################
### code chunk number 49: ggenealogy.Rnw:543-544 (eval = FALSE)
###################################################
## plotAncDes("David Cox", statGeneal, mAnc = 6, mDes = 6, vCol = "blue")


###################################################
### code chunk number 50: ggenealogy.Rnw:556-558
###################################################
length(getChild("Peter Bloomfield", statGeneal))
nrow(getDescendants("Peter Bloomfield", statGeneal, gen = 100))


###################################################
### code chunk number 51: pathCB
###################################################
statIG <- dfToIG(statGeneal)
pathCB <- getPath("David Cox", "Petra Buzkova", statIG, statGeneal,
  isDirected = FALSE)
plotPath(pathCB, fontFace = 4) + ggplot2::theme(axis.text =
  ggplot2::element_text(size = 10), axis.title =
  ggplot2::element_text(size = 10)) + ggplot2::scale_x_continuous(expand
  = c(.1, .2))


###################################################
### code chunk number 52: pathCB
###################################################
statIG <- dfToIG(statGeneal)
pathCB <- getPath("David Cox", "Petra Buzkova", statIG, statGeneal,
  isDirected = FALSE)
plotPath(pathCB, fontFace = 4) + ggplot2::theme(axis.text =
  ggplot2::element_text(size = 10), axis.title =
  ggplot2::element_text(size = 10)) + ggplot2::scale_x_continuous(expand
  = c(.1, .2))


###################################################
### code chunk number 53: plotCBText
###################################################
plotPathOnAll(pathCB, statGeneal, statIG, binVector = 1:200) +
   ggplot2::theme(axis.text = ggplot2::element_text(size = 8), axis.title =
   ggplot2::element_text(size = 8)) + ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 54: plotCBText
###################################################
plotPathOnAll(pathCB, statGeneal, statIG, binVector = 1:200) +
   ggplot2::theme(axis.text = ggplot2::element_text(size = 8), axis.title =
   ggplot2::element_text(size = 8)) + ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 55: plotCBNoText
###################################################
plotPathOnAll(pathCB, statGeneal, statIG, binVector = 1:200, nodeSize = .5,
   pathNodeSize = 2.5, nodeCol = "darkgray", edgeCol = "lightgray") +
   ggplot2::theme(axis.text = ggplot2::element_text(size = 8), axis.title =
   ggplot2::element_text(size = 8)) + ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 56: plotCBNoText
###################################################
plotPathOnAll(pathCB, statGeneal, statIG, binVector = 1:200, nodeSize = .5,
   pathNodeSize = 2.5, nodeCol = "darkgray", edgeCol = "lightgray") +
   ggplot2::theme(axis.text = ggplot2::element_text(size = 8), axis.title =
   ggplot2::element_text(size = 8)) + ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 57: plotAnimate
###################################################
plotPathOnAll(pathCB, statGeneal, statIG, binVector = 1:200, nodeSize = .5,
   pathNodeSize = 2.5, nodeCol = "darkgray", edgeCol = "lightgray", animate =
   TRUE)


