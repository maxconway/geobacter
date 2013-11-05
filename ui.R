require(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Pareto Front Explorer"),
  
  sidebarPanel(
    selectInput(inputId = 'dataset', 
                label = 'Dataset:', 
                choices = list(
                  'G. Sulfurreducens' = '1216065400',
                  'G. Metallireducens' = '1348023600'
                )
    )
  ),
  
  mainPanel(
    h3('Pareto Front'),
    selectInput(inputId = 'xAxis',
                label = 'x-Axis:',
                choices = list(
                  'biomass (normalized)' = 'nbiomass',
                  'synthesis upper limit (normalized)' = 'nmaxsyn',
                  'ynthesis lower limit (normalized)' = 'nminsyn'
                )
    ),
    selectInput(inputId = 'yAxis',
                label = 'y-Axis:',
                choices = list(
                  'biomass (normalized)' = 'nbiomass',
                  'synthesis upper limit (normalized)' = 'nmaxsyn',
                  'ynthesis lower limit (normalized)' = 'nminsyn'
                )
    ),
    plotOutput('pfrontPlot'),
    
    h3('Heatmap'),
    plotOutput('heatmap'),
    
    h3("Outliers"),
    sliderInput("sdLimits", "Standard Deviation Limits:",
                min = -5, max = 5, value = c(-2,2), step = 0.1
    ),
    plotOutput('outliersPlot')
  )
))