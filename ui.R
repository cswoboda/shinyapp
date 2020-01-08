library(BiocManager)
library(shiny)
library(ggplot2)
library(Seurat)
library(rsconnect)
#define UI

load("data/fivemonth.RData")
load("data/aged.RData")
ui <- fluidPage(
  titlePanel("Millay Lab"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a gene."),
      
      selectInput("var", 
                  label = "Choose a gene to display",
                  choices = c(rownames(fivemonth_soupx)),
                  selected = ""),
      
      
    ),
    
    mainPanel(
      plotOutput("fivemonthmap", height = "400px"),
      plotOutput("twentyfourmap", height = "400px"),
      plotOutput("thirtymap", height = "400px"),
  )
)
)

# Server logic ----
server <- function(input, output) {
  output$fivemonthmap <- renderPlot({VlnPlot(fivemonth_soupx, features = input$var, pt.size = 0) + NoLegend()
  })
  output$twentyfourmap <- renderPlot({VlnPlot(twentyfour_soupx, features = input$var, pt.size = 0) + NoLegend()
  })
  output$thirtymap <- renderPlot({VlnPlot(thirty_soupx, features = input$var, pt.size = 0) + NoLegend()
  })
}

# Run app ----
shinyApp(ui, server)

shinyApp(ui, server)

