# The Data Behind HDB Resale Flats

## An analysis of housing data in Singapore from 1990 to 2022.

According to [Statista](https://www.statista.com/statistics/625108/median-age-of-first-time-marriages-in-singapore/), the average Singaporean gets married at around 30 years old. For these couples looking to start a family, buying their own house is often the first page in the next chapter of their lives.

However, buying a house is an extremely significant commitment. This project will provide the relevant information Singaporeans need to make a confident decision when buying a HDB resale flat. We seek to answer the following questions:

 - On average, how much should I expect to spend on a flat?
 - How does the location of a flat affect its price?
 - Has the demand of HDB flats changed over time?

In this project, we will do the following:

 - Data Cleaning with R
 - Python script to retrieve data from OneMap API
 - Create a interactive dashboard with Tableau

### Data Sources
 - [Resale Flat Prices](https://data.gov.sg/dataset/resale-flat-prices)
 - [Planning Area Census 2010](https://data.gov.sg/dataset/planning-area-census2010)

Publically available datasets provided by the Singapore Government

 - [OneMap API](https://www.onemap.gov.sg/docs/)

Geographic locations of all flats are extracted from OneMap API. See [locations.py](./locations.py) for code.