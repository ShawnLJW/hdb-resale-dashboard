# importing libraries
library(dplyr)
library(readr)

# Joining files into dataframe
data <- list.files(path="data/prices", full.names = TRUE) %>% 
  lapply(read_csv)
data[[3]] <- select(data[[3]], -remaining_lease)
data[[4]] <- select(data[[4]], -remaining_lease)
data <- bind_rows(data)

# convert values to uppercase
data <- data %>%
  mutate(
    town = replace(town, town == "KALLANG/WHAMPOA", "KALLANG"),
    flat_type = replace(flat_type, flat_type == "MULTI GENERATION", "MULTI-GENERATION"),
    flat_model = toupper(flat_model)
  )

# export file to csv
write_csv(data, "data/prices_all.csv")