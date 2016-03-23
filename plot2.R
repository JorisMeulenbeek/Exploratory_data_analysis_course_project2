##set working directory
setwd('/Users/Joris/Documents/Exploratory_Data_Analysis/Assignment week 4');

##Load file 
if(!exists("NEI")){ 
NEI <- readRDS("summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
SCC <- readRDS("Source_Classification_Code.rds") 
} 

##Berekenen totalen Emissions per jaar
Baltimore <- subset(NEI, fips== "24510")
Totaalperjaar <- aggregate(Emissions ~ year, Baltimore, sum)  

##Opslaan png file
png('plot2.png') 
barplot(height=Totaalperjaar$Emissions, names.arg=Totaalperjaar$year, xlab="years", ylab=expression('Total PM2.5 Emissions'),main=expression('Total Baltimore City PM2.5 Emissions by year')) 
dev.off() 
