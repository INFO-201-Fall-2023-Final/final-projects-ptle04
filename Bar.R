import libraries/sources
library(ggplot2)
library(dplyr)
library(plotly)
library(ggpubr)
source("data_cleanup.R")

#find differences
point <- group_by(df, Cause.Name) 
point <- point[!duplicated(df$Deaths), ]

causes <- unique(point$Cause.Name)

death_counts <- numeric(length(causes))

for (i in seq_along(causes)) {
  death_counts[i] <- sum(point$Deaths[point$Cause.Name == causes[i]])
}

# Combine the causes and their counts into a data frame
result <- data.frame(cause = causes, deaths = death_counts)

base_value <- result$deaths[4]  # if the base value is the first value in the column
difference <- result$deaths - base_value

# Add the difference to the dataframe as a new column
result$difference <- difference
result <- filter(result, cause != "Suicide")

# Lollipop chart
lolli <- ggplot(result, aes(x= cause, y= deaths)) +
  geom_segment( aes(x=cause, xend=cause, y=base_value, yend=difference), color="grey") +
  geom_point( color="orange", size=4) +
  geom_vline(aes(xintercept = base_value), color = "black", linetype = "solid")+
  theme_light() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.border = element_blank(),
    axis.ticks.x = element_blank()
  ) +
  xlab("Difference in death from Suicide") +
  ylab("Cause of Death")+
  coord_flip()

plot(lolli)
