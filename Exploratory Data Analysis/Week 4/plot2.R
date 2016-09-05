############################
## plot2.R
##
## Construct the "plot2.png" plot, showing the PM2.5 emissions for Baltimore
## for all sources across the years 1999, 2002, 2005, and 2008. 
##
## Note: this plot must use the "base" plotting system
##
############################

## Step 1: Read in the 2 data files
NEI <- readRDS("./exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

## Step 2: Subset the Baltimore data only
data1999 <- subset(NEI, year == 1999 & fips == "24510")
data2002 <- subset(NEI, year == 2002 & fips == "24510")
data2005 <- subset(NEI, year == 2005 & fips == "24510")
data2008 <- subset(NEI, year == 2008 & fips == "24510")

## Step 3: Create a boxplot for Baltimore and label the plot accordingly
png("plot2.png",width = 480, height = 480)
boxplot(log10(data1999$Emissions),log10(data2002$Emissions),log10(data2005$Emissions),log10(data2008$Emissions),names = c(1999,2002,2005,2008),xlab = "Year", ylab = expression("log"[10]*"(PM"[2.5]*")"), main = expression("Baltimore PM"[2.5]*" Levels By Year"))
dev.off()

