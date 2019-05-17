setwd('/Users/sougatabhattacharya/myspaces/course/john-hopkins/assignments/eda')

NEI_data <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
SCC_data <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

## Question 2

#Have total emissions from PM2.5 decreased in the Baltimore City,
#Maryland(fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

baltimore_NEI <- NEI_data[NEI_data$fips=="24510",]
totalPm2_5_baltimore <- aggregate(Emissions ~ year,baltimore_NEI,sum)

totalPm2_5_baltimore

png("plot2.png",width=480,height=480,units="px",bg="transparent")
barplot(totalPm2_5_baltimore$Emissions, names.arg = totalPm2_5_baltimore$year,xlab = "Year",ylab = "Emission Mn tons",
        main = "Distribution of Total PM2.5 Emissions for Baltimore  by Year")

dev.off()

###Overall total emissions from PM2.5 have decreased in Baltimore City, Maryland from 1999 to 2008.