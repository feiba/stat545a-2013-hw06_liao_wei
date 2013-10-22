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
jFun_lm <- function(x) {
  jFit <- lm(lifeExp ~ I(year - yearMin), x)
  jCoef <- coef(jFit)
  names(jCoef) <- NULL
  return(c(intercept = jCoef[1], slope = jCoef[2], maxResid = max(abs(resid(jFit)))/summary(jFit)$sigma))
}
linearModel <- ddply(gDat, ~country+continent, jFun_lm)


## Find the 3 "best" countries for each continent in terms of speed of growth(slope) for life expectancy.
## define a function that returns 3 best country(if less than 3 country, return all,e.g.Oceania)
jFun_findbest <- function(x) {
  order_x <- arrange(x,desc(x$slope))
  if(nrow(x)>=3) {
    return(order_x[1:3,])
  }
  else {
    return(order_x)
  }
}
## get the linear model for thoses countries
best_countries_linear_model <- ddply(linearModel,~continent,jFun_findbest)
## write it to a file
write.table(best_countries_linear_model, "results_data/best_countries_linear_model.tsv", quote = FALSE,
            sep = "\t", row.names = FALSE)


## Create a single-page figure for each continent, including data only for the 6-8 "extreme" countries, 
## and write to file. One file per continent, with an informative name. 
## The figure should give scatterplots of life expectancy vs. year, panelling/facetting on country,
## fitted line overlaid.
## get 6 extreme countries per continent(except Oceania)that has largest maxResid
jFun_find_large_resid <- function(x) {
  order_x <- arrange(x,desc(x$maxResid))
  if(nrow(x)>=6) {
    return(order_x[1:6,])
  }
  else {
    return(order_x)
  }
}
## get the linear model for thoses countries
large_resid_countries_linear_model <- ddply(linearModel,~continent,jFun_find_large_resid)
## get the raw data for those countries
data_large_resid <- subset(gDat,country %in% large_resid_countries_linear_model$country)
## loop over all continents and give scatterplot for each continent in one figure
for(i in levels(gDat$continent)){
  ##create scatterplots of life expectancy vs. year, panelling/facetting on country,fitted line overlaid.
  p <- ggplot(data_large_resid[which(data_large_resid$continent==i),], 
              aes(x = I(year-yearMin), y = lifeExp, color = country))
  p + geom_point() + facet_grid(~country) + geom_smooth(method = "loess", colour = "black")
  ## save plot to file
  filename <- paste("results_figure/Scatterplot_extrecountry_",i,".png",sep = "")
  ggsave(filename)
}

