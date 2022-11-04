# import latitude and longitude
locations <- read_csv("data/locations.csv")

# joining the tables
data <- inner_join(data, locations, "address") %>%
  select(-address)

# export file to csv
write_csv(data, "data/prices_all.csv")