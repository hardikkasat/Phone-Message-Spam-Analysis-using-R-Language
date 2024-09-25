library(tm)
library(shiny)
library(ggplot2)
library(e1071)
library(caTools)


load("NaiveBayesClassifier.rda")
source("text_mining.R")

shinyServer(function(input, output) {
  
  options(shiny.maxRequestSize = 805*1025^2) 
  
  output$sample_input_data_heading = renderUI({  
    inFile <- input$file1
    
    if (is.null(inFile)){
      return(NULL)
    }else{
      tags$h4('Sample of data')
    }
  })
  output$sample_input_data = renderTable({   
    inFile <- input$file1
    
    if (is.null(inFile)){
      return(NULL)
    }else{
      input_data =read.csv(input$file1$datapath)
      input_data=input_data[,c(1,2)]
      text$v1=factor(text$v1)
      str(text$v1)
      head(input_data)
    }
  })
  predictions<-reactive({
    
    inFile <- input$file1
    
    if (is.null(inFile)){
      return(NULL)
    }else{
      withProgress(message = 'Machine is processing the results please wait', {
        input_data =read.csv(input$file1$datapath)
        input_data=input_data[,c(1,2)]
        input_data$v1=factor(input_data$v1)
        str(input_data$v1)
        check=text_mining(input_data)
        library(caTools)
        set.seed(123)
        spl <- sample.split(check$spam, 0.7)
        test1 <- subset(check,spl==FALSE)
        sms_pred <- predict(sms_classifier,test1)
        return(sms_pred)
        
        
      })
    }
  })
  output$sample_prediction_heading = renderUI({  
    inFile <- input$file1
    
    if (is.null(inFile)){
      return(NULL)
    }else{
      tags$h4('Number of Ham and Then Spam')
    }
  })
  output$s = renderTable({  
    pred = predictions()
    summary(pred)
    
  })
  output$p = renderPlot({ 
    sms_pred=factor(predictions())
    plot(sms_pred)
  })
  
  
})