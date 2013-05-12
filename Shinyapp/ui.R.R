library(shiny)

# Define UI for 'Pseudo-Humps'
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Pseudo-Humps"),
  
  sidebarPanel(
    sliderInput("obs", 
                "n:", 
                min = 0, 
                max = 10000, 
                value = 2000),
    
    sliderInput("meanie", 
                "mean:", 
                min = 0, 
                max = 100, 
                value = 15),
    
    sliderInput("seedy", 
                "SD:", 
                min = 0, 
                max = 20, 
                value = 2)
    
    ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("lnormBivar")), 
      tabPanel("Summary", verbatimTextOutput("caption")) 
    )
  )
))
