library(shiny)
shinyUI(pageWithSidebar(
   headerPanel("MPG Calculator"),
   sidebarPanel(
   	  numericInput('weight', 'Weight (lb)', 3000, min = 1500, max = 6000, step = 250),
   	  radioButtons('transmission', 'Transmission type:',
             c('Automatic' = 0,
               'Manual' = 1)),
   	  radioButtons('cyl', 'Number of cylinders:',
             c('4' = 4,
               '6' = 6,
               '8' = 8)),
   	  submitButton('Calculate')
   ),
   mainPanel(
      h3('Results of prediction'),
      h4('A car with a weight of (lb):'),
      verbatimTextOutput("inputValue1"),
      h4('and a transmission of type:'),
      verbatimTextOutput('inputValue2'),
      h4('and a cylinder count of:'),
      verbatimTextOutput('inputValue3'),
      h4('will offer a mileage of (mpg):'),
      verbatimTextOutput("prediction")
   )
))