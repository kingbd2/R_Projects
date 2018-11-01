# Missing values

## Ignore missing values
mean(data, na.rm=T)

## Replace missing values
data[is.na(data)] <- 0

## Imputation (guess what number should replace NA)
### Package options:
library(mi)
library(mice)
#library(imputation)
library(VIM) #Need to install quantreg as well

### Usage (mice package)
md.pattern(data) # Shows missing values for each element of data

mice_plot <- aggr(data, col=c('navyblue','yellow'),
                  numbers=TRUE, sortVars=TRUE,
                  labels=names(data), cex.axis=.7,
                  gap=3, ylab=c("Missing data","Pattern"))

tempData <- mice(data,m=5,maxit=50,meth='pmm',seed=500)
summary(tempData)

tempData$imp#$variable #Inspect imputed values

completed_data <- complete(tempData,1) #Fill in missing values