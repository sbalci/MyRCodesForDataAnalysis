library(survival)
km_fit <- survfit(Surv(time, status) ~ sex, data = lung)

library(tidyverse)
# make a dataframe from fit list
fitDF <- bind_cols(
    time = km_fit[["time"]],
    n.risk = km_fit[["n.risk"]],
    n.event = km_fit[["n.event"]],
    n.censor = km_fit[["n.censor"]],
    surv = km_fit[["surv"]],
    lower = km_fit[["lower"]],
    upper = km_fit[["upper"]],
) %>% 
    mutate(
        timeyear = time / 365.25
    )

# this gives the result for the time = 0.5
fitDF[which.min(abs(fitDF$timeyear - 0.5)),]

# this gives the result for the time = 1
fitDF[which.min(abs(fitDF$timeyear - 1)),]

# this gives the result for the time = 2
fitDF[which.min(abs(fitDF$timeyear - 2)),]
