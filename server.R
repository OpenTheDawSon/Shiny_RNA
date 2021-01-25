
library(shiny)

server <- function(input, output){
  #Literally just a list of server files corresponding to each ui file we have.
  source("server-inputdata.R",local = TRUE)
  source("server-rundeseq2.R",local = TRUE)
  source("server-sample-clustering.R",local = TRUE)
}
