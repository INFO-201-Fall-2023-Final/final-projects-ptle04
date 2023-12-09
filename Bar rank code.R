

# Load required libraries
library(ggplot2)
library(dplyr)
library(plotly)
source("data_cleanup.R")

# Add a new variable for highlighting

df$suicide <-  ifelse(df$Cause.Name == "Suicide", "Suicide", "Other Causes")

bar_rank <- ggplot(data = df, aes(x=reorder(Cause.Name, +Deaths), y=Deaths, fill = suicide)) + 
  geom_bar(stat = "identity")+labs(x = "Cause of Death", y = "Average Deaths over a span of 10 years" ) +
  scale_fill_manual( values = c( "Suicide"="red", "Other Causes"="darkgray" ), guide = FALSE )+
  coord_flip()
plot(bar_rank)

#geom_text(aes(label = Deaths, y = Deaths, colour = ifelse(Cause.Name == "Suicide", "desired_colour", "other_colour")))

# Normalize the percentages to sum to 100

#df$Percentage <- (df$Deaths / sum(df$Deaths)) *100

# Create a heatmap using ggplot2
#heat <- ggplot(data = df, aes(x = Cause.Name, y = Percentage, fill = Percentage)) +
 # geom_tile() +
  #scale_fill_gradient(low = "lightblue", high = "darkblue") +
  #labs(title = "Percentage of Suicide Deaths by Type",
  #     x = "Type of Death",
   #    y = "Percent of Suicide Deaths") +
  #theme_minimal()
#plot(heat)

