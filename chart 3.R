<<<<<<< HEAD
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
           
=======
x_values <- seq(1, 3)
y_values <- seq(1,3)

library(ggplot2)
ggplot() +
  geom_point(aes(x=x_values, y = y_values))
>>>>>>> 6cf093718fc3ca0edff1dc7a2d15b469d8eea933
