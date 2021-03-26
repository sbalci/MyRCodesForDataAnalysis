library(readxl)
library(tidyverse)

GABAHipdata <- read_excel("MOGdata_LCModel_Final.xlsx",
                      sheet = "SPSS")

GABAHipdata <- GABAHipdata %>%
    select(subject, Group, ends_with("Hip")) %>%
    select(subject, Group, starts_with("GABA"))

GABAHipdata <- GABAHipdata %>%
    gather(-c("Group", "subject"), key = time, value = GABA)

GABAHipdata$time2 <- NA
# GABAHipdata$GSH[which(is.na(GABAHipdata$GSH))] <- 1


GABAHipdata$time2[which(GABAHipdata$time=="GABA_Hip")] <- 0
GABAHipdata$time2[which(GABAHipdata$time=="GABA_1week_Hip")] <- 1
GABAHipdata$time2[which(GABAHipdata$time=="GABA_4week_Hip")] <- 4


GABAHipdata$time2 <- factor(GABAHipdata$time2, levels = c(0,1,4),
                           labels = c("GABA_Hip", "GABA_1week_Hip",
                                      "GABA_4week_Hip"))

library(xlsx)
write.xlsx(GABAHipdata, "GABAHipdata.xlsx")

#

library(mice)
md.pattern(GABAHipdata)

library(VIM)
aggr_plot <- aggr(GABAHipdata, col=c('navyblue','red'),
                  numbers=TRUE, sortVars=TRUE, labels=names(data),
                  cex.axis=.7, gap=3,
                  ylab=c("Histogram of missing data","Pattern"))

plot(aggr_plot)
marginplot(GABAHipdata[c(1,2)])

imp <- mice(GABAHipdata)
print(imp)

complete(imp)

stripplot(imp, pch = 20, cex = 1.2)

GABAHipimputedData <- complete(imp)

#

library(nparLD)
modelGABAHip <- nparLD(GABA ~ Group * time2, data = GABAHipimputedData,
                      subject = "subject",
                      plot.CI = TRUE, show.covariance = TRUE)

plot(modelGABAHip)
summary(modelGABAHip)

boxplot(GABA ~ Group * time2, data=GABAHipdata,
        names=FALSE,col=c("grey",2,3),lwd=2)
axis(1,at=1,labels="Baseline",font=2,cex=3)
axis(1,at=4,labels="Week 1",font=2,cex=3)
axis(1,at=7,labels="Week 4",font=2,cex=3)
legend(0.1,4.5,c("MOG_DT","MOG_saline","MOGw_DT"),
       lwd=c(2,2,2),
       col=c("grey",2,3),cex=0.7)


write.xlsx(GABAHipimputedData, "GABAHipimputedData.xlsx")



