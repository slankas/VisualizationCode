library(shiny)

ui <- fluidPage(
                tags$p("Hello World"),
                tags$a(href = "http://www.rstudio.com", "RStudio"),
                HTML("<p><a href='https://www.r-project.org/'>R</a><p>"),
                "?shiny::tags",
                tags$p(),
                "<a>",
                h1("Header - Level 1")
)
server <- function(input, output) {  
    
}

shinyApp(ui = ui, server = server)
