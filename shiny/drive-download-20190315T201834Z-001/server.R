#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
library(shiny)
library(tidyverse)
library(readr)
library(psych)
library(funModeling)
library(ggpubr)
library(GGally)
library(grDevices)
library(stats)
library(vcd)
library(car)
library(PerformanceAnalytics)
library(caret)
library(AppliedPredictiveModeling)
library(pls) #kismi en kucuk kareler ve pcr icin
library(elasticnet)
library(broom) #tidy model icin
library(glmnet)
library(MASS)
library(ISLR)
library(Matrix) 
library(kernlab) #svm
library(e1071) #svm icin
library(rpart) #cart icin
library(pgmm) #olive data seti icin 
library(dslabs)
library(rpart.plot) #rpart gorsel icin
library(partykit) #karar agaci gorseli icin 
library(ipred) #bagging icin 
library(randomForest)
library(gbm)
library(nnet)
library(neuralnet)
library(NeuralNetTools) #garson fonksiyonu icin
library(FNN)
library(xgboost)
library(cluster)
library(factoextra)
library(rsconnect)
library(agricolae)
library(mlbench)
library(shinythemes)
library(timeSeries)
library(forecast)
library(WDI)
library(tseries)
library(lmtest)
library(vars)
library(cli)

options(scipen = 999, digit=4)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$dv = renderUI({
    selectInput('dv', h5('Bagimli Degisken'), choices = names(d()), selected = names(d()))
  })
  
  # independent variable
  output$iv = renderUI({
    checkboxGroupInput('iv', h5('Bagimsiz Degiskenler'), choices = names(d()),
                       selected = "Uncheck For 2")
  })
  
  
  
  output$obs = renderUI({sliderInput('obs', "Egitim seti yuzdesi",
                                     min = 0, max = 1, value = 0.1)
  })
  
  output$kume = renderUI({sliderInput('kume', "Kume Sayisi:",
                                      min = 0, max = 20, value = 1)
  })
  
  output$seed = renderUI({numericInput('seed', "Seed Sayisi", 10,
                                       min = 0, max = 5000)
  })
   
  data <- reactive({
    inFile <- input$file1
    
    if (is.null(inFile))
      return(switch(input$file2,
                    "rock" = rock,
                    "pressure" = pressure,
                    "cars" = cars,
                    "Carseats" = Carseats,
                    "Arthritis" = Arthritis,
                    "Hitters" = Hitters,
                    "Boston" = Boston,
                    "USArrests" = USArrests,
                    "Default" = Default,
                    "Airpassanger" = WDI(country = c("TR"), indicator = c("NY.GDP.MKTP.CD"), start=1960, end = 2018),
                    "Airpassanger2" = WDI(country = c("TR"), indicator = c("NY.GDP.MKTP.CD", "TX.VAL.MRCH.XD.WD"), start=1960, end = 2018)
                 
                    ))
    
    read.csv(input$file1$datapath, header = input$header,sep = input$sep,quote = input$quote)

    
    })


  
  d <- reactive({
    dataset1 <- data()
    d_na<- na.omit(dataset1)
    d_na[!d_na %in% boxplot.stats(d_na$out)]
    d_na
  })
  

  fakvar<- reactive({
    select_if(d(), is.factor)
  })
  
  numvar<- reactive({
    select_if(d(), is.numeric)
  })
  
  t_i<- reactive({createDataPartition(y = d()[,input$dv], p = input$obs, list=F, times=1)})
  e<- reactive({d()[t_i(),]})
  t<- reactive({d()[-t_i(),]})
  e_x<- reactive({
    dv<- input$dv
    e() %>% dplyr::select(-dv)
    })
  e_y<- reactive({
    dv<- input$dv
    e() %>% dplyr::select(dv)
    })
  t_x<- reactive({
    dv<- input$dv
    t() %>% dplyr::select(-dv)})
  t_y<- reactive({
    dv<- input$dv
    t() %>% dplyr::select(dv)})
  tt<- reactive({
    data.frame(e_x(), dv = e_y())
   })


  
  
  
  output$contents <- renderPrint({
    summary(d())
  })
  #output$grap <- renderPlot(
    #ggpairs(d())
  #)
  output$summary <- renderPrint({str(d())})
  output$skewness <- renderTable({
    num<- select_if(d(), is.numeric)
    
    a<- profiling_num(num)
    b<- data.frame(isim= colnames(num), skewness = a$skewness, kurtosis=a$kurtosis)})
  
  output$normallik <- renderPrint({
    num<- select_if(d(), is.numeric)
    normal<- apply(num,2, function(x){ shapiro.test(x)})
    res <- sapply(normal, `[`, c("statistic","p.value"))
    return(res)
  })
  
  output$freq<- renderPrint({
    freq(fakvar())
  })
  
  output$freq1<- renderPlot({
    ggpairs(fakvar())
  })
  
  output$aykiri <- renderPlot({boxplot(d())})
  output$korelasyon <- renderPlot({
    nums <- unlist(lapply(d(), is.numeric))#### sadece numeric data
    d()[, nums]
    chart.Correlation(d())})
  output$korelasyon2 <- renderPlot({
    nums <- unlist(lapply(d(), is.numeric))#### sadece numeric data
    d()[, nums]
    ggcorr(d())})
  output$histogram <- renderPlot({plot_num(d())})
  output$na <- renderPrint({sum(is.na(d()))})
  
  ##1. Dogrusal regresyon ve kuzenler
  ###################regresyon########################
  
  output$model <- renderPrint({
    regFormula<- as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ "))
    model<- lm(regFormula, data = d())
    summary(model)
  })
  
  output$modelp <- renderPrint({
    regFormula<- as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ "))
    model<- lm(regFormula, data = d())
    head(predict(model))
  })
  
  output$cdr<- renderPrint({

    regFormula<- as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ "))
    mcdr<- lm(regFormula, data = tt())
    summary(mcdr)
  })
  
  output$hata <- renderPrint({
    regFormula<- as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ "))
    mcdr<- lm(regFormula, data = tt())
    defaultSummary(data.frame(obs = tt()[,input$dv], pred= mcdr$fitted.values))
  })
  
  output$hata1 <- renderPrint({
    regFormula<- as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ "))
    mcdr<- lm(regFormula, data = tt())
    defaultSummary(data.frame(obs = tt()[,input$dv], pred= mcdr$fitted.values))

    defaultSummary(data.frame(obs = t_y()[,input$dv], pred=predict(mcdr,t_x())))
  })
  
  output$hata2 <- renderPrint({
    
    ctrl<- trainControl(method = "cv", number = 10)
    lm_val_fit <- train(x = e_x(), y = e_y()[[1]], method = "lm", trControl = ctrl)
    summary(lm_val_fit)
    
  })
  
  ##Temel Bilesen analizi
  
  output$temel <- renderPrint({
  regFormula<- as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ "))
  pcr_fit<- pcr(regFormula, data = tt(), scale = TRUE, validation = "CV")
  defaultSummary(data.frame(obs = tt()[,input$dv], pred= as.vector(pcr_fit$fitted.values)))
 
  })
  
  output$temel3 <- renderPrint({
    regFormula<- as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ "))
    pcr_fit<- pcr(regFormula, data = tt(), scale = TRUE, validation = "CV")
    defaultSummary(data.frame(obs = t_y()[,input$dv], pred= as.vector(predict(pcr_fit, t_x(), ncomp = 1:2))))

  })
  
  output$temel2 <- renderPrint({
    regFormula<- as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ "))
    pcr_fit<- pcr(regFormula, data = tt(), scale = TRUE, validation = "CV")
    defaultSummary(data.frame(obs = tt()[,input$dv], pred= as.vector(pcr_fit$fitted.values)))
    predict(pcr_fit, t_x()[1:5,], ncomp =1:2)
  })
  
  output$temel4 <- renderPlot({
    ctrl<- trainControl(method = "cv", number = 10)
    pcr_tune <- train(x = e_x(), y = e_y()[[1]], method = "pcr", trControl = ctrl, preProc = c("center", "scale"), tuneLength = 20)
    plot(pcr_tune)
  })
 
    output$temel5 <- renderPrint({
      ctrl<- trainControl(method = "cv", number = 10)
      pcr_tune <- train(x = e_x(), y = e_y()[[1]], method = "pcr", trControl = ctrl, preProc = c("center", "scale"), tuneLength = 20)

      defaultSummary(data.frame(obs = t_y()[[1]], pred= as.vector(predict(pcr_tune, t_x()))))

    })

  
  
  #####################Anova##########################
  output$anova<- renderPrint({
    anovaFormula<- as.formula(paste(input$iv, paste(input$dv, collapse=" + "), sep=" ~ "))
    modelanova<- aov(anovaFormula, data = d())
    summary(modelanova)
  })
  output$tukeyplot<- renderPlot({
    anovaFormula<- as.formula(paste(input$iv, paste(input$dv, collapse=" + "), sep=" ~ "))
    modelanova<- aov(anovaFormula, data = d())
    plot(TukeyHSD(modelanova, conf.level = 0.95),las=1, col = "red")
  })
  output$tukey<- renderPrint({
    anovaFormula<- as.formula(paste(input$iv, paste(input$dv, collapse=" + "), sep=" ~ "))
    modelanova<- aov(anovaFormula, data = d())
    TukeyHSD(modelanova, conf.level = 0.95)
  })
  
  output$kruskal<- renderPrint({
    anovakrus<- as.formula(paste(input$iv, paste(input$dv, collapse=" + "), sep=" ~ "))
    modelkrus<- kruskal.test(anovakrus, data = d())
    modelkrus
  })
  #############LEVENE ##############################
  output$levene<- renderPrint({
    data<- d()
    modellevene<-leveneTest(as.numeric(data[,input$iv]),as.numeric(data[,input$dv]),data = d())
    modellevene
  })
  
  ######################T-TEST######################
  output$tt<- renderPrint({
    data<- d()
    tmodelanova <-t.test(as.numeric(data[,input$iv])~as.numeric(data[,input$dv]), mu=0, alt="two.sided", conf=0.95, var.eq=F, paired=F, data = d())
    
    tmodelanova
  })

  output$kk<- renderPrint({
    data<- d()
    table(data[,input$dv], data[,input$iv])
    
  })
  
  output$kkc<- renderPrint({
    data<- d()
    table(data[,input$dv],data[,input$iv])
    chisq.test(table(data[,input$dv],data[,input$iv]))
  })
  #############################KNN############################
  output$knn <- renderPrint({
    knna<<- knn.reg(train = e_x(), test = t_x(), y = e_y())
    knna
  })
  
  kkdata<- reactive({
    data.frame(obs = t_y()[[1]], pred = knna$pred)
  })
  
  output$kmodel<- renderPrint({
    
    head(kkdata())
    
  })
  
  output$kmodel2<- renderPrint({
    defaultSummary(kkdata())
   })
  
  
  ###########################KMEANS###################################
    output$kdis<- renderPrint({
      data<- d()
      nums <- unlist(lapply(data, is.numeric))#### sadece numeric data
      data[, nums]
      df<- scale(data)
      distance<- get_dist(df)
      k2<- kmeans(df, centers =input$kume, nstart = 25)
      k2
    })

    output$kdis2<- renderPlot({
      data<- d()
      nums <- unlist(lapply(data, is.numeric))#### sadece numeric data
      data[, nums]
      df<- scale(data)
      distance<- get_dist(df)
      k2<- kmeans(df, centers =input$kume, nstart = 25)
      fviz_cluster(k2, data = df )

    })

    output$kdis3<- renderPlot({
      set.seed(input$seed)
      data<- d()
      nums <- unlist(lapply(data, is.numeric))#### sadece numeric data
      data[, nums]
      df<- scale(data)

      fviz_nbclust(df, kmeans, method  ="wss")

    })

    output$kdis4<- renderPlot({
      set.seed(input$seed)
      data<- d()
      nums <- unlist(lapply(data, is.numeric))#### sadece numeric data
      data[, nums]
      aa<- apply(data,2, var)
      bb<- scale(aa)
      dd<- dist(bb, method = "euclidean")
      hc1<- hclust(dd, method = "complete")
      plot(hc1)

    })
  ##########################################################################
  
    #   ############################RANDOM FOREST###############################
      output$randomf<- renderPrint({

        randomForest(e_x(), e_y()[[1]], importance = T)

      })
      output$ver<- renderPrint({

        a<- randomForest(e_x(), e_y()[[1]], importance = T)
        importance(a)

      })

      output$rp<- renderPrint({

        a<- randomForest(e_x(), e_y()[[1]], importance = T)
        importance(a)

        predict(a, t_x())
      })

      output$rt<- renderPrint({
        a<- randomForest(e_x(), e_y()[[1]], importance = T)
        defaultSummary(data.frame(obs = t_y()[[1]], pred =predict(a, t_x())))
      })
       
    #################################XGBOOST##################################


      output$gbm<- renderPrint({
        xgboost(data = as.matrix(e_x()), label = e_y()[[1]], booster = "gblinear",
                max.depth = 2, eta = 1, nthread = 2, nrounds  = 2)

      })

      output$gbmpredict<- renderPrint({
        predict(xgboost(data = as.matrix(e_x()), label = e_y()[[1]], booster = "gblinear",
                        max.depth = 2, eta = 1, nthread = 2, nrounds  = 2), as.matrix(t_x()))

      })
    
      ###############Lojistik Regresyon################################

        output$lreg<- renderPrint({

          dv = input$dv
          set.seed(input$seed)
          d<- data.frame(data())
          t_i<- createDataPartition(y = d[,input$dv], p = input$obs, list=F, times=1)
          e<- d[t_i,]
          t<- d[-t_i,]
          e_x<- e %>% dplyr::select(-dv)
          e_y<- e %>% dplyr::select(dv)
          t_x<- t %>% dplyr::select(-dv)
          t_y<- t %>% dplyr::select(dv)
          tt<- data.frame(e_x, dv = e_y)
          tt[,dv]<- as.numeric(tt[,dv])-1


          model_glm <- glm(formula = as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ ")),
                            data = tt,
                            family = "binomial")
          summary(model_glm)
          #head(tt)
          # model_glm_tahmin<- ifelse(predict(model_glm, type ="response") > 0.5, "YES", "NO")
          # head(model_glm_tahmin)
          # table(tahmin = model_glm_tahmin, gercek = tt[,dv] )

        })

        output$lregt<- renderPrint({

          dv = input$dv
          set.seed(input$seed)
          d<- data.frame(data())
          t_i<- createDataPartition(y = d[,input$dv], p = input$obs, list=F, times=1)
          e<- d[t_i,]
          t<- d[-t_i,]
          e_x<- e %>% dplyr::select(-dv)
          e_y<- e %>% dplyr::select(dv)
          t_x<- t %>% dplyr::select(-dv)
          t_y<- t %>% dplyr::select(dv)
          tt<- data.frame(e_x, dv = e_y)
          tt[,dv]<- as.numeric(tt[,dv])-1


          model_glm <- glm(formula = as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ ")),
                           data = tt,
                           family = "binomial")
          #summary(model_glm)
          #head(tt)
          model_glm_tahmin<- ifelse(predict(model_glm, type ="response") > 0.5, "YES", "NO")
          head(model_glm_tahmin)
          table(tahmin = model_glm_tahmin, gercek = tt[,dv] )

        })

#######################################YSA#############################

       output$ysa<- renderPrint({
         set.seed(input$seed)
         dv<- input$dv
         data<- d()
         numericdata<- scale(select_if(data, is.numeric))
         factordata<- select_if(data, is.factor)
         factordata<- lapply(factordata, function(x) as.factor(as.numeric(x)-1))
         ddd<- data.frame(numericdata,factordata)
         
        
         di<- ddd
         t_i<- createDataPartition(y = di[,input$dv], p = input$obs, list=F, times=1)
         # 
         e<- di[t_i,]
         t<- di[-t_i,]
         # #
         e_x<- e %>% dplyr::select(-dv)
         e_y<- e %>% dplyr::select(dv)
         # #
         t_x<- t %>% dplyr::select(-dv)
         t_y<- t %>% dplyr::select(dv)
         tt<- data.frame(e_x, dv = e_y)
         # 
         yas_fit<- nnet(as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ ")), data= di, size = 3, decay = 0.1)

         pred<- predict(yas_fit, t_x, type = "class")
         pred<- factor(pred)
         str(pred)

         confusionMatrix(pred, t_y[[1]], positive = "1")
         
       })
        
##Time series 
        
        time<- reactive({
          a <- d()
          a<- a[order(a$year),]
          b<- ts(a[,input$iv], start=min(a[,input$dv]), end = max(a[,input$dv]), frequency =as.numeric(input$zaman))
          
        })
        
        output$time <- renderPlot({
          plot(time())
        })
        
        output$time2<- renderPrint({
          a <- d()
          a<- a[order(a$year),]
          b<- ts(a[,input$iv], start=min(a[,input$dv]), end = max(a[,input$dv]), frequency =as.numeric(input$zaman))
          adf.test(b)
        })
        
        stationaryTS<- reactive({
          a <- d()
          a<- a[order(a$year),]
          b<- ts(a[,input$iv], start=min(a[,input$dv]), end = max(a[,input$dv]), frequency =as.numeric(input$zaman))
          adf.test(b)
          ndiffs(b)
          stationaryTS <- diff(b, differences= ndiffs(b)) 
          
        })
        
        output$time3<- renderPlot({

          plot(stationaryTS(), type="l", main="Differenced and Stationary")  
          
        })
        

        
        output$time4 <- renderPrint({
          auto.arima(time())
        })
        
        output$time5 <- renderPrint({
          a <- d()
          a<- a[order(a$year),]
          b<- ts(a[,input$iv], start=min(a[,input$dv]), end = max(a[,input$dv]), frequency =as.numeric(input$zaman))
          fa<- auto.arima(b)
          predict(fa, n.ahead = 5, se.fit = TRUE)
        })
        
        output$time6 <- renderPlot({
          a <- d()
          a<- a[order(a$year),]
          b<- ts(a[,input$iv], start=min(a[,input$dv]), end = max(a[,input$dv]), frequency =as.numeric(input$zaman))
          fa<- auto.arima(b)
          faa<- forecast(object = fa, h=5)
          plot(faa)
        })
            
        output$time7 <- renderPrint({
          a <- d()
          a<- a[order(a$year),]
          b<- ts(a[,input$iv], start=min(a[,input$dv]), end = max(a[,input$dv]), frequency =as.numeric(input$zaman))
          fa<- auto.arima(b)
          Box.test(fa$residuals, lag=20, type = "Ljung-Box")
        })
        
###Granger
        
        granger<- reactive({
          a <- d()
          
          dv = diff(a[,input$dv])
          iv<- diff(a[,input$iv])
          grangertest(dv~iv, order =2)
          
        })
        
        output$granger <- renderPrint({
          granger()
        })
        
        output$granger1 <- renderPrint({
          a <- d()
          
          dv = diff(a[,input$dv])
          iv<- diff(a[,input$iv])
          grangertest(dv~iv, order =2)
          c<- cbind(dv,iv)
          va=VAR(c, p=2, type ="const", lag.max = 10, ic = "AIC")
          causality(va, cause = "dv")$Granger
          
        })
        
        output$granger2 <- renderPrint({
          a <- d()
          
          dv = diff(a[,input$dv])
          iv<- diff(a[,input$iv])
          grangertest(dv~iv, order =2)
          c<- cbind(dv,iv)
          va=VAR(c, p=2, type ="const", lag.max = 10, ic = "AIC")
          causality(va, cause = "iv")$Granger
          
        })
        
    ##gozetimsiz - PCA
        output$pca<- renderPrint({
          
          df<- d()
          s_df <- apply(df,2,scale) 
          cov<- cov(s_df) 
          ei_df<- eigen(cov) 
          
          aov<- ei_df$values / sum(ei_df$values)
          aov
          
        })
        output$pca1<- renderPlot({
        
        df<- d()
        s_df <- apply(df,2,scale) 
        cov<- cov(s_df) 
        ei_df<- eigen(cov) 
        
        aov<- ei_df$values / sum(ei_df$values)
        qplot(c(1:ncol(d())), aov) +geom_line()+ xlab("Temel Bilesen") +ylab("PVE") + ggtitle("Bilesen Sayisi")
        
        })
        
        output$pca2<- renderPlot({
         
            
        df<- d()
        s_df <- apply(df,2,scale) 
        cov<- cov(s_df) 
        ei_df<- eigen(cov) 
        
        p<- ei_df$vectors[,1:2]
        p<- -p #eksen dondurduk
        rownames(p)<- names(d())
        bir<-as.matrix(s_df) %*% p[,1]
        iki<-as.matrix(s_df) %*% p[,2]
        pc<- data.frame(a=rownames(d()), bir , iki)
        
        
        ggplot(pc, aes(pc$bir,pc$iki)) +
            modelr:: geom_ref_line(h = 0) +
            modelr:: geom_ref_line(v = 0) +
            geom_text(label= pc$a, size = 3) +
            xlab("Birinci Asal Bilesen") +
            ylab("Ikinci Asal Bilesen") +
            ggtitle("Ilk iki asal bilesen")
        
        })
        
  # siniflandirma-KNN
        
      output$sknn<- renderPrint({
        set.seed(input$seed)
        dv<- input$dv
        knn_train1<- e()
        knn_dv<- knn_train1 %>% dplyr::select(dv)
        knn_train_f<- select_if(knn_train1, is.factor)
        knn_train_n<- select_if(knn_train1, is.numeric)
        knn_train_kalan<- knn_train_f %>% dplyr::select(-dv)
        knn_train_kalan_numeric<- lapply(knn_train_kalan, function(x) as.numeric(x))
        knn_train<- data.frame(knn_dv,knn_train_kalan_numeric, knn_train_n)
        knn_train<- knn_train %>% dplyr::select(-dv)
        
        
        knn_test1<- t()
        knnt_dv<- knn_test1 %>% dplyr::select(dv)
        knn_test_f<- select_if(knn_test1, is.factor)
        knn_test_n<- select_if(knn_test1, is.numeric)
        knn_test_kalan<- knn_test_f %>% dplyr::select(-dv)
        knn_test_kalan_numeric<- lapply(knn_test_kalan, function(x) as.numeric(x))
        knn_test<- data.frame(knnt_dv, knn_test_kalan_numeric, knn_test_n)
        knn_test<- knn_test %>% dplyr::select(-dv)
        
      
        knn_fit<- knn(train = knn_train, test = knn_test, cl = knn_dv[,1], k = 3)
        summary(knn_fit)
        
      })
        
      output$sknn1<- renderPrint({
        set.seed(input$seed)
        dv<- input$dv
        knn_train1<- e()
        knn_dv<- knn_train1 %>% dplyr::select(dv)
        knn_train_f<- select_if(knn_train1, is.factor)
        knn_train_n<- select_if(knn_train1, is.numeric)
        knn_train_kalan<- knn_train_f %>% dplyr::select(-dv)
        knn_train_kalan_numeric<- lapply(knn_train_kalan, function(x) as.numeric(x))
        knn_train<- data.frame(knn_dv,knn_train_kalan_numeric, knn_train_n)
        knn_train<- knn_train %>% dplyr::select(-dv)
        
        
        knn_test1<- t()
        knnt_dv<- knn_test1 %>% dplyr::select(dv)
        knn_test_f<- select_if(knn_test1, is.factor)
        knn_test_n<- select_if(knn_test1, is.numeric)
        knn_test_kalan<- knn_test_f %>% dplyr::select(-dv)
        knn_test_kalan_numeric<- lapply(knn_test_kalan, function(x) as.numeric(x))
        knn_test<- data.frame(knnt_dv, knn_test_kalan_numeric, knn_test_n)
        knn_test<- knn_test %>% dplyr::select(-dv)
        
        
        knn_fit<- knn(train = knn_train, test = knn_test, cl = knn_dv[,1], k = input$kume)
        summary(knn_fit)
        
        class_err<- function(gercek, tahmin){
          mean(gercek != tahmin)
        }
        
        class_err(knn_dv[,1], knn_fit)
        
      })
        
      output$sknn2<- renderPlot({
        
        set.seed(input$seed)
        dv<- input$dv
        knn_train1<- e()
        knn_dv<- knn_train1 %>% dplyr::select(dv)
        knn_train_f<- select_if(knn_train1, is.factor)
        knn_train_n<- select_if(knn_train1, is.numeric)
        knn_train_kalan<- knn_train_f %>% dplyr::select(-dv)
        knn_train_kalan_numeric<- lapply(knn_train_kalan, function(x) as.numeric(x))
        knn_train<- data.frame(knn_dv,knn_train_kalan_numeric, knn_train_n)
        knn_train<- knn_train %>% dplyr::select(-dv)
        
        
        knn_test1<- t()
        knnt_dv<- knn_test1 %>% dplyr::select(dv)
        knn_test_f<- select_if(knn_test1, is.factor)
        knn_test_n<- select_if(knn_test1, is.numeric)
        knn_test_kalan<- knn_test_f %>% dplyr::select(-dv)
        knn_test_kalan_numeric<- lapply(knn_test_kalan, function(x) as.numeric(x))
        knn_test<- data.frame(knnt_dv, knn_test_kalan_numeric, knn_test_n)
        knn_test<- knn_test %>% dplyr::select(-dv)
        
        ctrl<- trainControl(method = "cv", number = 10, summaryFunction = twoClassSummary, classProbs = TRUE,
                            savePredictions = TRUE)
        knn_grid<- data.frame(k = c(4*(0:3)+1, 7*(1:3)+1))
        knn_tune<- train(knn_train, knn_dv[,1], method = "knn", metric = "ROC", preProc= c("center", "scale"),
                         trControl = ctrl, tuneGrid = knn_grid)
        plot(knn_tune)
        
      })
      output$sknn3<- renderPrint({
        
        set.seed(input$seed)
        dv<- input$dv
        knn_train1<- e()
        knn_dv<- knn_train1 %>% dplyr::select(dv)
        knn_train_f<- select_if(knn_train1, is.factor)
        knn_train_n<- select_if(knn_train1, is.numeric)
        knn_train_kalan<- knn_train_f %>% dplyr::select(-dv)
        knn_train_kalan_numeric<- lapply(knn_train_kalan, function(x) as.numeric(x))
        knn_train<- data.frame(knn_dv,knn_train_kalan_numeric, knn_train_n)
        knn_train<- knn_train %>% dplyr::select(-dv)
        
        
        knn_test1<- t()
        knnt_dv<- knn_test1 %>% dplyr::select(dv)
        knn_test_f<- select_if(knn_test1, is.factor)
        knn_test_n<- select_if(knn_test1, is.numeric)
        knn_test_kalan<- knn_test_f %>% dplyr::select(-dv)
        knn_test_kalan_numeric<- lapply(knn_test_kalan, function(x) as.numeric(x))
        knn_test<- data.frame(knnt_dv, knn_test_kalan_numeric, knn_test_n)
        knn_test<- knn_test %>% dplyr::select(-dv)
        
        ctrl<- trainControl(method = "cv", number = 10, summaryFunction = twoClassSummary, classProbs = TRUE,
                            savePredictions = TRUE)
        knn_grid<- data.frame(k = c(4*(0:3)+1, 7*(1:3)+1))
        knn_tune<- train(knn_train, knn_dv[,1], method = "knn", metric = "ROC", preProc= c("center", "scale"),
                         trControl = ctrl, tuneGrid = knn_grid)
        
        confusionMatrix(knn_tune$pred$pred, knn_tune$pred$obs, positive = "Yes")
        
      })
      
      output$cart<- renderPrint({
        set.seed(input$seed)
        dv<- input$dv
        factor(e()[, input$dv])

        model <- rpart(
          formula = as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ ")),
          data =e(), 
          cp = 0.001,
          method = "class"
          )
        bestcp <- model$cptable[which.min(model$cptable[,"xerror"]),"CP"]
        tree.pruned <- prune(model, cp = bestcp)
        tree.pruned
        as<- predict(tree.pruned, e_x(), type="class")
        head(e_y())
        
        tb<- table(predict(tree.pruned, e_x(), type="class"), e_y()[[1]])
        head (tb) 
        confusionMatrix(tb, positive ="No")

  
      })
      
      output$cart1<- renderPrint({
        set.seed(input$seed)
        dv<- input$dv
        factor(e()[, input$dv])
        
          model <- rpart(
          formula = as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ ")),
          data =e(), 
          cp = 0.001,
          method = "class"
        )
        bestcp <- model$cptable[which.min(model$cptable[,"xerror"]),"CP"]
        tree.pruned <- prune(model, cp = bestcp)
        tree.pruned
        as<- predict(tree.pruned, e_x(), type="class")
        head(e_y())
        
        tb<- table(predict(tree.pruned, t_x(), type="class"), t_y()[[1]])
        head (tb) 
        confusionMatrix(tb, positive =levels(t_y()[[1]]))

      })
      
      output$cart2<- renderPlot({
      
        set.seed(input$seed)
        dv<- input$dv
        factor(e()[, input$dv])
        
        model <- rpart(
          formula = as.formula(paste(input$dv, paste(input$iv, collapse=" + "), sep=" ~ ")),
          data =e(), 
          cp = 0.001,
          method = "class"
        )
        bestcp <- model$cptable[which.min(model$cptable[,"xerror"]),"CP"]
        tree.pruned <- prune(model, cp = bestcp)
        tree.pruned
          
      plot(tree.pruned)
      text(tree.pruned, cex = 0.8, use.n = TRUE, xpd = TRUE)
      
      prp(tree.pruned, faclen = 0, cex = 0.8, extra = 1)
      
      tot_count <- function(x, labs, digits, varlen)
      {
        paste(labs, "\n\nn =", x$frame$n)
      }
      
      })
      
      
###Bitti        
}
)
  
