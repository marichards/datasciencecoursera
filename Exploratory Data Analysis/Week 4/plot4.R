############################
## plot4.R
##
## Construct the "plot4.png" plot, showing the PM2.5 emissions for
## coal combustion sources across the US
##
############################

## Step 1: Read in the 2 data files
NEI <- readRDS("./exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

## Step 2: Pull out only the subsets of SCC where Level Three has "coal"
## and where Level One has "Combustion"
coal_idx <- grep("coal", SCC$SCC.Level.Three,ignore.case = TRUE)
comb_idx <- grep("combustion",SCC$SCC.Level.One,ignore.case = TRUE)
both <- intersect(coal_idx,comb_idx)
SCC_sub <- SCC[both,]

## Step 3: Use the codes in SCC to pull out the subset of NEI data
coal <- subset(NEI,SCC %in% SCC_sub$SCC)

## Step 4: Create a scatterplot for all coal combustion data, add a linear trendline, and label the plot accordingly
png("plot4.png",height = 480,width = 480)
ggplot(data = coal, aes(year,Emissions)) + geom_point() + geom_smooth(method = "lm") + coord_cartesian(ylim = c(-1,500)) + labs(title = expression("US Coal Combustion PM"[2.5]), y = expression("PM"[2.5]), x = "Year")
dev.off()