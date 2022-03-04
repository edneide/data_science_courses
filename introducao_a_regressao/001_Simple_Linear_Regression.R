##------------------------------------##
## Introduction to regression in R    ##
## Data Camp Course                   ##
## Edneide Ramalho                    ##
## September 15, 2021                 ##
##------------------------------------##

##------------------------------------##
##  0. Packages --------
##------------------------------------##
library(fst) # to read fst format
library(tidyverse)


##------------------------------------##
# 1. A tale of two variables  ---------
##------------------------------------##

## 1.1. Importing datasets --------
taiwan_real_estate <-  read_fst(
  "taiwan_real_estate.fst",
  columns = NULL,
  from = 1,
  to = NULL,
  as.data.table = FALSE,
  old_format = FALSE
)

glimpse(taiwan_real_estate)

## 1.2.Visualizing two variables --------
taiwan_real_estate %>% 
  ggplot(aes(x = n_convenience, y = price_twd_msq)) +
  geom_point(alpha = 0.5) + 
  theme_bw()

## 1.3. Adding a trend line ----------
taiwan_real_estate %>% 
  ggplot(aes(x = n_convenience, y = price_twd_msq)) +
  geom_point(alpha = 0.5) +
  geom_smooth(se = FALSE, method = 'lm') +
  theme_bw()

##---------------------------------------##
# 2. Fitting a linear regression. ---------
##---------------------------------------##

# Equation
# y = intercept + slope * x

## 2.1.  Running a model (example) -------
lm(price_twd_msq ~ dist_to_mrt_m, data = taiwan_real_estate)

## 2.2. Linear regression with lm() -----

lm(price_twd_msq ~ n_convenience, data =  taiwan_real_estate)

# Intercept: on average, a house with zero convenience store nearby had a price
# of 8.2242 TWD per square meter

# Slope: If you increase the number of nearby convenience stores by one, 
# then the expected increase in house price is 0.7981 TWD per square meter.

##--------------------------------------------##
# 3. Categorical explanatory variables ---------
##--------------------------------------------##
