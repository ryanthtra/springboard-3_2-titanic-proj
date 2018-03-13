library(dplyr)
library(readr)

# Step 0 - Load the data in RStudio
refine_original <- read_csv("titanic_original.csv")
View(refine_original)

# Step 1 - Port of embarkation
