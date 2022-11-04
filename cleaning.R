# importing libraries
library(dplyr)
library(readr)
library(stringr)

# Joining files into dataframe
data <- list.files(path="data/prices", full.names = TRUE) %>% 
  lapply(read_csv)
data[[3]] <- select(data[[3]], -remaining_lease)
data[[4]] <- select(data[[4]], -remaining_lease)
data <- bind_rows(data)

# standardise labels
data <- data %>%
  mutate(
    flat_type = replace(flat_type, flat_type == "MULTI GENERATION", "MULTI-GENERATION"),
    flat_model = toupper(flat_model)
    )

# calculate remaining lease
data <- data %>%
  mutate(
    year = as.numeric(str_extract(month,"\\b[0-9]{4}")),
    remaining_lease = 99 - year + lease_commence_date
    ) %>%
  select(-c(month, lease_commence_date))

# create address column before passing to python
data <- data %>%
  mutate(address = paste(block, street_name, sep = " ")) %>%
  select(-c(town, block, street_name))

# export file to csv
write_csv(data, "data/prices_all.csv")