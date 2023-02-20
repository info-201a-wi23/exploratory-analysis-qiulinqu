population_death_fat <- read.csv('/Users/qiulinqu/Desktop/archive-2/Food_Supply_kcal_Data.csv')


install.packages("scales")

library("scales")
library("dplyr")
library("ggplot2")


population_death_fat <- population_death_fat %>% 
  filter(!is.na(Obesity), !is.na(Deaths))


ggplot(data = population_death_fat) +
  geom_point(mapping = aes(x = Obesity, y = Deaths)) +
  labs( title = "Relationsip Between Obesity Rate And Covid Death Rate",
        x = 'Obesity Rate',
        y = 'Covid Death Rate') +
  scale_y_continuous(labels = label_number_si())



cor(population_death_fat$Obesity, population_death_fat$Deaths)


# Why choose these dataset and make this chart? 
I would like to examine the relationship between obesity 
rates and covid mortality in each country, and if there 
is a positive correlation between obesity rates and covid 
mortality, it means that we can study the usefulness of 
calorie intake and dietary habits to the goal of reducing 
covid mortality in people. We can use this data to guide 
people in countries with high obesity rates to lose weight
and achieve the ultimate goal of reducing covid mortality.


# What does this chart reveal? 
As we see from the scartterplot and correlation coefficient(0.483)
calculated between obesity rate and covid death rate,
We can see that there is a positive moderately 
strong correlation between obesity rates and covid 
mortality in the countries we collected, which suggests
that the more obese people are, the more likely they are 
to die from covid. This also suggests that it makes sense 
that we study people's food calorie intake because 
controlling people's calorie intake and reducing obesity 
rates can help reduce covid mortality.
