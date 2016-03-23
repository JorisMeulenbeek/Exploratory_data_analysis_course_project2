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
NEIsubset <- subset(NEI, fips=="24510" & type=="ON-ROAD")

Totaalperjaar <- aggregate(Emissions ~ year, NEIsubset, sum)

##Opslaan png file
png("plot5.png", width=840, height=480)
g <- ggplot(Totaalperjaar, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") + xlab("year") + ylab("Total PM2.5 Emissions") + ggtitle('Total PM2.5 Emissions from motor vehicle (type = ON-ROAD) in Baltimore City by year')
print(g)
dev.off()






