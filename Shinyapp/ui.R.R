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
    helpText("Graphical representation of argument by 'Grace et al. (2012) Science 355' that a random bivariate sample from a log-normal dist will appear hump-shaped in linear space"),
    tabsetPanel(
      tabPanel("Plot", plotOutput("lnormBivar")), 
      tabPanel("Summary", verbatimTextOutput("caption")) 
    )
  )
))
