library(dplyr)
library(stringr)
library(plotly)
library(ggplot2)
library(fmsb)
source("data_cleanup.R")
#source()
#source()

df <- read.csv("Clean dataframe.csv")

about_page <- fluidPage(
  h1("ABOUT PAGE", align = "center"),
  p("Suicide has been around for centuries. 
  No matter what the reason is, parents have lost their children, spouses have lost their life long partner, 
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

analysis_page1 <- fluidPage(
  h1("National death vs Suicide", align = "center"),
  br(),
  br(),
  h1("Suicide over the years", align = "center"),
  sidebarLayout(position = "left",
                sidebarPanel(
                  selectInput(
                    inputId = "year",
                    label = "Choose a Year",
                    choices = df$YEAR 
                  )
                ),
                mainPanel(
                  h5("The number of death due to suicide changes every year. Select a year and see how difference between the years."),
                  tabsetPanel(
                    tabPanel("Plot", h3("Suicide over time"),plotOutput(outputId = "graph")),
                    tabPanel("Table", tableOutput(outputId = "table"))
                  )
                )
))


ui <-  navbarPage(
  "Suicide Death Rate in the United States",
  tabPanel("Analysis", analysis_page1),
  tabPanel("About", about_page),
  
)



server <- function(input, output){
  make_graph_tb <- function(year, cause){
    data_pt <- filter(df, YEAR == year)
    data_pt <- select(data_pt, -c(YEAR, INDICATOR))
    
    
  }
  output$table <- renderTable({
    
    return(make_graph_tb(input$year))
    
  })
}

shinyApp(ui = ui, server = server)
