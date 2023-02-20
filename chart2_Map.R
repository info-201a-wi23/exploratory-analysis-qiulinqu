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
undernution_to_death <- ggplot(undernourished_deaths_df) +
  geom_line(aes(x = Deaths, 
                y = Undernourished_as_num)) +
  labs(title = "COVID-19 Deaths in Relation to Undernourishment", 
       x = "Deaths (%)", 
      y = "Undernourished (%)") +
  scale_y_continuous(labels = label_number_si())

# display map
undernution_to_death