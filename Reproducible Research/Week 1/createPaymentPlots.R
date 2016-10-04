##############################################################
## createPaymentPlots.R 
##
## Read in the "payments.csv" data and create 2 plots
## using the base R plotting system:
##
## 1. A plot showing the relationship between mean covered
## charges and mean total payments in New York
##
## 2. A plot showing how the relationship between mean covered
## charges and mean total payments varies by medical condition
## and the state in which care was received
##
## Matthew Richards, 10/04/2016
##############################################################


## Load the dataset
payments <- read.csv("./payments.csv")

## Create Plot 1
pdf("NY_means.pdf")
with(subset(payments, Provider.State == "NY"),
     plot(Average.Covered.Charges~Average.Total.Payments))
title("Mean Covered Charges v. Mean Total Payments in New York State")
dev.off()

## Create Plot 2
## Note that there are 6 conditions and 6 states
## We'll color-code by state in one plot and condition in the other
pdf("State_DRG_means.pdf",paper = "a4r",height = 8, width = 10)
layout(matrix(c(1,2,1,3),ncol = 2,byrow = TRUE),heights = c(5,2.1,2.9))
with(payments,plot(Average.Covered.Charges~Average.Total.Payments,
          col = Provider.State, pch = 20))
title(main = "Coverage Charges v. Total Payments By State",cex.main = 0.9)
legend("topleft",col = 1:6, pch = 19,cex = 0.9,
       legend = levels(payments$Provider.State))
with(payments,plot(Average.Covered.Charges~Average.Total.Payments,
                   col = DRG.Definition, pch = 20))
title(main = "Coverage Charges v. Total Payments By Condition",cex.main = 0.9)
plot.new()
legend("top",col = 1:6, pch = 19,cex = 0.6,
       legend = levels(payments$DRG.Definition))
dev.off()

## Alternate Plot 2: 6 plots
par(mar = (1,1,1,1))
layout(matrix(c(1,2,3,4,5,6,7,7,7),ncol=3,byrow=TRUE),heights = c(2,2,1))

for (condition in levels(payments$DRG.Definition)) {
  with(subset(payments, DRG.Definition == condition),
       plot(Average.Covered.Charges~Average.Total.Payments,
            col = Provider.State, pch = 19))
  title(main = condition, cex.main = 0.6)
}
plot.new()
legend("center",col = 1:6, pch = 19,cex = 0.9,
       legend = levels(payments$Provider.State), horiz = TRUE)