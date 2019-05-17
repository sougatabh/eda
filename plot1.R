setwd('/Users/sougatabhattacharya/myspaces/course/john-hopkins/assignments/eda')

NEI_data <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
SCC_data <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

## Question 1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
totalPm2_5 <- aggregate(Emissions ~ year,NEI_data, sum)

totalPm2_5

png("plot1.png",width=480,height=480,units="px",bg="transparent")
barplot((totalPm2_5$Emissions)/10^6, names.arg = totalPm2_5$year,xlab = "Year",ylab = "Emission Mn tons",
        main = "Distribution of Total PM2.5 Emissions(Mn) From All US Sources by Year")

dev.off()
#Answer
# we can see from the plot, total emissions have decreased in the US from 1999 to 2008.