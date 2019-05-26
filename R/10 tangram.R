# https://github.com/spgarbet/tangram
# http://htmlpreview.github.io/?https://github.com/spgarbet/tg/blob/master/vignettes/example.html

library(tangram)
library(Hmisc)
getHdata(pbc)
# View(pbc)
table <- tangram(drug ~ bili + albumin + stage + protime + sex + age + spiders, data = pbc)

table
html5(table)
latex(table)
index(table)

write(
html5(tangram("drug ~ bili[2] + albumin + stage::Categorical + protime + sex + age + spiders", pbc, msd=TRUE, quant=seq(0, 1, 0.25)),
      fragment=TRUE, inline="hmisc.css", caption = "HTML5 Table Hmisc Style", id="tbl2"),
"tangram1.html")

write(
html5(tangram("drug ~ bili[2] + albumin + stage::Categorical + protime + sex + age + spiders", pbc),
      fragment=TRUE, inline="nejm.css", caption = "HTML5 Table NEJM Style", id="tbl3"),
"tangram_nejm.html")


tbl <- tangram("drug ~ bili[2] + albumin + stage::Categorical[1] + protime + sex[1] + age + spiders[1]", 
               data=pbc,
               pformat = 5)
write(html5(tbl,
      fragment=TRUE,
      inline="lancet.css",
      caption = "HTML5 Table Lancet Style", id="tbl4"
),
"tangram_lancet.html")

index(tangram("drug ~ bili + albumin + stage::Categorical + protime + sex + age + spiders", pbc))[1:20,]


library(readxl)
MDL307_Data <- read_excel("MDL307 - Data.xlsx")

MDL307_Data <- as.data.frame(MDL307_Data)

names(MDL307_Data)

View(MDL307_Data)

MDL307_Data$biyokimyasalrekurrens <- as.factor(MDL307_Data$biyokimyasalrekurrens)
levels(MDL307_Data$biyokimyasalrekurrens)[1] <- "yok"
levels(MDL307_Data$biyokimyasalrekurrens)[2] <- "var"

collist <- c("gleasonskor",
                 "tersiyer",
                 "kribriform",
                 "cerrahisinir",
                 "ekstaprostatik",
                 "lenfnodu",
                 "seminalvezikul"
                 )


MDL307_Data[collist] <- lapply(MDL307_Data[collist], as.factor)


table <- tangram(biyokimyasalrekurrens ~ yas +
                 gleasonskor +
                 tersiyer +
                 kribriform +
                 kribriformyuzde +
                 cerrahisinir +
                 ekstaprostatik +
                 lenfnodu +
                 seminalvezikul +
                 biyokimyasalrekurrens,
                 data = MDL307_Data)
table








