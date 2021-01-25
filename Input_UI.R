tabItem(tabName = "Input",
          
          fluidRow(column(4, #fluidRow has a total width of 12, so column(4, etc...) assigns 4/12 of the width to this file input button
                          fileInput("sampleTable", "Select sampleTable")
                          #actionButton("action", "Display SampleTable")
                          #fileInput("countfile", "Select your count matrix")
      ),
      column(8, #the rest of the page is given to displaying the table
             tableOutput("sampleTable")
    )
    ),
  fluidRow(column(4, 
                  fileInput("countMatrix", "Select count matrix")
  )
  #column(8, 
  #      tableOutput("count_matrix")
  )
  )
