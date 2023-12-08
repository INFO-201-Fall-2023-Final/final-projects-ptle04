# Install and load necessary packages if not already installed
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}

# Load required libraries
library(ggplot2)
library(dplyr)

# Sample data (replace this with your actual data)
# Assuming your data frame is named 'suicide_data' with columns 'Year' and 'Number_of_Suicides'
# Make sure your data includes the years 2007 to 2017
suicide_data <- data.frame(
  Year = c(2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017),
  Number_of_Suicides = c(100, 120, 90, 110, 130, 150, 140, 160, 180, 200, 220)
)

# Create a bubble chart using ggplot2
ggplot(suicide_data, aes(x = Year, y = Number_of_Suicides, size = Number_of_Suicides)) +
  geom_point(alpha = 0.7, color = "blue") +
  labs(title = "Total Number of Suicides Each Year (2007-2017)",
       x = "Year",
       y = "Number of Suicides") +
  scale_size_continuous(range = c(3, 10)) +
  theme_minimal()