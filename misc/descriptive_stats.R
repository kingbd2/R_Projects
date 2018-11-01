## Descriptive statistics

#Mean, Median, Mode
#Min, Max
#Standard deviation
#For population SD:
#  Calculate sum of squares ( SUM (Xi - Xmean)^2 )
#Divide by N
#Square root
#For sample SD:
#  Divide by N-1 (Bessel’s correction)
#Range
#Correlation matrixw


# Structure of data
str(data)

# Descriptives - Min, 1Q, Median, Mean, 3Q, Max
summary(data)

# Boxplot values
boxplot.stats(data)