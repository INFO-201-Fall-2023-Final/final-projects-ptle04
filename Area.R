# Graph 2: Area Chart
suicide_rate_df <- df[, c("YEAR", "ESTIMATE")]
suicide_rate_df <- aggregate(Average_Estimate ~ YEAR, data = suicide_rate_df, FUN = mean)

ggplot(suicide_rate_df, aes(x = YEAR, y = Average_Estimate)) +
  geom_area(fill = "blue", alpha = 0.5) +
  labs(title = "Change in Suicide Death Rates Over Time", x = "Year", y = "Average Suicide Death Rate"
