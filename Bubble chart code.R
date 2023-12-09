# Load required libraries
library(ggplot2)
library(dplyr)
source("data_cleanup.R")

bub_df <-  group_by(suicide_df, YEAR, ESTIMATE)
bub_df <- filter(suicide_df, STUB_LABEL == "All persons")
bub_df <- filter(bub_df, YEAR >= 2007)
bub_df <- filter(bub_df, YEAR <= 2017)
bub_df <- filter(bub_df, UNIT_NUM == 1)
# Create a bubble chart using ggplot2
bubble <- ggplot(data = bub_df, aes(x = YEAR, y = ESTIMATE, size = ESTIMATE, color = ESTIMATE))+ 
  geom_point() +
  labs(
       x = "Year",
       y = "Number of Suicides (per 100,000 resident population)") +
  scale_size_continuous(range = c(3, 10)) +
  theme_minimal()
plot(bubble)
