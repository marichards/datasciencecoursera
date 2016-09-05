############################
## plot5.R
##
## Construct the "plot5.png" plot, showing the PM2.5 emissions for Baltimore
## motor vehicles from 1999-2008
##
## Note that according to the NEI website, the "on-road" category includes
## onroad vehicles that use gas/diesel/fuels and the "non-road" category
## includes off-road mobile sources, such as locomotives and commerical marine
## vessels. Thus, this is the subset we're interested in. 
##
############################

## Step 1: Read in the 2 data files
NEI <- readRDS("./exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

## Step 2: Subset the Baltimore data and grab onroad/nonroad types
motor <- subset(NEI, fips == "24510" & (type == "ON-ROAD" |type == "NON-ROAD"))

## Step 3: Create a scatterplot for Baltimore motor vehicles by type and label the plot accordingly
png("plot5.png",height = 480,width = 480)
ggplot(motor, aes(year,log10(Emissions))) + geom_point() + geom_smooth(method = "lm") + labs(title = expression("Baltimore Motor Vehicle PM"[2.5]), y = expression("log"[10]* "(PM"[2.5]*")"), x = "Year")
dev.off()