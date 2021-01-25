tabItem(tabName = "Initialse_DESeq2",
        h2("Sup brah"),
        fluidRow(uiOutput("SelectFactor")),
        fluidRow(textOutput("summary")),
        fluidRow(column(12,
                       actionButton("action1", "Initiate Deseq2"),
                       span(textOutput("text"), style="color:red"),
                        tableOutput("Deseq2_object")
        )
        )
)
