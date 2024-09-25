library(shiny)
library(shinydashboard)
library(shinythemes)

dashboardPage(skin="blue",
              dashboardHeader(title=tags$em("Shiny prediction app"),titleWidth = 805),
              
              dashboardSidebar(width = 255,
                               sidebarMenu(
                                   br(),
                                   menuItem(tags$em("Upload Test Data"),icon=icon("upload"),tabName="data"),
                                   menuItem(tags$em("Get Results"),icon=icon("download"),tabName="download")
                                   
                                   
                               )
              ),
              
              dashboardBody(
                  tabItems(
                      tabItem(tabName="data",
                              
                              
                              br(),
                              br(),
                              br(),
                              br(),
                              tags$h4("With this shiny prediction app, you can upload your data and get back predictions.
                                  The Machine Learning Model Uses Naive Bayes Algorithm to classify text messages as Spam and Ham.
                                      This Application also tell us how our machine learning model has performed", style="font-size:150%"),
                              
                              
                              br(),
                              
                              tags$h4("To predict using this model, upload test data in csv format (you can change the code to read other data types) by using the button below.", style="font-size:150%"),
                              
                              tags$h4("afterwards,move to the", tags$span("Get Results",style="color:green"),
                                      tags$span("to get the predictions."), style="font-size:155%"),
                              
                              br(),
                              br(),
                              br(),
                              column(width = 12,
                                     fileInput('file1', em('Upload test data in csv format '),
                                               accept=c('.csv')),
                                     
                                     uiOutput("sample_input_data_heading"),
                                     tableOutput("sample_input_data"),
                                     
                                     
                                     br(),
                                     br(),
                                     br(),
                                     br()
                              ),
                              br()
                              
                      ),
                      
                      
                      tabItem(tabName="download",
                              fluidRow(
                                  br(),
                                  br(),
                                  br(),
                                  br(),
                                  column(width = 8,
                                         tags$h4("After you upload a test dataset, you can see the number of ham and spam .", 
                                                 style="font-size:201%"),
                                         br(),
                                         br()
                                  )),
                              fluidRow(
                                  
                                  column(width = 7,
                                         
                                         plotOutput('p')
                                  ),
                                  column(width = 4,
                                         uiOutput("sample_prediction_heading"),
                                         tableOutput("s")
                                  )                            
                                  
                              ))
                  )))


