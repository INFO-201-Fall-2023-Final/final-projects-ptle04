library(dplyr)
library(stringr)
library(plotly)
library(ggplot2)
library(fmsb)
source("data_cleanup.R")
source("Heat map code.R")
source("Bubble chart code.R")

df <- read.csv("Clean dataframe.csv")

about_page <- fluidPage(
  h1("ABOUT PAGE", align = "center"),
  p("Suicide has been around for centuries. 
  No matter what the reason is, parents have lost their children, spouses have lost their life long partner, 
  children have lost their parents, and friends have lost a loved one. But most importantly, 
  the victims have lost their lives. Suicide only has one ending, 
  and it can't be reversed, unlike dying in a game, where one can start over.", align = "center"),
  p("Here, we look at the leading causes of death in the United States and compare them to the death rate for suicide, 
    as well as tracking the rank of suicide over the course of 10 years, from 2007 - 2017. In addition, the purpose of this website is to bring awareness to everyone,
    with the hope to minimize the suicide rate.", align = "center"),
  h4("Life is not easy, 
    but it is valuable.", align = "center"),
  h5("Please contact the national suicide hotline, if you or a loved one have suicidal thoughts.", align = "center"),
  h5("988", align = "center")
  
) 

analysis_page1 <- fluidPage(
  h1("National Death vs Suicide", align = "center"),
  
  h3("Cause of Deaths rankings in the US"),
  plotOutput(outputId = "bar"),
  
  p("In the United States there are various reasons why people die every year, and suicide is one of the causes. Here on the bar chart
    we can see where suicide ranks on the list for leading cause of death in the Unites States over the course of 10 years from 2007 - 2017."),
  
  h3("Difference in death between Cause of Deaths and Suicide"),
  plotOutput(outputId = "difference"),
  p("Suicide is one of the many causes of Death in the United States. Even though it is not ranked as high as the other leading factors, it is still
  growing in size everyday and should not be overlooked. Here we can see the differences in deaths between the other leading causes
    of death and suicide. If we continue to ignore the signs in front of us, one day suicide will overtake
    the other factors, and become the leading cause of death in the United States."),
  br(),
  br(),
  h1("Suicide over the years", align = "center"),
 tabsetPanel(
             tabPanel("Description",textOutput(outputId = "table")),
             tabPanel("Plot", h3("Suicide over the years"),plotOutput(outputId = "area"))
                  ),
                
                

h3("Total Number of Suicides Each Year (2007-2017)"),
plotOutput(outputId = "bubble"),
p("Throughout the 10 year span, we can see that the slope for suicide deaths has a linear increase. As each year go by the numbers
  continue to grow, as more and more people struggle to get the help that they need. Although the data ends at 2017, the numbers continue to grow as the 
  years go by. The more that the issue is ignored and the less help that people in need are getting, the faster these numbers will grow. Soon this linear slope may grow at
  a even steeper rate then it is in the graph.")
)


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
  output$bubble <- renderPlot({
    plot(bubble)
  })
  output$bar <- renderPlot({
    plot(bar_rank)
  })
  output$difference <- renderPlot({
    plot(lolli)
  })
  output$area <- renderPlot({
    plot(area)
   
  })
  output$table <- renderText({
    paste("The death rate for suicide changes every year. 
      The change in suicide death rates spans from 2007-2017. From the graph we can see that the suicide death count is rising and falling
        over the years. However, it is still constantly growing. Although the rates may not seem as significant as the other causes of death,
          leaving it unattended can result in unreverable events. Click on Plots to see the graph.")
   
  })
}

shinyApp(ui = ui, server = server)
