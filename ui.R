
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(fluidPage(
  tags$head(
    tags$script(src="js/echarts-plain-map.js"),
    tags$script(src="js/main.js")
  ),
  sidebarLayout(
    sidebarPanel(
      selectInput("dataID", "Select Data Set", 
                  choices=c("DataSet 1", "DataSet 2")),
      textOutput("selected")
    ),
    mainPanel(
      div(id="main", style="height:500px;border:1px solid #ccc;padding:10px;"),
      div(id="mainMap",style="height:500px;border:1px solid #ccc;padding:10px;"),
      helpText("Weird!")
    )
  )
))
