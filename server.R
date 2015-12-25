library(shiny)


source("mtcars.R")

shinyServer(
    function(input, output) {
        h <- reactive(input$hp)
        output$mpg <- renderText({
            predict(bestfit, 
                    newdata = list(am=input$trans, hp=input$hp, wt=input$wt))} )
        output$t <- reactive(if(input$trans==1) "Manual" else "Auto")
        output$h <- h
        output$w <- renderText(input$wt * 1000)
        output$coef <- renderPrint({summary(bestfit)$coef})
    }
)