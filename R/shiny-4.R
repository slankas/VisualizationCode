library(shiny)

# observeEvent
# Used to trigger code that runs on the server

ui <- fluidPage(
  actionButton(inputId = "clicks",
               label = "Click me"),
  textOutput("clickCount")
)
server <- function(input, output) {
  observeEvent(input$clicks, {
    print(as.numeric(input$clicks))
    output$clickCount = renderText(input$clicks)
  })
}
shinyApp(ui = ui, server = server)
