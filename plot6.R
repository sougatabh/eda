setwd('/Users/sougatabhattacharya/myspaces/course/john-hopkins/assignments/eda')

NEI_data <- readRDS('exdata_data_NEI_data/summarySCC_PM25.rds')
SCC_data <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

#Question 6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?

vehicles <- grepl("vehicle", SCC_data$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC_data[vehicles,]$SCC

vehicles_NEI <- NEI_data[NEI_data$SCC %in% vehicles_SCC,]
vehicles_baltimore_NEI <- vehicles_NEI[vehicles_NEI$fips == 24510,]
vehicles_baltimore_NEI$city <- "Baltimore City"
vehicles_LA_NEI <- vehicles_NEI[vehicles_NEI$fips=="06037",]
vehicles_LA_NEI$city <- "Los Angeles County"
both_NEI <- rbind(vehicles_baltimore_NEI,vehicles_LA_NEI)

png("plot6.png",width=480,height=480,units="px",bg="transparent")
ggp <- ggplot(both_NEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(ggp)

dev.off()
#Answer
#Los Angeles(LA) County has seen the greatest changes over time in motor vehicle emissions.
