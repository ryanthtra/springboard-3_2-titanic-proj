library(dplyr)
library(readr)

# Step 0 - Load the data in RStudio
titanic_original <- read_csv("titanic_original.csv")

# Step 1 - Port of embarkation
titanic_clean <- titanic_original %>% 
  mutate(embarked = replace(embarked, is.na(embarked) == TRUE, 'S'))

# Step 2 - Age
# 1. Calculate the mean of the Age column, and use that value to populate the missing values.
mean_age <- titanic_original %>% 
  summarise(avg = mean(age, na.rm = TRUE))
# Convert mean_age to a single numeric value
mean_age <- as.numeric(unlist(mean_age[1,1])) 
titanic_clean <- titanic_clean %>% 
  mutate(age = replace(age, is.na(age) == TRUE, round(mean_age, 2)))

# Step 3 - Lifeboat: replace missing boat values with 'None'
titanic_clean <- titanic_clean %>% 
  mutate(boat = replace(boat, is.na(boat) == TRUE, 'None'))

# Step 4 - Cabin
# Some of the passengers didn't have a cabin, like the poorer people -- at least the movie indicated it so ;-)
titanic_clean <- titanic_clean %>% 
  mutate(has_cabin_number = if_else(is.na(cabin), 0, 1))

# Step 5 - Submit the project on Github (create clean .csv file)
write_csv(titanic_clean, "./titanic_clean.csv")
