#Increase size of upload files to 500 Mo
options(shiny.maxRequestSize=500*1024^2)
options(warn=-1)

if (!require("shiny"))
  install.packages("shiny")  

if (!require("plotly"))
  install.packages('plotly')

if (!require("shinycssloaders"))
  install.packages('shinycssloaders')
  
if (!require("shinythemes"))
  install.packages('shinythemes')

library(shiny)
library(plotly)
library(shinycssloaders)
library(shinythemes)

server = shinyServer(function(input, output) {
  output$plot <- renderPlotly({
    req(input$File)
    Y = read.table(input$File$datapath, header = TRUE)
    print(Y)
    print(colnames(Y))
    label = Y$label
    Y$label = NULL
    
    # Load the data
    #Y <- readRDS("mnist-results.rds")
    #label = Y$label
    #Y$label = NULL
    # Layout configuration
    m <- list(
      l = 0,
      r = 0,
      b = 0,
      t = 0,
      pad = 0
    )
    # Axis configuration
    ax <- list(
      title = "",
      zeroline = FALSE,
      showline = FALSE,
      showticklabels = FALSE,
      showgrid = FALSE,
      showspikes = FALSE
    )
    # Legend configuration
    l <- list(
      x = 1,
      y = 0.5,
      font = list(
        family = "sans-serif",
        size = 20,
        color = "#FFFFFF"
      ),
      bgcolor = "#060606",
      bordercolor = "#060606"
    )
    
    plot_ly(type="scatter3d", x = Y[,1], y = Y[,2], z = Y[,3], color = as.factor(label),
            marker = list(size = 3, opacity=0.8), hoverinfo="none",
            width=800,  height = 800, mode="markers") %>%
      config(displayModeBar = F)  %>%
      layout(scene = list(xaxis=ax,yaxis=ax,zaxis=ax),
             paper_bgcolor="#060606",
             plot_bgcolor= "#060606",
             legend = l
      )
  })
})
