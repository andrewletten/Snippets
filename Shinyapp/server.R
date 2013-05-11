library(shiny)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    
    # generate an rnorm distribution and plot it
    dist <- rlnorm(input$obs, meanlog = log(input$meanie), sdlog = log(input$seedy))
    dist2 <- rlnorm(input$obs, meanlog = log(input$meanie), sdlog = log(input$seedy))
    normtest = data.frame(dist, dist2)
    colnames(normtest) = c("var1", "var2")
    
    plot(var1~var2, data = normtest, xlim = c(0,200), ylim = c(0,200))
    modtest = lm(var1 ~ poly(var2, 2), data = normtest)
    I1 = order(normtest$var2)
    lines(normtest$var2[I1], modtest$fit[I1], lty = 1)
    
    #quantile regression (95th percentile)
    modtestrq = rq(var1 ~ poly(var2, 2), data = normtest, tau = 0.95)
    lines(normtest$var2[I1], modtestrq$fit[I1], lty = 2)
    
  })
})



?rlnorm