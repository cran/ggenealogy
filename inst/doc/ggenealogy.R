### R code from vignette source 'ggenealogy.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: ggenealogy.Rnw:55-56
###################################################
rm(list=ls())


###################################################
### code chunk number 2: ggenealogy.Rnw:83-84 (eval = FALSE)
###################################################
## install.packages("ggenealogy")


###################################################
### code chunk number 3: ggenealogy.Rnw:90-91
###################################################
library(ggenealogy)


###################################################
### code chunk number 4: ggenealogy.Rnw:96-97 (eval = FALSE)
###################################################
## help(package="ggenealogy")


###################################################
### code chunk number 5: ggenealogy.Rnw:102-103 (eval = FALSE)
###################################################
## help(getChild)


###################################################
### code chunk number 6: ggenealogy.Rnw:108-111 (eval = FALSE)
###################################################
## data(sbGeneal)
## getChild("Tokyo", sbGeneal)
## getChild("Essex", sbGeneal)


###################################################
### code chunk number 7: ggenealogy.Rnw:118-122
###################################################
data(sbGeneal)
head(sbGeneal)
dim(sbGeneal)
str(sbGeneal)


###################################################
### code chunk number 8: ggenealogy.Rnw:129-130
###################################################
help(dfToIG)


###################################################
### code chunk number 9: ggenealogy.Rnw:137-139
###################################################
ig <- dfToIG(sbGeneal)
class(ig)


###################################################
### code chunk number 10: ggenealogy.Rnw:152-154
###################################################
isParent("Young","Essex",sbGeneal)
isParent("Essex","Young",sbGeneal)


###################################################
### code chunk number 11: ggenealogy.Rnw:159-161
###################################################
isChild("Young","Essex",sbGeneal)
isChild("Essex","Young",sbGeneal)


###################################################
### code chunk number 12: ggenealogy.Rnw:166-168
###################################################
getVariable("Young", sbGeneal, "devYear")
getVariable("Essex", sbGeneal, "devYear")


###################################################
### code chunk number 13: ggenealogy.Rnw:173-176
###################################################
getParent("Young",sbGeneal)
getParent("Tokyo",sbGeneal)
getVariable("Tokyo", sbGeneal,"devYear")


###################################################
### code chunk number 14: ggenealogy.Rnw:181-183
###################################################
getChild("Tokyo",sbGeneal)
getChild("Ogden",sbGeneal)


###################################################
### code chunk number 15: ggenealogy.Rnw:192-193
###################################################
getAncestors("Young",sbGeneal,1)


###################################################
### code chunk number 16: ggenealogy.Rnw:198-200
###################################################
getAncestors("Young",sbGeneal,5)
nrow(getAncestors("Young",sbGeneal,5))


###################################################
### code chunk number 17: ggenealogy.Rnw:207-208
###################################################
getDescendants("Ogden",sbGeneal,1)


###################################################
### code chunk number 18: ggenealogy.Rnw:213-214
###################################################
getDescendants("Ogden",sbGeneal,2)


###################################################
### code chunk number 19: ggenealogy.Rnw:221-225
###################################################
nr = nrow(sbGeneal)
listInd = sbGeneal[(nr-3):nr,]$child
listAnc = sapply(listInd, function(x) getAncestors(x, sbGeneal, 5))
listAnc


###################################################
### code chunk number 20: ggenealogy.Rnw:230-232
###################################################
listAnc = sapply(listInd, function(x) getAncestors(x, sbGeneal, 5), simplify=F)
listAnc


###################################################
### code chunk number 21: ggenealogy.Rnw:239-241
###################################################
getDegree("Tokyo", "Ogden", ig, sbGeneal)
getDegree("Tokyo", "Holladay", ig, sbGeneal)


###################################################
### code chunk number 22: ggenealogy.Rnw:252-253
###################################################
getBasicStatistics(ig)


###################################################
### code chunk number 23: ggenealogy.Rnw:260-263
###################################################
eList = getEdges(ig, sbGeneal)
head(eList)
nrow(eList)


###################################################
### code chunk number 24: ggenealogy.Rnw:268-271
###################################################
nList = getNodes(sbGeneal)
head(nList)
length(nList)


###################################################
### code chunk number 25: plotAncDes1
###################################################
plotAncDes("Lee", sbGeneal,5,4)


###################################################
### code chunk number 26: plotAncDes1
###################################################
plotAncDes("Lee", sbGeneal,5,4)


###################################################
### code chunk number 27: plotAncDes2
###################################################
plotAncDes("Tokyo", sbGeneal, vColor = "blue") + ggplot2::labs(
  x="Generation index",y="")


###################################################
### code chunk number 28: plotAncDes2
###################################################
plotAncDes("Tokyo", sbGeneal, vColor = "blue") + ggplot2::labs(
  x="Generation index",y="")


###################################################
### code chunk number 29: ggenealogy.Rnw:335-336
###################################################
getPath("Brim", "Bedford", sbIG, sbGeneal, "devYear", isDirected = FALSE)


###################################################
### code chunk number 30: ggenealogy.Rnw:341-343 (eval = FALSE)
###################################################
## dirIG = dfToIG(sbGeneal, isDirected = TRUE)
## getPath("Brim", "Bedford", dirIG, sbGeneal, "devYear", isDirected = TRUE)


###################################################
### code chunk number 31: ggenealogy.Rnw:348-349 (eval = FALSE)
###################################################
## getPath("Bedford", "Brim", dirIG, sbGeneal, "devYear", isDirected=TRUE)


###################################################
### code chunk number 32: ggenealogy.Rnw:356-357
###################################################
pathBB = getPath("Bedford","Brim", ig, sbGeneal, "devYear", isDirected=FALSE)


###################################################
### code chunk number 33: plotPath1
###################################################
plotPath(pathBB, sbGeneal, "devYear")


###################################################
### code chunk number 34: plotPath1
###################################################
plotPath(pathBB, sbGeneal, "devYear")


###################################################
### code chunk number 35: plotPath1a
###################################################
plotPath(pathBB, sbGeneal, "devYear") + ggplot2::xlab("Year")


###################################################
### code chunk number 36: plotPath1a
###################################################
plotPath(pathBB, sbGeneal, "devYear") + ggplot2::xlab("Year")


###################################################
### code chunk number 37: plotPath2
###################################################
pathNT = getPath("Narow", "Tokyo", ig, sbGeneal, "devYear", isDirected=FALSE)
plotPath(pathNT, sbGeneal, "devYear")


###################################################
### code chunk number 38: plotPath2
###################################################
pathNT = getPath("Narow", "Tokyo", ig, sbGeneal, "devYear", isDirected=FALSE)
plotPath(pathNT, sbGeneal, "devYear")


###################################################
### code chunk number 39: plotPathOnAll1
###################################################
plotPathOnAll(pathNT, sbGeneal, ig, "devYear", bin = 3)


###################################################
### code chunk number 40: plotPathOnAll1
###################################################
plotPathOnAll(pathNT, sbGeneal, ig, "devYear", bin = 3)


###################################################
### code chunk number 41: plotPathOnAll2
###################################################
plotPathOnAll(pathNT, sbGeneal, ig, "devYear", bin = 6) + ggplot2::xlab("Year")


###################################################
### code chunk number 42: plotPathOnAll2
###################################################
plotPathOnAll(pathNT, sbGeneal, ig, "devYear", bin = 6) + ggplot2::xlab("Year")


###################################################
### code chunk number 43: plotDegMatrix1
###################################################
varieties=c("Brim", "Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
p = plotDegMatrix(varieties, ig, sbGeneal)
p + ggplot2::scale_fill_continuous(low = "white", high = "darkgreen") +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 15), legend.text =
  ggplot2::element_text(size = 15)) + ggplot2::labs(x = "Variety", y = "Variety")


###################################################
### code chunk number 44: plotDegMatrix1
###################################################
varieties=c("Brim", "Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
p = plotDegMatrix(varieties, ig, sbGeneal)
p + ggplot2::scale_fill_continuous(low = "white", high = "darkgreen") +
  ggplot2::theme(legend.title = ggplot2::element_text(size = 15), legend.text =
  ggplot2::element_text(size = 15)) + ggplot2::labs(x = "Variety", y = "Variety")


###################################################
### code chunk number 45: ggenealogy.Rnw:508-509
###################################################
getDegree("Bedford", "Zane", ig, sbGeneal)


###################################################
### code chunk number 46: plotYearMatrix1
###################################################
varieties=c("Brim", "Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
plotDegMatrix(varieties, ig, sbGeneal)


###################################################
### code chunk number 47: plotYearMatrix1
###################################################
varieties=c("Brim", "Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
plotDegMatrix(varieties, ig, sbGeneal)


###################################################
### code chunk number 48: ggenealogy.Rnw:540-543
###################################################
data("statGeneal")
dim(statGeneal)
colnames(statGeneal)


###################################################
### code chunk number 49: ggenealogy.Rnw:552-557
###################################################
indVec <- getNodes(statGeneal)
indVec <- indVec[which(indVec != "", )]
dFunc <- function(var) nrow(getDescendants(var, statGeneal, gen = 100))
numDesc <- sapply(indVec, dFunc)
table(numDesc)


###################################################
### code chunk number 50: ggenealogy.Rnw:560-561
###################################################
which(numDesc == 159)


###################################################
### code chunk number 51: ggenealogy.Rnw:566-567 (eval = FALSE)
###################################################
## plotAncDes("David Cox", statGeneal, mAnc = 6, mDes = 6, vCol = "blue")


###################################################
### code chunk number 52: ggenealogy.Rnw:579-581
###################################################
length(getChild("Peter Bloomfield", statGeneal))
nrow(getDescendants("Peter Bloomfield", statGeneal, gen = 100))


###################################################
### code chunk number 53: pathCB
###################################################
statIG <- dfToIG(statGeneal)
pathCB <- getPath("David Cox", "Petra Buzkova", statIG, statGeneal, "gradYear", isDirected = FALSE)
plotPath(pathCB, statGeneal, "gradYear", fontFace = 4) + ggplot2::theme(axis.text = 
  ggplot2::element_text(size = 10), axis.title = ggplot2::element_text(size = 10)) +   ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 54: pathCB
###################################################
statIG <- dfToIG(statGeneal)
pathCB <- getPath("David Cox", "Petra Buzkova", statIG, statGeneal, "gradYear", isDirected = FALSE)
plotPath(pathCB, statGeneal, "gradYear", fontFace = 4) + ggplot2::theme(axis.text = 
  ggplot2::element_text(size = 10), axis.title = ggplot2::element_text(size = 10)) +   ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 55: plotCBText
###################################################
plotPathOnAll(pathCB, statGeneal, statIG, "gradYear", bin = 200) +
   ggplot2::theme(axis.text = ggplot2::element_text(size = 8), axis.title =
   ggplot2::element_text(size = 8)) + ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 56: plotCBText
###################################################
plotPathOnAll(pathCB, statGeneal, statIG, "gradYear", bin = 200) +
   ggplot2::theme(axis.text = ggplot2::element_text(size = 8), axis.title =
   ggplot2::element_text(size = 8)) + ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 57: plotCBNoText
###################################################
plotPathOnAll(pathCB, statGeneal, statIG, "gradYear", bin = 200, nodeSize = .5,
   pathNodeSize = 2.5, nodeCol = "darkgray", edgeCol = "lightgray") +
   ggplot2::theme(axis.text = ggplot2::element_text(size = 8), axis.title =
   ggplot2::element_text(size = 8)) + ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 58: plotCBNoText
###################################################
plotPathOnAll(pathCB, statGeneal, statIG, "gradYear", bin = 200, nodeSize = .5,
   pathNodeSize = 2.5, nodeCol = "darkgray", edgeCol = "lightgray") +
   ggplot2::theme(axis.text = ggplot2::element_text(size = 8), axis.title =
   ggplot2::element_text(size = 8)) + ggplot2::scale_x_continuous(expand = c(.1, .2))


###################################################
### code chunk number 59: plotAnimate (eval = FALSE)
###################################################
## plotPathOnAll(pathCB, statGeneal, statIG, "gradYear", bin = 200, nodeSize = .5,
##    pathNodeSize = 2.5, nodeCol = "darkgray", edgeCol = "lightgray", animate =
##    TRUE)


###################################################
### code chunk number 60: ggenealogy.Rnw:669-671
###################################################
AKBranchYield <- getBranchQuant("A.K.", sbGeneal, "yield", 15)
dplyr::select(AKBranchYield, -DesNames)


###################################################
### code chunk number 61: ggenealogy.Rnw:678-680
###################################################
CoxBranchYear <- getBranchQuant("David Cox", statGeneal, "gradYear", 15)
head(dplyr::select(CoxBranchYear, -DesNames), 10)


###################################################
### code chunk number 62: ggenealogy.Rnw:691-695
###################################################
v1 = "David Cox"; geneal = statGeneal; colName = "thesis"; gen = 15
rExpr = "grepl('(?i)Stochastic', geneal$colName)"
CoxBranchStochastic <- getBranchQual(v1, geneal, colName, rExpr, gen)
head(dplyr::select(CoxBranchStochastic, -DesNames))


###################################################
### code chunk number 63: ggenealogy.Rnw:706-709
###################################################
desDC <- getDescendants("David Cox", statGeneal, 15)
tableDC <- table(statGeneal[match(desDC$label, statGeneal$child), ]$school)
tail(sort(tableDC), 5)


###################################################
### code chunk number 64: ggenealogy.Rnw:714-718
###################################################
colName = "school"
rExpr = "geneal$colName=='University of London'"
DCBranchUL <- getBranchQual(v1, geneal, colName, rExpr, gen)
head(dplyr::select(DCBranchUL, -DesNames))


###################################################
### code chunk number 65: ggenealogy.Rnw:723-725
###################################################
DCChild <- statGeneal[match(getChild("David Cox", statGeneal), statGeneal$child), ]
sum(DCChild$school == "University of London")


