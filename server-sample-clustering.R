plotPCAEx <- function(object, PCx = 1, PCy = 2, cond="condition", ntop=500, labels = TRUE)
{
  # calculate the variance for each gene
  rv <- rowVars(assay(object))
  
  # select the ntop genes by variance
  select <- order(rv, decreasing=TRUE)[seq_len(min(ntop, length(rv)))]
  
  # perform a PCA on the data in assay(x) for the selected genes
  pca <- prcomp(t(assay(object)[select,]))
  
  # the contribution to the total variance for each component
  percentVar <- pca$sdev^2 / sum( pca$sdev^2 )
  
  if (!all(cond %in% names(colData(object)))) {
    stop("the argument 'intgroup' should specify columns of colData(dds)")
  }
  
  cond.df <- as.data.frame(colData(object)[, cond, drop=FALSE])
  
  # add the intgroup factors together to create a new grouping factor
  group <- if (length(cond) > 1) {
    factor(apply( cond.df, 1, paste, collapse=" : "))
  } else {
    colData(object)[[cond]]
  }
  
  # assembly the data for the plot
  d <- data.frame(PCa=pca$x[,PCx], PCb=pca$x[,PCy], group=group, cond.df, name=colnames(object))
  
  pc1 <- ggplot(data=d, aes_string(x="PCa", y="PCb", color="group")) + geom_point(size=3) + 
    xlab(paste0("PC",PCx,": ",round(percentVar[PCx] * 100),"% variance")) +
    ylab(paste0("PC",PCy,": ",round(percentVar[PCy] * 100),"% variance")) +
    coord_fixed() #+
  #geom_text(show.legend = F)
  
  pc2 <- pc1 + geom_point()
  pc3 <- pc2 # +     theme(legend.position="none")
  
  #  Finally add the labels, using ggrepel so that they dont write over each other or the points  
  if (labels)
  {
    library("ggrepel")
    pc3 + geom_label_repel(aes(label = name),
                           color = "gray20",
                           data = d,
                           force = 10)
  }
  else{
    pc3
  }
}
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
