library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  
  dashboardHeader(title = "2-D Dynamics"),
  
  
    dashboardSidebar(tags$style(".well {background-color:green;}"),
    h4("Two Dimensional Linear Differential Field Values"),
    sliderInput(inputId = "dxdx", label = "dx/dx", min = -2, max = 2, value = -1, step = .1),
    sliderInput(inputId = "dxdy", label = "dx/dy", min = -2, max = 2, value = -1.9, step = .1),
    sliderInput(inputId = "dydx", label = "dy/dx", min = -2, max = 2, value = 1.9, step = .1),
    sliderInput(inputId = "dydy", label = "dy/dy", min = -2, max = 2, value = -1, step = .1),
    hr(),
    h4("Traceing Line Initialization Point"),
    sliderInput(inputId = "Initialx", label = "Initial x value", min = -20, max = 20, value = -5),
    sliderInput(inputId = "Initialy", label = "Initial y value", min = -20, max = 20, value = -2)
  ),
  
  dashboardBody(
    tabsetPanel(
      tabPanel(h2("Documentation"),
               tags$p("This app has two groups of inputs and two outputs charted in the output plot. These can be used to demonstrate dynamic behavior about a fixed point (0,0).",
                      tags$ul(
                        tags$li("The two dimensional linear differential field values set the rate of change of x and y.",
                                "dx/dx is the rate of change of x due to the current value of x.  While dx/dy is the rate of change of x due to the current value of y.",
                                "dy/dx and dy/dy, similarly control the rate of change of y due to the current values of x and y, respectively.",
                                "Together these four values characterize the vector field displayed by the circles in the grid and determine the motion of the example trace in red."),
                        tags$li("The tracing line initialization points set the starting point for the example trace."),
                        tags$li("The local vector field is displayed across the entire plot by the displacement of the open circles from the grid of points in the background.",
                                "Each circle is displaced from its starting grid point by 0.01 of a time step, so the displacement demonstrates both direction and magnitude."),
                        tags$li("The example trace, in red, begins at the crosshair as set by the initialization point inputs and travels for 10 time steps in 0.01 step increments."),
                        tags$li("The initial values; -1, -1.9, 1.9, and -1; establish a stable focus."),
                        tags$li("A stable node can be viewed using the inputs: -1.5, 1, 1, -1.5"),
                        tags$li("A staddle point is demonstrated using the values: 1, 1, 1, -1"),
                        tags$li("Other behaviours can be found using the available field value ranges.")
                        ),
                      tags$a("Dynamics in 2-D presentation",href = "http://rpubs.com/fishysua/Dynamicsin2dpresentation"),
                      tags$br(),
                      tags$a("Dynamics in 2-D github",href = "https://github.com/Fishysua/Dynamicsin2D"),
                      tags$br(),
                      "This is based on ",tags$b("Understanding Nonlinear Dynamics"),": Chapter 5.6 by Kaplan and Glass")),
      tabPanel(h2("Output Plot"),
               plotOutput("dynamicsplot", width = 800, height = 800),
               "Based on ",tags$b("Understanding Nonlinear Dynamics"),": Chapter 5.6 by Kaplan and Glass"
               )
      )
    )
  )
  
