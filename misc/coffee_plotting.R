library(tidyverse)
library(lubridate)
source("multiplot.R")


## Data prep
coffee$Expiration<-gsub('st,', '', coffee$Expiration)
coffee$Expiration<-gsub('th,', '', coffee$Expiration)
coffee$Expiration<-gsub('st,', '', coffee$Expiration)
coffee$Expiration<-gsub('rd,', '', coffee$Expiration)

## Multiplot
q<-ggplot(coffee)

p1 <- q + geom_bar(aes(Country.of.Origin, Aroma, fill = Country.of.Origin), 
                  position = "dodge", stat = "summary", fun.y = "mean") 
p2 <- q + geom_bar(aes(Country.of.Origin, Flavor, fill = Country.of.Origin), 
                  position = "dodge", stat = "summary", fun.y = "mean")
p3 <- q + geom_bar(aes(Country.of.Origin, Acidity, fill = Country.of.Origin), 
                  position = "dodge", stat = "summary", fun.y = "mean") 
p4 <- q + geom_bar(aes(Country.of.Origin, Body, fill = Country.of.Origin), 
                  position = "dodge", stat = "summary", fun.y = "mean")
p5 <- q + geom_bar(aes(Country.of.Origin, Balance, fill = Country.of.Origin), 
                   position = "dodge", stat = "summary", fun.y = "mean") 
p6 <- q + geom_bar(aes(Country.of.Origin, Uniformity, fill = Country.of.Origin), 
                   position = "dodge", stat = "summary", fun.y = "mean")
p7 <- q + geom_bar(aes(Country.of.Origin, Sweetness, fill = Country.of.Origin), 
                   position = "dodge", stat = "summary", fun.y = "mean") 
p8 <- q + geom_bar(aes(Country.of.Origin, Aftertaste, fill = Country.of.Origin), 
                   position = "dodge", stat = "summary", fun.y = "mean")

multiplot(p1, p2, p3, p4, p5, p6, p7, p8, cols=2)
 

## Coffee profile for country
by_country <- coffee_tibble %>% group_by(Country.of.Origin)
attributes_by_country <- summarise(by_country, flav=mean(Flavor, na.rm = T), aroma=mean(Aroma, na.rm = T), aft=mean(Aftertaste, na.rm=T), acidity=mean(Acidity, na.rm=T), body=mean(Body, na.rm = T), balance=mean(Balance, na.rm = T), uniformity=mean(Uniformity, na.rm = T), clean_cup=mean(Clean.Cup, na.rm = T), sweetness=mean(Sweetness, na.rm = T))

q<-ggplot(attributes_by_country, aes(Country.of.Origin))

q + 
  geom_point(aes(y = flav, colour = "flav", size = 1)) + 
  geom_point(aes(y = aroma, colour = "aroma", size = 1 )) +
  geom_point(aes(y = aft, colour = "aft", size = 1 )) + 
  geom_point(aes(y = acidity, colour = "acidity", size = 1 )) +
  geom_point(aes(y = body, colour = "body", size = 1 )) + 
  geom_point(aes(y = balance, colour = "balance", size = 1 )) +
  geom_point(aes(y = uniformity, colour = "uniformity", size = 1 )) + 
  geom_point(aes(y = clean_cup, colour = "clean_cup", size = 1 )) +
  geom_point(aes(y = sweetness, colour = "sweetness", size = 1 )) 
  


p1 <- geom_smooth(aes(Flavor, Aroma, color = Country.of.Origin)) 
p2 <- geom_smooth(aes(Country.of.Origin, Flavor, fill = Country.of.Origin))
p3 <- geom_smooth(aes(Country.of.Origin, Acidity, fill = Country.of.Origin)) 
p4 <- geom_smooth(aes(Country.of.Origin, Body, fill = Country.of.Origin))
p5 <- geom_smooth(aes(Country.of.Origin, Balance, fill = Country.of.Origin)) 
p6 <- geom_smooth(aes(Country.of.Origin, Uniformity, fill = Country.of.Origin))
p7 <- geom_smooth(aes(Country.of.Origin, Sweetness, fill = Country.of.Origin)) 
p8 <- geom_smooth(aes(Country.of.Origin, Aftertaste, fill = Country.of.Origin))

q + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8
 
q + ylim(6,9)

p <- ggplot(mpg, aes(class, hwy))
p + geom_boxplot()