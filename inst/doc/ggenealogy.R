### R code from vignette source 'ggenealogy.Rnw'

###################################################
### code chunk number 1: ggenealogy.Rnw:35-39
###################################################
library(knitr)
opts_chunk$set(
concordance=TRUE
)


###################################################
### code chunk number 2: Roptions
###################################################
options(width = 60)
options(SweaveHooks = list(fig = function() par(mar=c(3,3,1,0.5),mgp = c(2,1,0))))


###################################################
### code chunk number 3: ggenealogy.Rnw:47-52
###################################################
my.Swd <- function(name, width, height, ...)
 grDevices::cairo_pdf(
  filename = paste(name, "pdf", sep = "."),
  width = width, height = height
 )


###################################################
### code chunk number 4: ggenealogy.Rnw:90-91 (eval = FALSE)
###################################################
## install.packages("ggenealogy")


###################################################
### code chunk number 5: ggenealogy.Rnw:97-98
###################################################
library(ggenealogy)


###################################################
### code chunk number 6: ggenealogy.Rnw:103-104 (eval = FALSE)
###################################################
## help(package="ggenealogy")


###################################################
### code chunk number 7: ggenealogy.Rnw:109-110 (eval = FALSE)
###################################################
## help(getChild)


###################################################
### code chunk number 8: ggenealogy.Rnw:115-118 (eval = FALSE)
###################################################
## data(sbGeneal)
## getChild("Tokyo", sbGeneal)
## getChild("Essex", sbGeneal)


###################################################
### code chunk number 9: ggenealogy.Rnw:125-129
###################################################
data(sbGeneal)
head(sbGeneal)
dim(sbGeneal)
str(sbGeneal)


###################################################
### code chunk number 10: ggenealogy.Rnw:136-137 (eval = FALSE)
###################################################
## help(dfToIG)


###################################################
### code chunk number 11: ggenealogy.Rnw:144-146
###################################################
ig <- dfToIG(sbGeneal)
class(ig)


###################################################
### code chunk number 12: ggenealogy.Rnw:159-161
###################################################
isParent("Young","Essex",sbGeneal)
isParent("Essex","Young",sbGeneal)


###################################################
### code chunk number 13: ggenealogy.Rnw:166-168
###################################################
isChild("Young","Essex",sbGeneal)
isChild("Essex","Young",sbGeneal)


###################################################
### code chunk number 14: ggenealogy.Rnw:173-175
###################################################
getVariable("Young", sbGeneal, "devYear")
getVariable("Essex", sbGeneal, "devYear")


###################################################
### code chunk number 15: ggenealogy.Rnw:180-183
###################################################
getParent("Young",sbGeneal)
getParent("Tokyo",sbGeneal)
getVariable("Tokyo", sbGeneal,"devYear")


###################################################
### code chunk number 16: ggenealogy.Rnw:188-190
###################################################
getChild("Tokyo",sbGeneal)
getChild("Ogden",sbGeneal)


###################################################
### code chunk number 17: ggenealogy.Rnw:199-200
###################################################
getAncestors("Young",sbGeneal,1)


###################################################
### code chunk number 18: ggenealogy.Rnw:205-207
###################################################
getAncestors("Young",sbGeneal,5)
nrow(getAncestors("Young",sbGeneal,5))


###################################################
### code chunk number 19: ggenealogy.Rnw:214-215
###################################################
getDescendants("Ogden",sbGeneal,1)


###################################################
### code chunk number 20: ggenealogy.Rnw:220-221
###################################################
getDescendants("Ogden",sbGeneal,2)


###################################################
### code chunk number 21: ggenealogy.Rnw:228-232
###################################################
nr = nrow(sbGeneal)
listInd = sbGeneal[(nr-3):nr,]$child
listAnc = sapply(listInd, function(x) getAncestors(x, sbGeneal, 5))
listAnc


###################################################
### code chunk number 22: ggenealogy.Rnw:237-239
###################################################
listAnc = sapply(listInd, function(x) getAncestors(x, sbGeneal, 5), simplify=F)
listAnc


###################################################
### code chunk number 23: ggenealogy.Rnw:246-248
###################################################
getDegree("Tokyo", "Ogden", ig, sbGeneal)
getDegree("Tokyo", "Holladay", ig, sbGeneal)


###################################################
### code chunk number 24: ggenealogy.Rnw:259-260
###################################################
getBasicStatistics(ig)


###################################################
### code chunk number 25: ggenealogy.Rnw:267-270
###################################################
eList = getEdges(ig, sbGeneal)
head(eList)
nrow(eList)


###################################################
### code chunk number 26: ggenealogy.Rnw:275-278
###################################################
nList = getNodes(sbGeneal)
head(nList)
length(nList)


###################################################
### code chunk number 27: plotAncDes1
###################################################
plotAncDes("Lee", sbGeneal,5,4)


###################################################
### code chunk number 28: plotAncDes1-1
###################################################
plotAncDes("Lee", sbGeneal,5,4)


###################################################
### code chunk number 29: plotAncDes2
###################################################
plotAncDes("Tokyo", sbGeneal, vColor = "blue") + ggplot2::labs(
  x="Generation index",y="")


###################################################
### code chunk number 30: plotAncDes2-1
###################################################
plotAncDes("Tokyo", sbGeneal, vColor = "blue") + ggplot2::labs(
  x="Generation index",y="")


###################################################
### code chunk number 31: ggenealogy.Rnw:342-343
###################################################
getPath("Brim", "Bedford", sbIG, sbGeneal, "devYear", isDirected = FALSE)


###################################################
### code chunk number 32: ggenealogy.Rnw:348-350 (eval = FALSE)
###################################################
## dirIG = dfToIG(sbGeneal, isDirected = TRUE)
## getPath("Brim", "Bedford", dirIG, sbGeneal, "devYear", isDirected = TRUE)


###################################################
### code chunk number 33: ggenealogy.Rnw:355-356 (eval = FALSE)
###################################################
## getPath("Bedford", "Brim", dirIG, sbGeneal, "devYear", isDirected=TRUE)


###################################################
### code chunk number 34: ggenealogy.Rnw:363-364
###################################################
pathBB = getPath("Bedford","Brim", ig, sbGeneal, "devYear", isDirected=FALSE)


###################################################
### code chunk number 35: plotPath
###################################################
plotPath(pathBB, sbGeneal, "devYear")


###################################################
### code chunk number 36: plotPath-1
###################################################
plotPath(pathBB, sbGeneal, "devYear")


###################################################
### code chunk number 37: plotPath1
###################################################
plotPath(pathBB, sbGeneal, "devYear") + ggplot2::xlab("Year")


###################################################
### code chunk number 38: plotPath1-1
###################################################
plotPath(pathBB, sbGeneal, "devYear") + ggplot2::xlab("Year")


###################################################
### code chunk number 39: plotPath2
###################################################
pathNT = getPath("Narow", "Tokyo", ig, sbGeneal, "devYear", isDirected=FALSE)
plotPath(pathNT, sbGeneal, "devYear")


###################################################
### code chunk number 40: plotPath2-1
###################################################
pathNT = getPath("Narow", "Tokyo", ig, sbGeneal, "devYear", isDirected=FALSE)
plotPath(pathNT, sbGeneal, "devYear")


###################################################
### code chunk number 41: plotPathOnAll1
###################################################
plotPathOnAll(pathNT, sbGeneal, ig, "devYear", bin = 3)


###################################################
### code chunk number 42: plotPathOnAll1-1
###################################################
plotPathOnAll(pathNT, sbGeneal, ig, "devYear", bin = 3)


###################################################
### code chunk number 43: plotPathOnAll2
###################################################
plotPathOnAll(pathNT, sbGeneal, ig, "devYear", bin = 6) + ggplot2::xlab("Year")


###################################################
### code chunk number 44: plotPathOnAll2-1
###################################################
plotPathOnAll(pathNT, sbGeneal, ig, "devYear", bin = 6) + ggplot2::xlab("Year")


###################################################
### code chunk number 45: plotDegMatrix1
###################################################
varieties=c("Brim", "Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
p = plotDegMatrix(varieties, ig, sbGeneal)
p + ggplot2::scale_fill_continuous(low = "white", high = "darkgreen") +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 15), legend.text =
  ggplot2::element_text(size = 15)) + ggplot2::labs(x = "Variety", y = "Variety")


###################################################
### code chunk number 46: plotDegMatrix1-1
###################################################
varieties=c("Brim", "Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
p = plotDegMatrix(varieties, ig, sbGeneal)
p + ggplot2::scale_fill_continuous(low = "white", high = "darkgreen") +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 15), legend.text =
  ggplot2::element_text(size = 15)) + ggplot2::labs(x = "Variety", y = "Variety")


###################################################
### code chunk number 47: ggenealogy.Rnw:515-516
###################################################
getDegree("Bedford", "Zane", ig, sbGeneal)


###################################################
### code chunk number 48: plotYearMatrix1
###################################################
varieties=c("Brim", "Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
plotDegMatrix(varieties, ig, sbGeneal)


###################################################
### code chunk number 49: plotYearMatrix1-1
###################################################
varieties=c("Brim", "Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
plotDegMatrix(varieties, ig, sbGeneal)


###################################################
### code chunk number 50: ggenealogy.Rnw:547-550
###################################################
data("statGeneal")
dim(statGeneal)
colnames(statGeneal)


###################################################
### code chunk number 51: ggenealogy.Rnw:559-564
###################################################
indVec <- getNodes(statGeneal)
indVec <- indVec[which(indVec != "", )]
dFunc <- function(var) nrow(getDescendants(var, statGeneal, gen = 100))
numDesc <- sapply(indVec, dFunc)
table(numDesc)


###################################################
### code chunk number 52: ggenealogy.Rnw:567-568
###################################################
which(numDesc == 159)


###################################################
### code chunk number 53: ggenealogy.Rnw:573-574 (eval = FALSE)
###################################################
## plotAncDes("David Cox", statGeneal, mAnc = 6, mDes = 6, vCol = "blue")


###################################################
### code chunk number 54: ggenealogy.Rnw:586-588
###################################################
length(getChild("Peter Bloomfield", statGeneal))
nrow(getDescendants("Peter Bloomfield", statGeneal, gen = 100))


###################################################
### code chunk number 55: pathCB
###################################################
statIG <- dfToIG(statGeneal)
pathCB <- getPath("David Cox", "Petra Buzkova", statIG, statGeneal, "gradYear", isDirected = FALSE)
plotPath(pathCB, statGeneal, "gradYear", fontFace = 4) + ggplot2::theme(axis.text = 
  ggplot2::element_text(size = 10), axis.title = ggplot2::element_text(size = 10)) +   ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 56: pathCB-1
###################################################
statIG <- dfToIG(statGeneal)
pathCB <- getPath("David Cox", "Petra Buzkova", statIG, statGeneal, "gradYear", isDirected = FALSE)
plotPath(pathCB, statGeneal, "gradYear", fontFace = 4) + ggplot2::theme(axis.text = 
  ggplot2::element_text(size = 10), axis.title = ggplot2::element_text(size = 10)) +   ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 57: plotCBText
###################################################
getOption("SweaveHooks")[["fig"]]()
plotPathOnAll(pathCB, statGeneal, statIG, "gradYear", bin = 200) +
   ggplot2::theme(axis.text = ggplot2::element_text(size = 8), axis.title =
   ggplot2::element_text(size = 8)) + ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 58: plotCBText-1
###################################################
getOption("SweaveHooks")[["fig"]]()
plotPathOnAll(pathCB, statGeneal, statIG, "gradYear", bin = 200) +
   ggplot2::theme(axis.text = ggplot2::element_text(size = 8), axis.title =
   ggplot2::element_text(size = 8)) + ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 59: plotCBNoText
###################################################
getOption("SweaveHooks")[["fig"]]()
plotPathOnAll(pathCB, statGeneal, statIG, "gradYear", bin = 200, nodeSize = .5,
   pathNodeSize = 2.5, nodeCol = "darkgray", edgeCol = "lightgray") +
   ggplot2::theme(axis.text = ggplot2::element_text(size = 8), axis.title =
   ggplot2::element_text(size = 8)) + ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 60: plotCBNoText-1
###################################################
getOption("SweaveHooks")[["fig"]]()
plotPathOnAll(pathCB, statGeneal, statIG, "gradYear", bin = 200, nodeSize = .5,
   pathNodeSize = 2.5, nodeCol = "darkgray", edgeCol = "lightgray") +
   ggplot2::theme(axis.text = ggplot2::element_text(size = 8), axis.title =
   ggplot2::element_text(size = 8)) + ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 61: plotAnimate (eval = FALSE)
###################################################
getOption("SweaveHooks")[["fig"]]()
## plotPathOnAll(pathCB, statGeneal, statIG, "gradYear", bin = 200, nodeSize = .5,
##    pathNodeSize = 2.5, nodeCol = "darkgray", edgeCol = "lightgray", animate =
##    TRUE)


###################################################
### code chunk number 62: ggenealogy.Rnw:690-692
###################################################
AKBranchYield <- getBranchQuant("A.K.", sbGeneal, "yield", 15)
dplyr::select(AKBranchYield, -DesNames)


###################################################
### code chunk number 63: ggenealogy.Rnw:699-701
###################################################
CoxBranchYear <- getBranchQuant("David Cox", statGeneal, "gradYear", 15)
head(dplyr::select(CoxBranchYear, -DesNames), 10)


###################################################
### code chunk number 64: ggenealogy.Rnw:712-716
###################################################
v1 = "David Cox"; geneal = statGeneal; colName = "thesis"; gen = 15
rExpr = "grepl('(?i)Stochastic', geneal$colName)"
CoxBranchStochastic <- getBranchQual(v1, geneal, colName, rExpr, gen)
head(dplyr::select(CoxBranchStochastic, -DesNames))


###################################################
### code chunk number 65: ggenealogy.Rnw:727-730
###################################################
desDC <- getDescendants("David Cox", statGeneal, 15)
tableDC <- table(statGeneal[match(desDC$label, statGeneal$child), ]$school)
tail(sort(tableDC), 5)


###################################################
### code chunk number 66: ggenealogy.Rnw:735-739
###################################################
colName = "school"
rExpr = "geneal$colName=='University of London'"
DCBranchUL <- getBranchQual(v1, geneal, colName, rExpr, gen)
head(dplyr::select(DCBranchUL, -DesNames))


###################################################
### code chunk number 67: ggenealogy.Rnw:744-746
###################################################
DCChild <- statGeneal[match(getChild("David Cox", statGeneal), statGeneal$child), ]
sum(DCChild$school == "University of London")


