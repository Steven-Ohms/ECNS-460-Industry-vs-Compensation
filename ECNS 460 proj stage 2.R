rm(list = ls()) #Clears environment

install.packages("ggplot2")  #Installs packages
library(ggplot2)
install.packages("forecast")  #Installs packages
library(forecast)
install.packages("readxl")
library(readxl)
install.packages("tidyverse")
library(tidyverse)


industry_data = read_excel("C:/Users/Owner/Downloads/Industry.xlsx")

head(industry_data)

labor_productivity_data = read_excel("C:/Users/Owner/Downloads/labor-productivity-detailed-industries.xlsx", sheet = "MachineReadable")

head(labor_productivity_data)

#Now that we import the data, the first task is to clean it.
#The first thing of note is that there are no null values in the labor_productivity dataset, and only null values in collumns we will probably not even use in the industry dataset
#The next major noticable thing before we go through with the data checklist, and the inner join, is matching the date ranges
#The industry data only contains variables from 2021, and the labor productivity contains data from 1988-2022. Therefore we need to get rid of all of the data in the labor productivity dataset that arent from 2021
#One more thing is that the Industry data contains a period attribute (1st quarter, 2nd quarter, annual, etc). In order to make things match up, we need to only account for annual data, as that is what is being recorded when we filter for years in the labor productivity dataset

labor_productivity_2021_data = labor_productivity_data %>% #filters 2021 data
  filter(Year == 2021)

industry_data_annual = industry_data %>% #filters Annual data for the industry data
  filter(Period == "Annual")

(labor_productivity_2021_data)
(industry_data_annual)
#Now we need to inner join the datasets. Thankfully industry codes are standardized.
#however in the Industry dataset, the industry code attribute contains the number and the name, while the attribute in the labor productivity
#dataset only has the code. Therefore we need to separate the number and name in the industry dataset


industry_data_separated = industry_data_annual %>%  #Separates the industry data so that NAICS is its own attribute
  separate( 'Industry Code & Title', c("NAICS", "industry"), " -")

(industry_data_separated)



###The next thing we need to do is unite the labor productivity data. This is because the dataset is weird, for example there are multiple different mining 21
# rows. The only difference in each row is the measurement, unit, and corresponding value found in each row. However this would make sense to add all of these measurement/unit 
#combination into a new attribute (Because there are multiple, and a lot of repeats of the same measurement/unit combo, and only one corresponding value)

united_labor_productivity_data = labor_productivity_2021_data %>% 
  unite("measureUnits", Measure, Units, sep = "_") %>%   #Creates a new attribute measureUnits, which is the combination of measure and units
  pivot_wider(names_from = measureUnits, values_from = "Value") #Creates a new attribute, with the name of measureUnits, and the values from Value

(united_labor_productivity_data)


#Now that we have all of the data cleaned, we should be ready to inner join. We will be joining by NAICS code

industry_labor_data = inner_join(industry_data_separated, united_labor_productivity_data, by = "NAICS")

view(industry_labor_data)  #Now we need to remove useless columns. We see a lot of repeat columns/columns with the same information 

cleaned_industry_labor_data = industry_labor_data %>% select(-`Year (copy)`, -`PeriodCode (copy)`, -`Area (copy)`, -`Area`, -Year.x, -Year.y, -`Area Type Name`, -`State Name`, -Basis)

view(cleaned_industry_labor_data)
