#eventReactive
output$SelectFactor<- renderUI({
  sampleTable <- load_sampleData()
  factors <- colnames(sampleTable)[-c(1)]
  factors <- c(factors, 1)
  selectInput("SelectFactor","Select factor", factors)
})

formula <- eventReactive(input$SelectFactor,{
  (paste('~',input$SelectFactor))
})

output$summary <- renderText({
  req(formula())
  input$SelectFactor
})
Deseq2_object <- eventReactive(input$action1, {
  withCallingHandlers({ #magic code to run deseq2 and print updates
    shinyjs::html("text", "") #magic code to run deseq2 and print updates
    dds<-DESeqDataSetFromMatrix(countData = load_countMatrix(),
                                colData = load_sampleData(),
                                design = as.formula(formula()))

    dds<- DESeq(dds)
  },
  message = function(m) { 
    shinyjs::html(id = "text", html =paste0(m$message, '<br>'), add = TRUE) #magic code to run deseq2 and print updates
  })
})
#Display dds 
output$Deseq2_object <- renderTable({
  x <- colData(Deseq2_object())
  as_tibble(x)
})