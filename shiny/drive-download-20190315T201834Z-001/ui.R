#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)


fluidPage(
  title = "Examples of DataTables",
  #theme = shinytheme("darkly"),
  
  sidebarLayout(
    
    sidebarPanel(

        fileInput("file1","Choose CSV File",multiple = FALSE,
          accept = c("text/csv",
                     "text/comma-separated-values,text/plain",
                     ".csv")),
        
        checkboxInput("header", "Header", TRUE),
        radioButtons(
          "sep",
          "Separator",
          choices = c(
            Comma = ",",
            Semicolon = ";",
            Tab = "\t"
          ),
          selected = ","
        ),
        selectInput(
          "file2",
          "Choose a dataset:",
          choices = c(
            "rock",
            "pressure",
            "cars",
            "Carseats",
            "Arthritis",
            "Hitters",
            "Boston",
            "USArrests",
            "Default",
            "Airpassanger",
            "Airpassanger2"
            
          )
        ),
        
        selectInput("zaman", "Zaman Serisi Araligi:",
                    c("Yillik" = 1,
                      "Ceyrek" = 4,
                      "Aylik" = 12,
                      "Haftalik" = 52)),
        
        
        uiOutput('dv'),
        uiOutput('iv'),
        uiOutput("kume"),
        uiOutput('obs'),
        uiOutput("selectbox"),
        uiOutput("seed")
        
      ),
    
    mainPanel(
      tabsetPanel(
        id = 'dataset',
        tabPanel("Ozet Veri",
                 h1("Ozet"),
                 verbatimTextOutput("contents"),
                 h1("Betimleyici Istatistikler"),
                 verbatimTextOutput("summary"),
                 h1("Carpiklik-Basiklik"),
                 tableOutput("skewness"),
                 helpText("p.value 0.05 buyuk ise veriler normal dagilmistir"),
                 h1("Normallik"),
                 verbatimTextOutput("normallik"),
                 h1("Histogram"),
                 plotOutput("histogram"),
                 h1("NA var mi?"),
                 verbatimTextOutput("na"),
                 plotOutput("aykiri"),
                 h1("Kategorik Degisken Frekans"),
                 verbatimTextOutput("freq"),
                 plotOutput("freq1")
                 ),
                 #plotOutput("grap")),
       
        navbarMenu("Hipotez Testleri",
                   tabPanel("Levene - T.Test", h3("Levene Test varyanslarin homojenligine bakar, Bagimsiz orneklem t-testi ile gruplarin anlamli olarak birbirinden farkli olup olmadigina bakar. Bagimli degisken olarak kategorik degisken, bagimsiz degisken olarak surekli degisken secilmeli"), helpText("p.value 0.05 buyuk ise varyanslar homojendir test yapilabilir."), verbatimTextOutput("levene"),
                            "T-test",h1("T - Test"),helpText("p.value 0.05 buyuk ise gruplar arasi farklilik yoktur."), verbatimTextOutput("tt")),
                   tabPanel("Ki-Kare ve Capraz Tablo", verbatimTextOutput("kk"),verbatimTextOutput("kkc")),
                   tabPanel("Anova Testi", h1("Anova Testi kategorik orneklem sayisi ikiden fazla oldugu zaman grubun ortalamasinin karsilastirilmasinda kullanilir. Lutfen bagimsiz degiskene kategorik degisken giriniz; 1- veriler normal dagilmali, 2- varyanslar homojen olmali"),verbatimTextOutput("anova"),verbatimTextOutput("tukey"),plotOutput("tukeyplot"),verbatimTextOutput("kruskal")),
                   
                   tabPanel("Korelasyon", h1("Verilerin Korelasyonlari"),plotOutput("korelasyon"), plotOutput("korelasyon2"))
        ),
        navbarMenu("Dogrusal Regresyon",
           tabPanel("Regresyon Analizi", helpText("Sadece sureki veri ile kullanilir. Bir surekli degiskeni hangi surekli degiskenlerin acikladigina bakilir"),verbatimTextOutput("model"), helpText("Tahmin edilen veriler"), verbatimTextOutput("modelp")),
           tabPanel("Coklu Dogrusal Regresyon", helpText("Sadece sureki veri ile kullanilir. Bir surekli degiskeni hangi surekli degiskenlerin acikladigina bakilir"),verbatimTextOutput("cdr"), helpText("Tahmin edilen veriler"),helpText("Egitim Hatasi"), verbatimTextOutput("hata"),helpText("Test Hatasi"),verbatimTextOutput("hata1"), verbatimTextOutput("hata2")),
           tabPanel("Temel Bilesen Regresyonu", helpText("Sadece sureki veri ile kullanilir. Bir surekli degiskeni hangi surekli degiskenlerin acikladigina bakilir"),verbatimTextOutput("temel"), helpText("Tahmin edilen veriler"), verbatimTextOutput("temel2"), verbatimTextOutput("temel3"),plotOutput("temel4"),verbatimTextOutput("temel5"))
           ),

       
        
        navbarMenu("Dogrusal Olmayan Regresyon",
           tabPanel("KNN", h1("KNN"),verbatimTextOutput("knn"), verbatimTextOutput("kmodel"),verbatimTextOutput("kmodel2"))
           
                  ),     
                   
                   
                   ####navbar menu
        
        navbarMenu("Zaman Serisi",
                   tabPanel("Zaman Serisi", h3("Bagimli degisken yil secilmeli"), plotOutput("time"), verbatimTextOutput("time2"), h2("p-value < 0.05 ise TS duragan, degil ise donusum yapilmali"), plotOutput("time3"),verbatimTextOutput("time4"), verbatimTextOutput("time5"), plotOutput("time6"), verbatimTextOutput("time7") ),
                   tabPanel("Granger Nedenselligi", verbatimTextOutput("granger"), verbatimTextOutput("granger1"), verbatimTextOutput("granger2"))
                   
                   ),
        
        navbarMenu("Siniflandirma",
                     tabPanel("Lojistik Regresyon", h3("Bagimli degisken faktor olmali. Bir kategorik degiskenin tahmin edimesinde kullanilir. Ornegin Churn"),verbatimTextOutput("lreg"),verbatimTextOutput("lregt")),
                     tabPanel("KNN Siniiflandirma", h1("KNN"),verbatimTextOutput("sknn"), h3("Hedef degisken kategorik olmali ve bagimli degiskene yazilmali, diger tum degiskenler surekli degisken olmali."), h4("Test hatasi: farkli k degerleri icin kume sayisi kullanilir..."),verbatimTextOutput("sknn1"), plotOutput("sknn2"),verbatimTextOutput("sknn3")),
                     tabPanel("YSA", h1("YSA"), h4("Bagimli degisken hedef degiskendir, Bagimli degisken faktor olmali ve 0 dan baslatarak donusturulmelidir..."),verbatimTextOutput("ysa")),
                     tabPanel("CART-Karar Agaclari", h1("CART"), h4("Bagimli degisken hedef degiskendir, Bagimli degisken faktor olmali ve 0 dan baslatarak donusturulmelidir..."), h3("Model Egitim"),verbatimTextOutput("cart"),h3("Test ve Test Hatasi"), verbatimTextOutput("cart1"), plotOutput("cart2") ),
                     
                     tabPanel("RandomForest", h1("RandomForest"),verbatimTextOutput("randomf"),verbatimTextOutput("ver"), h1("Random Forests Tahmin"),verbatimTextOutput("rp"),h1("Random Forests Tahmin Test Hatasi"),verbatimTextOutput("rt")),
                     tabPanel("XGBoost", h1("XGBoost Model"),verbatimTextOutput("gbm"), h1("XG Boost Tahmin"), verbatimTextOutput("gbmpredict"))
                     
                   ),
        
        navbarMenu("Gozetimsiz Ogrenme",
                   tabPanel("K-Mean", h1("K_means Kume"),verbatimTextOutput("kdis"), plotOutput("kdis2"), plotOutput("kdis3"),h1("Dendrogram"),plotOutput("kdis4")),
                   tabPanel("PCA", h1("PCA"),verbatimTextOutput("pca"), plotOutput("pca1"), plotOutput("pca2"))
                  
                   
                )
          
        )
        
      )##tabsetpanel
    )
  )

        









