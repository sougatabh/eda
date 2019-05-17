library(ggplot2)
setwd('/Users/sougatabhattacharya/myspaces/course/john-hopkins/assignments/eda')

#Question 3
#Of the four types of sources indicated by the  (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

NEI_data <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
SCC_data <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

baltimore_NEI <- NEI_data[NEI_data$fips=="24510",]

png("plot3.png",width=480,height=480,units="px",bg="transparent")
ggp <- ggplot(baltimore_NEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
print(ggp)
dev.off()

#Ques Part 1:
##Of the four types of sources indicated by the  (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
#Answer Part -1
#The non-road, nonpoint, on-road source types have all seen decreased emissions overall from 1999-2008 in Baltimore City.

#Ques Part 2:
# Whihc has seen increase
## Answer 
#POINT data has seen sligh increase from 2002 to 2005
