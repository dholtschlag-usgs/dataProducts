library(shiny)

shinyUI(fluidPage(
  titlePanel("Create Your Own WordCloud to Picture Your Ideas"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Select an ASCII file on your computer for a Word Cloud',
                accept=c('text/csv', 
                         'text/comma-separted-values,text/plain', 
                         '.txt')),
      sliderInput("freq",
                  "Minimum Frequency of Words in Text for Plot:",
                  min = 1,  max = 50, value = 15),
      sliderInput("max",
                  "Maximum Number of Words in Plot:",
                  min = 1,  max = 100,  value = 40),
      sliderInput("rot",
                  "Proportion of Words Vertically Oriented:",
                  min = 0,  max = 0.5,  value =  0.1),
      checkboxGroupInput("colorSet", "Check Boxes to Select Word Colors:",
                         c("Black"        = "black",
                           "Red"          = "red",
                           "Purple"       = "purple",
                           "Orange"       = "orange3",
                           "Forest Green" = "forestgreen",
                           "Pink"         = "pink3",
                           "Green Yellow" = "greenyellow",
                           "Blue"         = "navyblue",
                           "Olive"        = "olivedrab3",
                           "Brown"        = "brown"), inline = TRUE),
      radioButtons("pltOrder", "Order in which words are plotted",
                   choices=c("Random" = TRUE,"Decreasing Frequency" = FALSE), 
                   selected = TRUE, inline = FALSE),
      radioButtons("pltColor", "Method for choosing color order",
                   choices=c("Random" = TRUE, "Based on Frequency" = FALSE),
                   selected = TRUE, inline = FALSE)
    ),
    mainPanel(
      h4("Instructions: A World Cloud is a graphical image of high frequency words in a document.
         Controls to the left enable the user to select a file, and to control key features of the display.
         If you get this message (in red font) after reading a file: 'Error: no applicable method for 'meta' applied to an object of class try-error',
         you have non-readable characters in your file.  If you want to get rid of these in Windows MS Word file, try
         selecting the contents of the Word file by Ctrl-a, Ctrl-c and pasting the results into a Notepad
         document by Ctrl-v.  When you save the Notepad document, 'File > Save As...' specify the 
         filename with a .txt extension, and select 'UTF-8' from the drop down list next to the 
         word 'Encoding,' which is right next to the save button.  Have fun!" ),
      plotOutput('contents')
    )
  )
))
