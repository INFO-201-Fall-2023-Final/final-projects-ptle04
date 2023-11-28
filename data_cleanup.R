# Load in Libraries 
library(dplyr)
library(stringr)

# Import CSV files
suicide_df <- read.csv("suicide_rate.csv")
death_df <- read.csv("leading_cause.csv")

# Data Joinging
#left join data frame by the year
d_df <- group_by(death_df, Year, Cause.Name)
d_df <- filter(death_df, State == "United States")
d_sum <- summarize(d_df, Deaths, Age.adjusted.Death.Rate, Year, Cause.Name)
d_sum <- filter(d_sum, Year >= 2007)
d_sum <- filter(d_sum, Cause.Name != "All causes")


s_df <- group_by(suicide_df, YEAR, INDICATOR)
s_sum <- summarize(s_df, ESTIMATE, UNIT, AGE)
s_sum <- filter(s_sum, YEAR >= 2007)
s_sum <- filter(s_sum, YEAR <= 2017)
s_sum <- filter(s_sum, AGE != "All ages")

df <- merge(x = s_sum, y = d_sum, by.x  = "YEAR", by.y = "Year", all = TRUE)
#export df
write.csv(df, "Clean dataframe.csv")
#PLEASE READ - The data repeats for the ages until it moves onto a new year.
#This is for the last three columns on the df.
#This is the best i can merge it to. If you can clean it up even more great!

# Data Cleaning & Augmentation
#Must create at least one summarization data frame 
  #Note - your summarization table does not need to be exported to a csv file, you just need to have code that create this data frame. 

#Create a new categorical variable

df$Deaths_Category <- ifelse(df$Deaths > median(df$Deaths, na.rm = TRUE), "High", "Low")

#Create a new continuous/numerical variable

df$Deaths_to_Suicide_Ratio <- round(df$Deaths / df$ESTIMATE, 2)




