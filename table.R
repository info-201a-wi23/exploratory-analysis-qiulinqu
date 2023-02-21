#reading dataset from csv file
data <- read.csv("Food_Supply_kcal_Data.csv")
head(data)

#converting data type of Undernourished to numeric
data$Undernourished <- as.numeric(data$Undernourished)

#creating new variable population_cat
data$Populaton_cat <- ifelse(data$Population < 1000000, "low", ifelse(data$Population >= 1000000 & data$Population <= 10000000, "medium", "high"))
#summarise data by population categories
data_table <- data%>%
  group_by(Populaton_cat)%>%
  summarise(total_deaths = sum(Deaths, na.rm = TRUE),
            total_undernourished = sum(Undernourished, na.rm = TRUE),
            deaths_perc_by_confirmed = paste(round(sum(Deaths, na.rm = T)/sum(Confirmed, na.rm = T)*100,2), "%", sep = ""))
data_table