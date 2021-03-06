#' Academic statistics genealogical data
#' 
#' This data contains information on copy number variants, single nucleotide polymorphisms, protein content, and yield, of soybeans. The available data consists of a data frame structure that contains 412 direct child-parent relationships between pairs of soybean varieties. These data were collected from field trials, genetic studies, and United States Department of Agriculture (USDA) bulletins, and date as early as the first decade of the 1900s.

#' @name statGeneal
#' @title Academic statistics data
#' @description This data set contains academic genealogical information from the Mathematics Genealogy Project, a web-based database serviced by the North Dakota State University Department of Mathematics and the American Mathematical Society. Specifically, this data set represents a subset of the Mathematical Genealogy Project that contains all the parent-child relationships where both parent and child received an advanced degree of statistics as of June 6, 2015.
#' @docType data
#' @format a \code{RData} instance, 1 row per each individual in the Mathematics Genealogy Project with an advanced degree in statistics. If the child had a parent who was also listed as having received an advanced degree in statistics in the Mathematics Genealogy project, then the row also contains the parental information.
#' @details \itemize{
  #' \item child name of the individual who received an advanced degree in statistics
  #' \item parent name of the individual who mentored the child and also received an advanced degree in statistics. If the child has no such parent, then this field is an empty string
  #' \item gradYear year the child received their advanced degree in statistics
  #' \item country country from which the child received their advanced degree in statistics
  #' \item school school from which the child received their advanced degree in statistics
  #' \item thesis title of the thesis the child submitted to receive their advanced degree in statistics. If this information is not available, then this field is an empty string
#' }
#'
#' @docType data
#' @keywords datasets
#' @usage data(statGeneal)
#' @format A data frame with 8165 rows and 6 variables
#' @references
#' North Dakota State University and American Mathematical Society (2010). The Mathematics Genealogy Project. Archived Web Site. Retrieved from the Library of Congress, Accessed on March 6, 2015, URL http://www.genealogy.math.ndsu.nodak.edu.
NULL
