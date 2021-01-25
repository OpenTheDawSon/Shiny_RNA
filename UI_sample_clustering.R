tabItem(tabName="Sample_Clustering",
         numericInput("PcA", "Breaks",1, min=1, max=8),
         numericInput("PcB", "Breaks",2, min=1,max=8),
         textInput("Factor", "factor", placeholder = "Factor"),
         tableOutput("vst"),
         plotOutput("PCA"))