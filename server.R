library(shiny)

data(mtcars)
mpgEstimate <- function(weight, transmission, cyl) {
	pred <- lm(mpg ~ wt + am + cyl, data=mtcars)
	pred$coefficients[1] + (weight/1000*pred$coefficients[2])  + (transmission*pred$coefficients[3]) + (cyl*pred$coefficients[4])
	}

shinyServer(
   function(input, output) {
   output$inputValue1 <- renderPrint({cat(input$weight)})
   trans <- c('Automatic', 'Manual')
   output$inputValue2 <- renderPrint({cat(trans[as.numeric(input$transmission)+1])})
   output$inputValue3 <- renderPrint({cat(as.numeric(input$cyl))})
   output$prediction <- renderPrint({cat(mpgEstimate(input$weight, as.numeric(input$transmission), as.numeric(input$cyl)))})
   }
)
