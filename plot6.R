##set working directory
setwd('/Users/Joris/Documents/Exploratory_Data_Analysis/Assignment week 4');

##Load file 
if(!exists("NEI")){ 
NEI <- readRDS("summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
SCC <- readRDS("Source_Classification_Code.rds") 
} 
##Open library
library(ggplot2) 

##Merge data
NEISCC <- merge(NEI, SCC, by="SCC")

##Subset data
NEIsubset <- subset(NEI, (fips=="24510"|fips=="06037") & type=="ON-ROAD")

TotaalperjaarEnFips <- aggregate(Emissions ~ year + fips, NEIsubset, sum)
TotaalperjaarEnFips$fips[TotaalperjaarEnFips$fips=="24510"] <- "Baltimore"
TotaalperjaarEnFips$fips[TotaalperjaarEnFips$fips=="06037"] <- "Los Angeles"



##Histogram opslaan als png
png("plot6.png", width=1040, height=480)
g <- ggplot(TotaalperjaarEnFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity") + xlab("year") + ylab("Total PM2.5 Emissions") + ggtitle("Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City vs Los Angeles by year")
print(g)
dev.off()
