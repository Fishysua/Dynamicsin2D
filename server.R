library(shiny)

shinyServer(function(input, output) {
  
  #Establish the Grid Base
  SetupVector<- seq(-20,20, 41/20)
  BaseGrid <- expand.grid(SetupVector,SetupVector)
  names(BaseGrid) <- c("x","y")
  
  FlowGrid <- reactive({
    BaseGrid + .01*c(input$dxdx*BaseGrid$x+input$dxdy*BaseGrid$y,input$dydx*BaseGrid$x+input$dydy*BaseGrid$y)
    })
  
  #Trace Path
  lengthpath = 1000
  tracepath <- data.frame(x = 1:lengthpath, y = 1:lengthpath)
  tracepathdata <- reactive({
    tracepath[1,] <- c(input$Initialx,input$Initialy)
    A <- input$dxdx
    B <- input$dxdy
    C <- input$dydx
    D <- input$dydy
    for (i in 2: lengthpath) {
      tracepath[i,] <- tracepath[i-1,] + .01 * c(A*tracepath[i-1,1]+B*tracepath[i-1,2],C*tracepath[i-1,1]+D*tracepath[i-1,2])
    }
    tracepath
  })
  
  par(pin = c(8,8))
  output$dynamicsplot <- renderPlot({
    plot(BaseGrid, cex = .5, pch = 16, axes = FALSE)
    points(FlowGrid(), cex = 1)
    points(input$Initialx,input$Initialy, pch = 13, cex = 3, col = "red")
    lines(tracepathdata(), col = "red")
    })
})