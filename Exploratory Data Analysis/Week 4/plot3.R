############################
## plot3.R
##
## Construct the "plot3.png" plot, showing the PM2.5 emissions for Baltimore
## separated by "type" across all the years
##
## Note: this plot must use the "ggplot2" plotting system
##
############################

## Step 1: Read in the 2 data files
NEI <- readRDS("./exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

## Step 2: Subset the Baltimore data only
balt <- subset(NEI, fips == "24510")

## Step 3: Create a multi-panel scatterplot for Baltimore by type and label the plot accordingly
png("plot3.png",height = 480,width = 840)
ggplot(data = balt, aes(year,log10(Emissions))) + geom_point() + facet_grid(.~type) + geom_smooth(method = "lm") + labs(title = expression("Baltimore PM"[2.5]*" By Type"), y = expression("log"[10]* "(PM"[2.5]*")"), x = "Year")
dev.off()