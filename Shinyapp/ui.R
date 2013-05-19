library(shiny)
library(quantreg)

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
    helpText("Pseudo-Humps is an interactive visualization of the hump-shaped appearance of a 
             bivariate plot of two random lognormal distributions in linear space (inspired by",  
             a(href="http://www.sciencemag.org/content/335/6075/1441.3.full.html", target="_blank", 
             "Grace et al. (2012)"),"Response to Comments on 'Productivity Is a Poor Predictor of Plant 
             Species Richness'. Science, 335 (6075),  p1441. See the Info tab for more...um...info. Put together by", 
             a(href="http://www.andrewletten.wordpress.com", target="_blank", "Andrew Letten"), "using", 
             a(href="http://www.rstudio.com/shiny/", target="_blank", "Shiny!")),
    
    tabsetPanel(
      tabPanel("Plot", plotOutput("lnormBivar")), 
      tabPanel("Summary", verbatimTextOutput("caption")),
      tabPanel("Info", helpText("The purpose of Pseudo-Humps is to illustrate the humped appearance of a plot 
                                of two random log-normal distributions in linear space. Toggle the values of n, 
                                the mean and sd to generate different random bivariate plots.  
                                As revealed by a quadratic linear (and quantile) regression, the apparent humps 
                                are no more than illusions (at least most of the time!).",
                                HTML("<br><br>"),
                                "Why?",
                                HTML("<br><br>"),
                                "Because this issue was pointed out in a response (Grace et al. 2012) to a 
                                commentary (Fridely et al. 2012) on a paper on the productivity-richness relationship 
                                (Adler et al. 2011)...and I was curious...and Shiny is fun. Code available as a GitHub", a(href="https://gist.github.com/enterthesloth/5597245", target="_blank", "gist."),
                                HTML("<br><br>"),
                                "Refs",
                                HTML("<br><br>"),
                                "Adler, P.B., Seabloom, E.W., Borer, E.T., Hillebrand, H., Hautier, Y., Hector, 
                                A., et al. (2011). Productivity Is a Poor Predictor of Plant Species Richness. 
                                Science, 333, 1750-1753.",
                                HTML("<br>"),
                                "Fridley, J.D., Grime, J.P., Huston, M.A., Pierce, S., Smart, S.M., Thompson, K., et al. 
                                (2012). Comment on 'Productivity is a poor predictor of plant species richness'. Science, 
                                335, 1441.",
                                HTML("<br>"),
                                "Grace, J.B., Adler, P.B., Seabloom, E.W., Borer, E.T., Hillebrand, H., Hautier, Y., et al. 
                                (2012). Response to Comments on 'Productivity Is a Poor Predictor of Plant Species 
                                Richness'. Science, 335, 1441."))
    )
  )
))
