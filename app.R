library(dplyr)
library(stringr)
library(plotly)
library(ggplot2)
#source("data_cleanup.R")

about_page <- fluidPage(
  h1("ABOUT PAGE", align = "center"),
  p("Suicide has been around for centuries. 
  No matter what the reason is, parents have lost their children, wives have lost their husbands, 
  children have lost their parents, and friends have lost a loved one. But most importantly, 
  the victims have lost their lives. Suicide only has one ending, 
  and it can't be reversed, unlike dying in a game, where one can start over.", align = "center"),
  p("Here, we look at the leading causes of death in the United States and compare them to the death rate for suicide, 
    as well as tracking the rank of suicide over the course of 10 years, from 2007 - 2017.", align = "center"),
  h4("Life is not easy, 
    but it is valuable.", align = "center"),
  h5("Please contact the national suicide hotline, if you or a loved one have suicidal thoughts.", align = "center"),
  h5("988", align = "center")
  
) 

analysis_page <- fluidPage(
  h1("Analysis", align = "center"),
)

ui <-  navbarPage(
  "Suicide Death Rate in the United States",
  tabPanel("Analysis", analysis_page),
  tabPanel("About", about_page),
) 


server <- function(input, output){
  
}

shinyApp(ui = ui, server = server)
