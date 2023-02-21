#line plot:

# Question: Does malnutrition have an effect on likelihood of dying from COVID-19?

# Load libraries and install packages
library("ggplot2")
library("scales")
library("dplyr")

# load in df
CN_data <- read.csv("Food_Supply_kcal_Data.csv", stringsAsFactors = F)

# make new data frame to use to make a map
undernourished_deaths_df <- CN_data %>%
  mutate(Undernourished_as_num = as.numeric(as.character(Undernourished, na.rm = T))) %>%
  select(Country, Deaths, Undernourished_as_num) %>%
  na.omit(Undernourished_as_num)

# make line plot
undernourished_to_death <- ggplot(undernourished_deaths_df) +
  geom_line(aes(x = Deaths, 
                y = Undernourished_as_num)) +
  labs(title = "COVID-19 Deaths in Relation to Undernourishment", 
       x = "Deaths (%)", 
      y = "Undernourished (%)") +
  scale_y_continuous(labels = label_number_si())

# display map
undernourished_to_death


# write a summary paragraph

# This chart examines the relationship between undernourishment and death from COVID-19. The data shows that both lower and higher undernourished rates are correlated with low deaths and that both low to medium undernourishment rates are correlated with higher death rates. From this observation of both high and low undernourishment values bundled together, we can infer that there is no correlation between a country having a high undernourishment percent and a country having an increased percent of death's.This information seems contrary to everything I have learned, when a person is undernourished their ability to fight off sickness is decreased, thus I would have predicted that higher rates of undernourishment would correlate with higher rates of undernourishment. This broaches the question, does undernourishment affect the amount of confirmed cases? If so, why does it affect confirmed cases and not deaths? If it doesn't, the question becomes, why does undernourishment not impact COVID-19 rates, when it does impact the immune system?