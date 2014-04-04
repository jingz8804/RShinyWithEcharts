
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(RJSONIO)

source("optSetUtils.R")
source("utils.R")

shinyServer(function(input, output, session) {
  output$selected <- renderText({
    paste("You have selected", input$dataID)
  })
  
  options <- reactive({
    if(input$dataID == "DataSet 1"){
      title <- 'Test 1'
      subtitle <- 'A Test'
      title.x = "center"
      title.y = "top"
      
      tooltip <- T
      tooltip.trigger <- 'item'
      formatter <- "{a} <br/>{b} : {c} ({d}%)"
      
      legend <- T
      legend.orient <- 'vertical'
      legend.x <- 'left'
      legend.y = "top"
      legend.data <- c('S1','S2','S3','S4','S5')
      
      toolbox <- T
      hasMark <- T
      
      
      toolbox.x = "right"
      toolbox.y = "top"
      toolbox.orient = "horizontal"
      dataView = TRUE
      readOnly = FALSE
      mark = TRUE
      dataZoom = FALSE
      magicType = TRUE
      
      calculable <- T
      pie.data <- data.frame(name=c('S1', 'S2', 'S3', 'S4', 'S5'), 
                             value=c(335, 310, 234, 135, 1548))
      data.name <- 'Source'
    }else{
      title <- 'Test Graph'
      subtitle <- 'Just for test'
      title.x = "center"
      title.y = "top"
      
      tooltip <- T
      tooltip.trigger <- 'item'
      formatter <- "{a} <br/>{b} : {c} ({d}%)"
      
      legend <- T
      legend.orient <- 'vertical'
      legend.x <- 'left'
      legend.y = "top"
      legend.data <- c('S1','S2')
      
      toolbox <- T
      hasMark <- T
      toolbox.x = "right"
      toolbox.y = "top"
      toolbox.orient = "horizontal"
      dataView = TRUE
      readOnly = FALSE
      mark = TRUE
      dataZoom = FALSE
      magicType = TRUE
      
      calculable <- T
      pie.data <- data.frame(name=c('S1', 'S2'), value=c(123, 234))
      
      data.name <- "Hello"
    }
    opt <- list()
    opt$title = tilteSet(title = title, subtitle = subtitle, 
                         title.x = title.x, title.y = title.y)
    opt$calculable = calculableSet(calculable = calculable)
    opt$tooltip = tooltipSet(tooltip = tooltip, trigger = tooltip.trigger, 
                             formatter = formatter, islandFormatter = "")
    opt$toolbox = list(show=T, feature=list(
        mark=list(show=T),
        dataView=list(show=T,readOnly=F),
        restore=list(show=T),
        saveAsImage=list(show=T)
      ))
#     opt$toolbox = toolboxSet(toolbox = toolbox, toolbox.x = toolbox.x, 
#                              toolbox.y = toolbox.y, orient = toolbox.orient, dataView = dataView, 
#                              mark = mark, dataZoom = dataZoom, magicType = magicType, 
#                              restore = TRUE, readOnly = readOnly, saveAsImage = TRUE)
    opt$legend = legendSet(legend = legend, data = legend.data, 
                           legend.x = legend.x, legend.y = legend.y, orient = legend.orient)
    dataList = split(pie.data, 1:dim(pie.data)[1])
    names(dataList) = NULL
    opt$series = list(list(name = data.name, type = 'pie', 
                           radius = '55%', center = c("50%", 200), data = dataList))
    return(toJSON(opt, pretty=T))
  })
  
  observe({
    input$dataID # it seems that when the app runs the first time, the input always changes.
    session$sendCustomMessage(type = "testHandler", options())
  })
})
