require(shiny)
require(ggplot2)
require(grid)

load(file = './serverdata.RData',verbose=TRUE)

shinyServer(function(input, output) {
  
  output$outliersPlot <- renderPlot({
    outlyingGenes(chromosomes[[input$dataset]],input$sdLimits[1],input$sdLimits[2])
  })
  
  output$pfrontPlot <- renderPlot({
    plot(ggplot(chromosomes[[input$dataset]], aes_string(x=input$xAxis,y=input$yAxis,color='strain')) +
           geom_point()
    )
  })
  
  output$heatmap <- renderPlot({
    heatmapify(chromosomes[[input$dataset]])
  })
  
})