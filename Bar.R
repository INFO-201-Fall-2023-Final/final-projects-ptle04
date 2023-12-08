# Graph 1: Multi Bar Chart
top_causes_df <- df[df$Cause.Name != "Suicide", ]
top_causes_df <- aggregate(Total_Deaths ~ Cause.Name, data = top_causes_df, FUN = sum)
top_causes_df <- top_causes_df[order(-top_causes_df$Total_Deaths), ]
top_causes_df <- head(top_causes_df, 3)

ggplot(top_causes_df, aes(x = Cause.Name, y = Total_Deaths)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 3 Causes of Death (Excluding Suicide)", x = "Cause of Death", y = "Number of Deaths")
