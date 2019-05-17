library(ggplot2)
setwd('/Users/sougatabhattacharya/myspaces/course/john-hopkins/assignments/eda')

#Question 3
#Of the four types of sources indicated by the  (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

NEI_data <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
SCC_data <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

#Question 4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

combustion_related <- grepl("comb", SCC_data$SCC.Level.One, ignore.case=TRUE)
coal_related <- grepl("coal", SCC_data$SCC.Level.Four, ignore.case=TRUE) 
coal_combustion <- (combustion_related & coal_related)
combustion_SCC <- SCC_data[coal_combustion,]$SCC
combustion_NEI <- NEI_data[NEI_data$SCC %in% combustion_SCC,]

png("plot4.png",width=480,height=480,units="px",bg="transparent")
ggp <- ggplot(combustion_NEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggp)
dev.off()

#Answer 
#Emissions from coal combustion related sources have decreased from 6 * 10^6 to below 4 * 10^6 from 1999-2008.

