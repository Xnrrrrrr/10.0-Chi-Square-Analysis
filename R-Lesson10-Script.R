#Step 1: Load the data file in R
attackData <- read.csv("Chi-Data1.csv", header = TRUE)

#Step 2: Install 'gmodels' packages and then load it in R.
install.packages("gmodels")
library(gmodels)

#Step 3: Use CrossTable() function to run a chi-square test in R

CrossTable(attackData$Country,attackData$Type, fisher = TRUE, chisq = TRUE, expected=TRUE, sresid = TRUE, format = "SPSS")




