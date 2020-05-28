library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 1000),
  plotOutput("hist"),
  verbatimTextOutput("stats")
)
server <- function(input, output) {
  data <- reactive({
    rnorm(input$num)
  })
  output$hist <- renderPlot({
    ggplot(NULL, aes(x=data())) + geom_histogram()
  })
  output$stats <- renderPrint({
    summary(data())
  })
}
shinyApp(ui = ui, server = server)