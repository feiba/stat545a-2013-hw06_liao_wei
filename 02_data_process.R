library(lattice)
library(plyr)
library(ggplot2)


## remove variable in the workspace
rm(list=ls())


## Import the data created in the previous script and make sure order is changed
gDat <- read.csv(file = "results_data/gapminderData_orderContinent.tsv",sep = "\t")
## here you can see the continent order already change compared to original data set which means my reordering succeed
sprintf("Africa is from row %d to row %d",min(which(gDat$continent=="Africa")),max(which(gDat$continent=="Africa")))
sprintf("Americas is from row %d to row %d",min(which(gDat$continent=="Americas")),max(which(gDat$continent=="Americas")))
sprintf("Asia is from row %d to row %d",min(which(gDat$continent=="Asia")),max(which(gDat$continent=="Asia")))
sprintf("Europe is from row %d to row %d",min(which(gDat$continent=="Europe")),max(which(gDat$continent=="Europe")))
sprintf("Oceania is from row %d to row %d",min(which(gDat$continent=="Oceania")),max(which(gDat$continent=="Oceania")))


## Fit a linear regression of life expectancy on year within each country. 
## Write the estimated intercepts, slopes, and residual error variance (or sd) to file.
yearMin <- min(gDat$year)
jFun <- function(x) {
  jFit <- lm(lifeExp ~ I(year - yearMin), x)
  jCoef <- coef(jFit)
  names(jCoef) <- NULL
  return(c(intercept = jCoef[1], slope = jCoef[2], maxResid = max(abs(resid(jFit)))/summary(jFit)$sigma))
}
linearModel <- ddply(gDat, ~country+continent, jFun)

