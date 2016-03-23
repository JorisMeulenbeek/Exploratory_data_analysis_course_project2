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

##Berekenen totalen Emissions per jaar
Baltimore <- subset(NEI, fips== "24510")
Totaalperjaar <- aggregate(Emissions ~ year + type, Baltimore, sum)  

##Opslaan png file
png("plot3.png", width=640, height=480) 
g <- ggplot(Totaalperjaar, aes(year, Emissions, color = type)) 
g <- g + geom_line() + xlab("year") + ylab('Total PM2.5 Emissions') + ggtitle('Total Baltimore City PM2.5 Emissions by year') 
print(g) 
dev.off() 

