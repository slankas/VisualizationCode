library(shiny)

# As we cannot assign to the input "data",
# we can create another variable  that can be manipulated
# programmitically

ui <- fluidPage(
  actionButton(inputId = "norm", label = "Normal"),
  actionButton(inputId = "unif", label = "Uniform"),
  plotOutput("hist")
)
server <- function(input, output) {
  rv <- reactiveValues(data = rnorm(1000))
  observeEvent(input$norm, { rv$data <- rnorm(1000) })
  observeEvent(input$unif, { rv$data <- runif(1000) })
  output$hist <- renderPlot({
    ggplot(NULL, aes(x=rv$data)) + geom_histogram()
  })
}
shinyApp(ui = ui, server = server)