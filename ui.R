library(shiny)

shinyUI(fluidPage(
  titlePanel("Creating WordClouds from User-Specified Text Files"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose an ASCII text file from which to create a Word Cloud',
                accept=c('text/csv', 
                         'text/comma-separted-values,text/plain', 
                         '.txt')),
      sliderInput("freq",
                  "Minimum Frequency of Words in Text for Plot:",
                  min = 1,  max = 50, value = 15),
      sliderInput("max",
                  "Maximum Number of Words in Plot:",
                  min = 1,  max = 300,  value = 100),
      sliderInput("rot",
                  "Proportion of Words Vertically Oriented:",
                  min = 0,  max = 0.5,  value =  0.1),
      radioButtons("pltOrder", "Order in which words are plotted",
                   choices=c("Random" = TRUE,"Decreasing Frequency" = FALSE), 
                   selected = TRUE, inline = FALSE),
      radioButtons("pltColor", "Method for choosing color order",
                   choices=c("Random" = TRUE, "Based on Frequency" = FALSE),
                   selected = TRUE, inline = FALSE),
      h4("Check boxes below to include colors in word plot"),
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
      h4("Instructions: A World Cloud is a graphical image of high frequency words in a document.
         Controls to the left enable the user to select a file, and to control key features of the display."),
      plotOutput('contents')
    )
  )
))
