# Interactively renaming columns in Rshiny
# https://stackoverflow.com/questions/46028662/interactively-renaming-columns-in-rshiny/46028842#46028842

library(shiny)
library(DT)

mtcars
write.csv(mtcars, "mtcars.csv", row.names = T)
ui <- shinyUI(fluidPage(
  title = "Rename Column",
  sidebarLayout(
    sidebarPanel(
      numericInput("Cylinder","Enter Cylinder", 8, min = 4, max = 12),
      actionButton("process", "Filter Data", style = "color: #fff; background-color: FORESTGREEN; border-color: #2e6da4"),
      tags$br(),tags$br(),
      selectInput(inputId = "OldColumnName", label = "Select Column Name to rename",multiple = F, choices = c("Nil"), selected = ""),
      textInput(inputId = "NewColumnName", label = "Enter New Column Name", "Nil"),
      actionButton("RenameColumn", "Rename Column",style = "color: #fff; background-color: MAROON; border-color: #2e6da4"),
      width = 3),
    
    mainPanel(wellPanel(
      tabsetPanel(type = "pills",  tabPanel("Data Table", 
                                            DT::dataTableOutput("ResultsTable", width = "auto", height = "auto"),
                                            style = "overflow-y:scroll; max-height: 900px")
      ))) 
  )))



server <- function(input,session, output){session$onSessionEnded(stopApp)
  
  store <- reactiveValues()
  store$df <- mtcars
  
  observeEvent(input$process, { 
    df <- data.frame(read.csv("mtcars.csv", header = T) )
    store$df <- df[df$cyl == input$Cylinder,]
  })
  
  observeEvent(store$df, {
    updateSelectInput(session, "OldColumnName", choices = colnames(store$df),
                      selected = NULL)
  })
  
  observeEvent(input$RenameColumn, {
    req(input$NewColumnName, input$OldColumnName)
    if (input$NewColumnName != "Nil") {
      colnames(store$df)[colnames(store$df) == input$OldColumnName] <- 
        input$NewColumnName
    }
  })
  
  output$ResultsTable <- DT::renderDataTable({ 
    req(store$df)
    DT::datatable(store$df)
  })
}





shinyApp(ui = ui, server = server)