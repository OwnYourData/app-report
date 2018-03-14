uiBody <- function(ns){
        fluidRow(
                column(4, offset = 4,
                       wellPanel(
                               p(" "),
                               p(uiOutput(ns('ctrlTrnsl_CreateReportInfo'))),
                               div(
                                       actionButton('createReport', 
                                                    uiOutput(ns('ctrlTrnsl_CreateReport')), 
                                                    class="btn btn-lg btn-primary"),
                                       align = "center")
                               )
                )
        )
}