library(shiny)
library(ggplot2)
ui <- fluidPage(
          sliderInput(inputId = "num", label = "Choose a number", 
                      value = 25, min = 1, max = 100),      					
          plotOutput("hist"))
server <- function(input, output) {  
  output$hist <- renderPlot({ ggplot(NULL, aes(x=rnorm(input$num))) + geom_histogram(bins=20)  })
}

shinyApp(ui = ui, server = server)

