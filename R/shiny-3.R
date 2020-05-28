library(shiny)

# isolate
# Allows us to read input data from the web page,
# without it constantly creating events

ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  textInput(inputId = "title",
            label = "Write a title",
            value = "Histogram of Random Normal Values"),
  plotOutput("hist")
)
server <- function(input, output) {
  #output$hist <- renderPlot({  hist(rnorm(input$num), main = input$title) } )
  output$hist <- renderPlot({ hist(rnorm(input$num), main = isolate({input$title}))})
}

shinyApp(ui = ui, server = server)