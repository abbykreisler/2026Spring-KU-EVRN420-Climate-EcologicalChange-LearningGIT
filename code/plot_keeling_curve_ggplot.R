# an R script to use dplyr and ggplot to visualize the keeling curve 
# of CO2 concentrations

# Abby Kreisler
# a832k260@ku.edu
# 2/25/26

# install packages
install.packages("dplyr")
install.packages("ggplot2")

# load into library
library(dplyr)
library(ggplot2)

# load in the csv data
mlo_data <- read.csv("data/monthly_in_situ_co2_mlo_cleaned.csv")

# use a dplyr pipe and filter function to get rid of -99 values
# %>% is a pipe - connects commands together
mlo_data %>%
  filter(CO2 > 0) %>%
  filter(Yr == 1990) %>%
  ggplot(aes(x = Date.1,
             y = CO2)) +
  geom_line()

# save file
ggsave("output/ggplot_keeling.png")
