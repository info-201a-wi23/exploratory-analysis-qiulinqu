#reading dataset from csv file
data <- read.csv("Food_Supply_kcal_Data.csv")
head(data)

#crating summary with five values
library(dplyr)
summary_info <- list()
#maximum deaths value
summary_info$max_deaths <- data%>%
  filter(Deaths == max(Deaths, na.rm = TRUE))%>%
  select(Deaths)%>%
  rename("max_deaths" = Deaths)
#minimum_deaths value
summary_info$min_deaths <- data%>%
  filter(Deaths == max(Deaths, na.rm = TRUE))%>%
  select(Deaths)%>%
  rename("min_deaths" = Deaths)
#adding average value for deaths percentage
summary_info$avg_deaths <- data%>%
  summarise(avg_deaths = mean(Deaths, na.rm = TRUE))
#converting Undernourished data type to numeric
data$Undernourished <- as.numeric(data$Undernourished)
#adding average value for Undernourished
summary_info$avg_undernourished <- data%>%
  summarise(avg_undernourished = mean(Undernourished, na.rm = TRUE))
#adding maximum value for undernourished
summary_info$max_undernourished <- data%>%
  summarise(max_undernourished = max(Undernourished, na.rm = TRUE))
summary_info