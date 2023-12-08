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
data <- data.frame(
  TypeOfDeath = c("Accident", "Homicide", "Suicide", "Other"),
  Percentage = c(10, 20, 50, 20)
)

# Normalize the percentages to sum to 100
data$Percentage <- data$Percentage / sum(data$Percentage) * 100

# Create a heatmap using ggplot2
ggplot(data, aes(x = TypeOfDeath, y = Percentage, fill = Percentage)) +
  geom_tile() +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  labs(title = "Percentage of Suicide Deaths by Type",
       x = "Type of Death",
       y = "% of Suicide Deaths") +
  theme_minimal()
