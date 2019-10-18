# Building a column selecter
# https://edwinth.github.io/blog/column-selecter/

library(shiny)
library(miniUI)
library(dplyr)
library(DT)
col_select <- function(df,
                       ret = c("df_select", "dplyr_code"),
                       top_n = 100) {
  ret <- match.arg(ret)
  stopifnot(is.data.frame(df))
  df_head <- head(df, top_n)
  
  ui <- miniPage(
    gadgetTitleBar("Have your pick"),
    miniContentPanel(
      dataTableOutput("selection_df", height = "100%")
    )
  )
  
  server <- function(input, output, session){
    options(DT.options = list(pageLength = 10))
    output$selection_df <- renderDataTable(
      df_head, server = FALSE, selection = list(target = "column")
    )
    observeEvent(input$done, stopApp(  input$selection_df_columns_selected))
  }
  
  cols_selected <- runGadget(ui, server)
  
  if (ret == "df_select") {
    return( df %>% select(cols_selected) )
  } else {
    df_name <- deparse(substitute(df))
    colnames_selected <-  colnames(df)[cols_selected] %>%
      paste(collapse = ", ")
    rstudioapi::insertText(
      paste(df_name, " %>% select(", colnames_selected, ")", sep = "")
    )
  }
}