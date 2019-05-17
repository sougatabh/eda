setwd('/Users/sougatabhattacharya/myspaces/course/john-hopkins/assignments/eda')

NEI_data <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
SCC_data <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

## Question 5
##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?


vehicles <- grepl("vehicle", SCC_data$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC_data[vehicles,]$SCC
vehicles_NEI <- NEI_data[NEI_data$SCC %in% vehicles_SCC,]

baltimore_vehicles_NEI <- vehicles_NEI[vehicles_NEI$fips==24510,]

png("plot5.png",width=480,height=480,units="px",bg="transparent")
ggp <- ggplot(baltimore_vehicles_NEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

dev.off()

#Answer
#Emissions from motor vehicle sources have dropped from 1999-2008 in Baltimore City!

