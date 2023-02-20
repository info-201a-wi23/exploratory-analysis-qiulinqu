library(dplyr)
library(ggplot2)

food_data <- read.csv("Food_Supply_kcal_Data.csv")
#wWhat are the top 10 countries with the most deaths from food malnutrition?
deaths_data <- food_data %>% select(Country, Deaths)

deaths_data1 <- deaths_data %>% arrange(desc(Deaths))

deaths_top10 <- deaths_data1[1:10,]

ggplot(deaths_top10, aes(x = Country, y = Deaths)) +
  geom_bar(stat = "identity", fill = "blue") +
  xlab("Country") +
  ylab("Number of deaths") +
  ggtitle("Top 10 countries with the most deaths")
           

#write a summary paragraph
I made a plot on the top 10 countries with the most deaths from food malnutrition in RStudio. As shown in the plot below, Belgium had the highest number of deaths, followed by Slovenia, the U.K., Czechia, Italy, Bosnia and Herzegovina, North Macedonia, the U.S., and Portugal. Bulgaria came as the 10th country with the most deaths. Nonetheless, based on the variables in the data set, I would like to know whether the population is a key predictor of the number of deaths in different countries. That is, what is the death rate in different countries due to food malnutrition, measured as the number of deaths per 100,000 people? I would like to know whether the high number of deaths that are registered by countries such as Belgium, Slovenia, and the U.K. is affected by the population size such that countries with larger populations register more deaths. I believe that the number of deaths per 100,000 individuals can give a more objective measure of the food malnutrition challenge.  
