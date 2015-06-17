library(shiny)
library(tm)
library(wordcloud)

shinyServer(function(input, output) {
  myText <- eventReactive(input$file1$datapath, {
    readLines(input$file1$datapath, n = -1L) 
    })
  
  output$contents <- renderPlot({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    #
    
    if (is.null(input$file1$datapath))
      return(NULL)
    #readLines(input$file1$datapath, n = -1)
    
    wordcloud(myText(),
              min.freq=input$freq, max.words=input$max, 
              rot.per=input$rot, 
              random.order = as.logical(input$pltOrder), 
              random.color = as.logical(input$pltColor),
              colors= input$colorSet )
  })
})