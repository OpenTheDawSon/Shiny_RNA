PcA <- reactive({
  PcA <- input$PcA
  print(PcA)
})
PcB <- reactive({
  PcB <- input$PcB
  print(PcB)
})
Factor <- reactive({
  PcB <- input$Factor
  print(PcB)
})
output$vst <- renderTable({
  vst <- vst(Deseq2_object())
  as_tibble(colData(vst))
})
output$PCA <- renderPlot({
  vst <- vst(Deseq2_object())
  req(Factor())
  plotPCAEx(object = vst, PCx = PcA(), PCy= PcB(),cond = Factor())
})