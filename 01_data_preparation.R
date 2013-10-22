library(lattice)
library(plyr)
library(ggplot2)


## remove variable in the workspace
rm(list=ls())


## load gapminder dataset
gdURL <- "http://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt"
gDat <- read.delim(file = gdURL)
## Some fact of the data set
summary(gDat)


## a couple descriptive plots to file with highly informative names.

## (1)Show trend of life expenctancy for different continents
## First,compute the life expenctancy for different continents over time
LifeExp_cont <- ddply(gDat, ~continent+year, summarize, avglifeExp = mean(lifeExp))
## plot it with ggplot 
p1 <- ggplot(LifeExp_cont, aes(x = as.factor(year), y = avglifeExp, color = continent, group = continent))
p1 + geom_point() + geom_line() +  ylab("Avg Life Expectancy over Years") + xlab("Year") + ggtitle("trend of life expenctancy")
## save plot to file
ggsave("results_figure/trend_of_life_expenctancy.png")
#dev.off()


## (2)Show trend of gdp per capata for different continents
## First,compute the gdp per capata for different continents over time
gdpPercap_cont <- ddply(gDat, ~continent+year, summarize, avgGDP = mean(gdpPercap))
## plot it with ggplot 
p2 <- ggplot(gdpPercap_cont, aes(x = as.factor(year), y = avgGDP, color = continent, group = continent))
p2 + geom_point() + geom_line() +  ylab("Avg gdp per capata over Years") + xlab("Year") + ggtitle("trend of gdp per capata")
## save plot to file
ggsave("results_figure/trend_of_gdp_per_capata.png")
#dev.off()


## (3)Show trend of total population for different continents
## First,compute the total populiation for different continents over time
population_cont <- ddply(gDat, ~continent+year, summarize, population = sum(pop))
## plot it with ggplot 
p3 <- ggplot(population_cont, aes(x = as.factor(year), y = population, color = continent, group = continent))
p3 + geom_point() + geom_line() +  ylab("Total population over Years") + xlab("Year") + ggtitle("trend of total population")
## save plot to file
ggsave("results_figure/trend_of_total_population.png")
#dev.off()


## (4)show trend of life expenctancy for different continents with more details
pdf("results_figure/trend_of_life_expenctancy_with_detail.pdf") 
stripplot(lifeExp ~ factor(year), gDat, jitter.data = TRUE,
          group = reorder(continent, lifeExp),
          type = c("p", "a"), fun = mean, alpha = 0.6, grid = "h",
          main = paste("Life expectancy,mean"),
          auto.key = TRUE)
dev.off()


## (5)show trend of gdp per capata for different continents with more details
pdf("results_figure/trend_of_gdp_per_capata_with_detail.pdf") 
stripplot(gdpPercap ~ factor(year), gDat, jitter.data = TRUE,
          group = reorder(continent, gdpPercap),
          type = c("p", "a"), fun = mean, alpha = 0.6, grid = "h",
          main = paste("Gdp per capata,mean"),
          auto.key = TRUE)
dev.off()



## reorder the data
order_gDat <- within(gDat, continent <- reorder(continent, lifeExp))
order_gDat <- arrange(order_gDat, continent)
order_gDat <- 
## write re-order data to a new file for future use
write.table(order_gDat, "results_data/gapminderData_orderContinent.tsv", quote = FALSE,
            sep = "\t", row.names = FALSE)