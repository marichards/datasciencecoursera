## toothGrowth.R

## Investigate the ToothGrowth Data

## 1. Load the data and perform some basic exploratory data analyses
## 2. Provide a basic summary of the data
## 3. Use CIs and/or hypothesis tests to compare tooth growth by 
## supp and dose (only use the techniques from the class)
## 4. State your conclusions and assumptions needed for them.

###########################################################################

## Load ggplot
library(ggplot2)

## Load the data set
data("ToothGrowth")

## Do a brief summary
summary(ToothGrowth)

## Look at what dose and supp parameters look like
with(ToothGrowth,table(supp,dose))

## Make a histogram using ggplot
g <- ggplot(ToothGrowth,aes(len,fill=supp))
g + geom_histogram(binwidth = 3) + facet_grid(~dose)

## Make a scatterplot instead
g <- ggplot(ToothGrowth,aes(dose,len))
g + geom_point(aes(color = factor(supp))) 

## Subset based on supp
oj_growth <- subset(ToothGrowth,supp == 'OJ')$len
vc_growth <- subset(ToothGrowth,supp == 'VC')$len

## 

## Conduct a t-test on different supp levels
t.test(oj_growth,vc_growth)
