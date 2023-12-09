#import libraries/sources

library(ggplot2)
library(dplyr)
library(plotly)
source("data_cleanup.R")

# Graph 2: Area Chart

#suicide_rate_df <- df[, c("YEAR", "ESTIMATE")]
#suicide_rate_df <- aggregate(Average_Estimate ~ YEAR, data = suicide_rate_df, FUN = mean)

#suicide_rate_df <- group_by(df, YEAR, ESTIMATE)
suicide_rate_df <- group_by(df, YEAR)
suicide_rate_df <- summarize(suicide_rate_df, Average_Estimate = mean(ESTIMATE, na.rm = TRUE))

area <- ggplot(suicide_rate_df, aes(x = YEAR, y = Average_Estimate)) +
  geom_area(fill = "blue", alpha = 0.5) +
 labs( x = "Year", y = "Average Suicide Death Rate")

area_plotly <- ggplotly(area)

plot(area)


