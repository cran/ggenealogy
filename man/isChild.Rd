% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/allFunctions.R
\name{isChild}
\alias{isChild}
\title{Determine if a variety is a child of another}
\usage{
isChild(child, parent, geneal)
}
\arguments{
\item{child}{possible child variety}

\item{parent}{possible parent variety}

\item{geneal}{the full genealogy  (in data frame format)}
}
\description{
Returns a boolean variable for whether the first variety is a child of the second variety
}
\examples{
data(sbGeneal)
isChild("Essex", "Young", sbGeneal)
isChild("Young", "Essex", sbGeneal)
}
\references{
Rutter L, VanderPlas S, Cook D, Graham MA (2019).
ggenealogy: An R Package for Visualizing Genealogical Data.
\emph{Journal of Statistical Software},
\bold{89}(13), 1--31.
\doi{10.18637/jss.v089.i13}
}
