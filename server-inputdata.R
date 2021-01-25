#myData() will load the sampleTable containing metadata
load_sampleData <- reactive({
  filePath <- input$sampleTable$datapath
  #req(filePath) forces the read.table() to wait until we have created a filePath.
  #This filepath is defined when the user clicks on the choose sampleTable file button
  req(filePath)
  table <- read.table(filePath,
                      header=TRUE)
  print(table)
})

#Prints out the table when loaded
output$sampleTable <- renderTable({
  x <- load_sampleData()
  as_tibble(x)
})

load_countMatrix <- reactive({
  filePath <- input$countMatrix$datapath
  #req(filePath) forces the read.table() to wait until we have created a filePath.
  #This filepath is defined when the user clicks on the choose sampleTable file button
  req(filePath)
  table <- read.table(filePath,
                      header=TRUE,row.names = 1)

  print(table)
})