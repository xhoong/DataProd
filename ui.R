library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("MPG analysis based on MTCARS data"),
    sidebarPanel(
        radioButtons("trans", "Transmission Type:", 
                     c("Auto" = 0, "Manual" = 1), selected = 0),
        sliderInput("hp", "Vehicle horsepower:", 50, 200, mean(mtcars$hp), step=10),
        numericInput("wt", "Vehicle Weight (in 1000 lbs):", 1, min=1, max=100),
        p("INSTRUCTION: The application use linear regression shown in the formula to predict the CAR miles per gallon, enter 3 parameters"),
        p("Transmission type, Car horsepower and weight in x1000lb."),
        p("The predicted result is shown in main panel under Predicted MPG")
        
    ),
    mainPanel(
        h3('Regression model formula:'),
        withMathJax('$$MPG = \\beta_0 + \\beta_{1}AM + \\beta_{2}HP + \\beta_{3}WT + \\epsilon$$'),
        h4("Horsepower:"), 
        verbatimTextOutput("h"), h4(" Transmission:"),
        verbatimTextOutput("t"), h4(" Weight (lb):"),
        verbatimTextOutput("w"), h4(" Predicted MPG:"),
        verbatimTextOutput("mpg"), h4(" Regression model Coefficient:"),
        verbatimTextOutput("coef")
    )
))
