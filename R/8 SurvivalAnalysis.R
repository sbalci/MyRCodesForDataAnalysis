# Based on https://www..com/community/tutorials/survival-analysis-R


library(survival)
library(survminer)
library(tidyverse)
library(jmv)

data(ovarian)
glimpse(ovarian)
help(ovarian)

summary(ovarian)

varOvarian <- names(ovarian)

ovarian2 <- ovarian %>% 
    map_df(as.factor)

jmv::descriptives(ovarian, varOvarian, freq = TRUE)

jmv::descriptives(ovarian2, varOvarian, freq = TRUE)



# Dichotomize age and change data labels
ovarian$rx <- factor(ovarian$rx, 
                     levels = c("1", "2"), 
                     labels = c("A", "B"))
ovarian$resid.ds <- factor(ovarian$resid.ds, 
                           levels = c("1", "2"), 
                           labels = c("no", "yes"))
ovarian$ecog.ps <- factor(ovarian$ecog.ps, 
                          levels = c("1", "2"), 
                          labels = c("good", "bad"))

jmv::descriptives(ovarian, varOvarian, freq = TRUE)



# Data seems to be bimodal
hist(ovarian$age)



ovarian <- ovarian %>% mutate(age_group = ifelse(age >= 50, "old", "young"))
ovarian$age_group <- factor(ovarian$age_group)

varOvarian <- names(ovarian)

jmv::descriptives(ovarian, varOvarian, freq = TRUE)

# Fit survival data using the Kaplan-Meier method
surv_object <- Surv(time = ovarian$futime, event = ovarian$fustat)
surv_object


fit1 <- survfit(surv_object ~ rx, data = ovarian)
summary(fit1)


ggsurvplot(fit1, data = ovarian, pval = TRUE)


# Examine prdictive value of residual disease status
fit2 <- survfit(surv_object ~ resid.ds, data = ovarian)
ggsurvplot(fit2, data = ovarian, pval = TRUE)


# Fit a Cox proportional hazards model
fit.coxph <- coxph(surv_object ~ rx + resid.ds + age_group + ecog.ps, 
                   data = ovarian)
ggforest(fit.coxph, data = ovarian)




