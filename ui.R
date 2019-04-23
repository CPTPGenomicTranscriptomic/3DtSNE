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

ui = fluidPage(
  br(),
  tags$head(
    tags$style(".title {margin: auto; width: 800px; font-size-adjust: 1.3}")
  ),
  tags$div(class="title", titlePanel("3D tSNE")),
  br(),
  headerPanel(
    list(HTML('<img src="Logo_cptp.png"/>'), HTML('<a href="https://www.cptp.inserm.fr/en/technical-platforms/genomic-and-transcriptomic/">Genomic and transcriptomic platform</a>'), HTML('<img src="Logo_inserm.png"/>')),
    windowTitle="My Title"
  ),
  br(),
  sidebarLayout(
    sidebarPanel(
      h3("Please choose your input file:"),
      wellPanel(
        fileInput(inputId = "File", label = "Select input file", accept = ".txt"),
        print("The file should contain a header and clustering labels (having the name \"label\" (txt tabulation format)).")
      )
    ),
    mainPanel(
      navbarPage("t-SNE Visualization of Data",
      theme = shinythemes::shinytheme("cyborg"),
      tabPanel("3D Explorer", withSpinner(plotlyOutput("plot"), color = "#808080"))
      )
    )
  )
)
