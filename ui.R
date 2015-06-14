library(shiny)

shinyUI(fluidPage(
  titlePanel("Creating WordClouds from User-Specified Text Files"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose Text File for WordCloud',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.txt')),
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 1,  max = 50, value = 15),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 300,  value = 100),
      sliderInput("rot",
                  "Proportion of words Vertically Oriented:",
                  min = 0,  max = 0.5,  value =  0.1),
      radioButtons("pltOrder", "Order in which words are plotted",
                   choices=c("Random" = TRUE,"Decreasing Frequency" = FALSE), 
                   selected = TRUE, inline = FALSE),
      radioButtons("pltColor", "Method for choosing color order",
                   choices=c("Random" = TRUE, "Based on Frequency" = FALSE),
                   selected = TRUE, inline = FALSE),
      checkboxGroupInput("colorSet", "Color Options:",
                         c("Black"        = "black",
                           "Red"          = "red",
                           "Salmon"       = "salmon",
                           "Purple"       = "purple",
                           "Forest Green" = "forestgreen",
                           "Green Yellow" = "greenyellow",
                           "Blue"         = "navyblue",
                           "Azure"        = "azure3",
                           "Rose"         = "rosybrown",
                           "Brown"        = "brown"))
    ),
    mainPanel(
      plotOutput('contents')
    )
  )
))
