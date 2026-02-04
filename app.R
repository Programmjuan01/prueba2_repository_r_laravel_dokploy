library(shiny)

ui <- fluidPage(
  titlePanel("Mi App Shiny en Dokploy"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", 
                  "Número de observaciones:",
                  min = 10,
                  max = 500,
                  value = 100)
    ),
    
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs), 
         col = '#EE0000',  # Rojo Claro
         border = 'white',
         main = "Histograma de distribución normal",
         xlab = "Valores")
  })
}

shinyApp(ui = ui, server = server, options = list(host = "0.0.0.0", port = 3838))