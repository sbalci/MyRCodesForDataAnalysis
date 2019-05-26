# https://www.linkedin.com/pulse/word-bank-country-analysis-r-studio-shiny-inanc-alikilic/
# https://www.linkedin.com/in/inanckilic/

library(shiny)
library(shinydashboard)
library(tidyverse)
library(timeSeries)
library(ggplot2)
library(WDI)
library(tseries)



ui <- fluidPage(
    
    # uiOutput("ara"),
    # 
    # uiOutput("aksiyon"),
    
    fluidRow(style = "padding: 10px; margin-top: 10px; border: 1px solid black",
             
             h2("Word Bank Country Analysis"),
             
             DT::dataTableOutput("arasonuc")),
    
    fluidRow(style = "padding: 10px; margin-top: 10px; border: 1px solid black",
             column(2, 
                    uiOutput("dv"),      
                    uiOutput("ulke"),
                    uiOutput("st"),
                    uiOutput("en")      
             ),
             column(3,
                    verbatimTextOutput("sonuc")       
             ),
             column(7,
                    plotOutput("sonuc2")     
             )
    ),
    fluidRow(style = "padding: 10px; margin-top: 10px; border: 1px solid black",
             plotOutput("harita")
    )
    
    
    
    
)



server <- function(input, output, session) {
    
    
    
    sonuc<- reactive({
        
        
        data.frame(WDIsearch(string = "", field = "name", short = TRUE,
                             cache = NULL))
        
        
    })
    
    output$arasonuc<- DT::renderDataTable({
        DT::datatable(sonuc(), options = list(lengthMenu = c(5, 30, 50), pageLength = 5))
    })
    
    # 
    output$ulke = renderUI({
        selectInput('dvu', h5('Please Select Country or Countries:'), choices = c('Arab World'='1A','Caribbean small states'='S3','Central Europe and the Baltics'='B8','Early-demographic dividend'='V2','East Asia & Pacific'='Z4','East Asia & Pacific (excluding high income)'='4E','East Asia & Pacific (IDA & IBRD countries)'='T4','Euro area'='XC','Europe & Central Asia'='Z7','Europe & Central Asia (excluding high income)'='7E','Europe & Central Asia (IDA & IBRD countries)'='T7','European Union'='EU','Fragile and conflict affected situations'='F1','Heavily indebted poor countries (HIPC)'='XE','High income'='XD','IBRD only'='XF','IDA & IBRD total'='ZT','IDA blend'='XH','IDA only'='XI','IDA total'='XG','Late-demographic dividend'='V3','Latin America & Caribbean'='ZJ','Latin America & Caribbean (excluding high income)'='XJ','Latin America & the Caribbean (IDA & IBRD countries)'='T2','Least developed countries: UN classification'='XL','Low & middle income'='XO','Low income'='XM','Lower middle income'='XN','Middle East & North Africa'='ZQ','Middle East & North Africa (excluding high income)'='XQ','Middle East & North Africa (IDA & IBRD countries)'='T3','Middle income'='XP','North America'='XU','Not classified'='XY','OECD members'='OE','Other small states'='S4','Pacific island small states'='S2','Post-demographic dividend'='V4','Pre-demographic dividend'='V1','Small states'='S1','South Asia'='8S','South Asia (IDA & IBRD)'='T5','Sub-Saharan Africa'='ZG','Sub-Saharan Africa (excluding high income)'='ZF','Sub-Saharan Africa (IDA & IBRD countries)'='T6','Upper middle income'='XT','World'='1W','Afghanistan'='AF','Albania'='AL','Algeria'='DZ','American Samoa'='AS','Andorra'='AD','Angola'='AO','Antigua and Barbuda'='AG','Argentina'='AR','Armenia'='AM','Aruba'='AW','Australia'='AU','Austria'='AT','Azerbaijan'='AZ','Bahamas, The'='BS','Bahrain'='BH','Bangladesh'='BD','Barbados'='BB','Belarus'='BY','Belgium'='BE','Belize'='BZ','Benin'='BJ','Bermuda'='BM','Bhutan'='BT','Bolivia'='BO','Bosnia and Herzegovina'='BA','Botswana'='BW','Brazil'='BR','British Virgin Islands'='VG','Brunei Darussalam'='BN','Bulgaria'='BG','Burkina Faso'='BF','Burundi'='BI','Cabo Verde'='CV','Cambodia'='KH','Cameroon'='CM','Canada'='CA','Cayman Islands'='KY','Central African Republic'='CF','Chad'='TD','Channel Islands'='JG','Chile'='CL','China'='CN','Colombia'='CO','Comoros'='KM','Congo, Dem. Rep.'='CD','Congo, Rep.'='CG','Costa Rica'='CR','Cote dIvoire'='CI','Croatia'='HR','Cuba'='CU','Curacao'='CW','Cyprus'='CY','Czech Republic'='CZ','Denmark'='DK','Djibouti'='DJ','Dominica'='DM','Dominican Republic'='DO','Ecuador'='EC','Egypt, Arab Rep.'='EG','El Salvador'='SV','Equatorial Guinea'='GQ','Eritrea'='ER','Estonia'='EE','Eswatini'='SZ','Ethiopia'='ET','Faroe Islands'='FO','Fiji'='FJ','Finland'='FI','France'='FR','French Polynesia'='PF','Gabon'='GA','Gambia, The'='GM','Georgia'='GE','Germany'='DE','Ghana'='GH','Gibraltar'='GI','Greece'='GR','Greenland'='GL','Grenada'='GD','Guam'='GU','Guatemala'='GT','Guinea'='GN','Guinea-Bissau'='GW','Guyana'='GY','Haiti'='HT','Honduras'='HN','Hong Kong SAR, China'='HK','Hungary'='HU','Iceland'='IS','India'='IN','Indonesia'='ID','Iran, Islamic Rep.'='IR','Iraq'='IQ','Ireland'='IE','Isle of Man'='IM','Israel'='IL','Italy'='IT','Jamaica'='JM','Japan'='JP','Jordan'='JO','Kazakhstan'='KZ','Kenya'='KE','Kiribati'='KI','Korea, Dem. Peopleâ€™s Rep.'='KP','Korea, Rep.'='KR','Kosovo'='XK','Kuwait'='KW','Kyrgyz Republic'='KG','Lao PDR'='LA','Latvia'='LV','Lebanon'='LB','Lesotho'='LS','Liberia'='LR','Libya'='LY','Liechtenstein'='LI','Lithuania'='LT','Luxembourg'='LU','Macao SAR, China'='MO','Madagascar'='MG','Malawi'='MW','Malaysia'='MY','Maldives'='MV','Mali'='ML','Malta'='MT','Marshall Islands'='MH','Mauritania'='MR','Mauritius'='MU','Mexico'='MX','Micronesia, Fed. Sts.'='FM','Moldova'='MD','Monaco'='MC','Mongolia'='MN','Montenegro'='ME','Morocco'='MA','Mozambique'='MZ','Myanmar'='MM','Namibia'='NA','Nauru'='NR','Nepal'='NP','Netherlands'='NL','New Caledonia'='NC','New Zealand'='NZ','Nicaragua'='NI','Niger'='NE','Nigeria'='NG','North Macedonia'='MK','Northern Mariana Islands'='MP','Norway'='NO','Oman'='OM','Pakistan'='PK','Palau'='PW','Panama'='PA','Papua New Guinea'='PG','Paraguay'='PY','Peru'='PE','Philippines'='PH','Poland'='PL','Portugal'='PT','Puerto Rico'='PR','Qatar'='QA','Romania'='RO','Russian Federation'='RU','Rwanda'='RW','Samoa'='WS','San Marino'='SM','Sao Tome and Principe'='ST','Saudi Arabia'='SA','Senegal'='SN','Serbia'='RS','Seychelles'='SC','Sierra Leone'='SL','Singapore'='SG','Sint Maarten (Dutch part)'='SX','Slovak Republic'='SK','Slovenia'='SI','Solomon Islands'='SB','Somalia'='SO','South Africa'='ZA','South Sudan'='SS','Spain'='ES','Sri Lanka'='LK','St. Kitts and Nevis'='KN','St. Lucia'='LC','St. Martin (French part)'='MF','St. Vincent and the Grenadines'='VC','Sudan'='SD','Suriname'='SR','Sweden'='SE','Switzerland'='CH','Syrian Arab Republic'='SY','Tajikistan'='TJ','Tanzania'='TZ','Thailand'='TH','Timor-Leste'='TL','Togo'='TG','Tonga'='TO','Trinidad and Tobago'='TT','Tunisia'='TN','Turkey'='TR','Turkmenistan'='TM','Turks and Caicos Islands'='TC','Tuvalu'='TV','Uganda'='UG','Ukraine'='UA','United Arab Emirates'='AE','United Kingdom'='GB','United States'='US','Uruguay'='UY','Uzbekistan'='UZ','Vanuatu'='VU','Venezuela, RB'='VE','Vietnam'='VN','Virgin Islands (U.S.)'='VI','West Bank and Gaza'='PS','Yemen, Rep.'='YE','Zambia'='ZM','Zimbabwe'='ZW') , selected = "", multiple = TRUE)
    })
    
    
    output$dv = renderUI({
        selectInput('dv', h5('Please select one indicator'), choices = veri()[ ,1], selected = "",multiple = TRUE)
    })
    
    output$st = renderUI({
        numericInput("start", "start year:", 1960, min = 1950, max = 2018)
    })
    
    output$en = renderUI({
        numericInput("end", "end year:", 1960, min = 1950, max = 2018)
    })
    
    veri<- reactive({
        data.frame(WDIsearch(string = "", field = "name", short = TRUE,
                             cache = NULL))
    })
    
    
    
    as<- reactive({
        data.frame(WDI(country = c(input$dvu), indicator = c(input$dv), start=input$start, end = input$end))
    })
    
    output$sonuc<- renderPrint({
        
        
        head(as())
    })
    # 
    output$sonuc2<- renderPlot({
        
        library(ggplot2)
        a<- as()
        a<- a[order(a$year),]
        
        ggplot(a, aes(year,a[,input$dv], color=country)) + geom_line() +
            xlab('Year') + ylab("Selected Indicator")
        
        
    })
    
    output$harita<- renderPlot({
        
        library(rworldmap)
        har <- joinCountryData2Map(as(), joinCode = "ISO2", nameJoinColumn = "iso2c")
        #par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
        mapCountryData(har, nameColumnToPlot = colnames(as())[3])
        
    })
    
}



shinyApp(ui, server)

shinyApp(ui, server)
