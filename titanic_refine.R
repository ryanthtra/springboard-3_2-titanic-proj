library(dplyr)
library(readr)

# Step 0 - Load the data in RStudio
titanic_original <- read_csv("titanic_original.csv")
View(titanic_original)

# Step 1 - Port of embarkation
titanic_clean <- titanic_original %>% 
  mutate(embarked = replace(embarked, is.na(embarked) == TRUE, 'S'))