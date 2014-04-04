
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

pie.data <- data.frame(name=c('S1', 'S2'), value=c(123, 234))
dataList = split(pie.data, 1:dim(pie.data)[1])
names(dataList) = NULL
opt <- list()
opt$series = list(list(name = "Hello", type = 'pie', 
                       radius = '55%', center = c("50%", 200), data = dataList))


shinyServer(function(input, output, session) {
  output$selected <- renderText({
    paste("You have selected", input$dataID)
  })
  
  observe({
    input$dataID # it seems that when the app runs the first time, the input always changes.
    session$sendCustomMessage(type = "testHandler", toJSON(opt, pretty=T))
  })
})
