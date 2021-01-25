

library(shiny)
library(shinydashboard)
library("dashboardthemes")
library("DESeq2")
library("pheatmap")
library("reshape2")
library("VennDiagram")
library("ggplot2")
library("ggrepel")
library("data.table")
library("grid")
library("gridExtra")
library("RColorBrewer")
library("tidyr")
library(EnhancedVolcano)
library(shiny)
library(shinythemes)


ui <- dashboardPage(
  #Using a dashboard for this shiny app as it looks fairly straightforward to shove things together
  #The dashboard consists of the header, sidebar and body.
  
  dashboardHeader(title = "Version 0 shiny app"),
  dashboardSidebar(
    sidebarMenu(
      
      # List of the modules we will have for the app
      # Each of the 'tabName=' should correspond to the name to the 'tabName' in the tabItems()
      
      menuItem("Input", tabName = "Input", icon = icon("Input")),
      menuItem("Initialse_DESeq2", tabName = "Initialse_DESeq2", icon = icon("th")),
      menuItem("Sample_Clustering", tabName = "Sample_Clustering", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      
      # Each source() command points to an R script containing code for the UI of a tab
      # Don't ask me why there is $value on the end of the source(), at the moment I know it will break without it
      
      source("Input_UI.R",local = TRUE)$value,
      source("Initialise_DESeq2_UI.R",local = TRUE)$value,
      source("UI_sample_clustering.R",local = TRUE)$value
      

      )
      
    
  )
)
      
      #source("Input_UI.R",local = TRUE)$value,
      #source("Initialise_DESeq2_UI.R",local = TRUE)$value
