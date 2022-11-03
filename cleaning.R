# importing libraries
library(dplyr)
library(readr)

# Joining files into dataframe
data <- list.files(path="data/prices", full.names = TRUE) %>% 
  lapply(read_csv)
data[[3]] <- select(data[[3]], -remaining_lease)
data[[4]] <- select(data[[4]], -remaining_lease)
data <- bind_rows(data)