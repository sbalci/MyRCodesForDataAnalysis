# Survival Analysis in R
# https://rviews.rstudio.com/2017/09/25/survival-analysis-with-r/?mkt_tok=eyJpIjoiWm1Zd1pqRmlaVGc0WXpGaiIsInQiOiIwalwvV2VRWmtwTUY4alFxR3pqaWp0MzdheHRXTlBabHRlaTlcL28xUE1iWFV4M0dLT0hkUjFycVphYXRBeEJsQ2tXNXA3eEVTam5FdUVOaHRkYkpZdWg3eDR4eTQ4M2FFNE05cDFQV3A4UUFBaGxuRkZBSVRlTmRBTDlERFhxZWh2In0%3D

library(survival)
library(ranger)
library(ggplot2)
library(dplyr)
library(ggfortify)

data(veteran)
head(veteran)

km <- with(veteran, Surv(time, status))

head(km,80)


km_fit <- survfit(Surv(time, status) ~ 1, data = veteran)

km_fit

summary(km_fit, times = c(1,30,60,90*(1:10)))

#plot(km_fit, xlab="Days", main = 'Kaplan Meyer Plot') #base graphics is always ready
autoplot(km_fit)

km_trt_fit <- survfit(Surv(time, status) ~ trt, data = veteran)
km_trt_fit

autoplot(km_trt_fit)


vet <- mutate(veteran, AG = ifelse((age < 60), "LT60", "OV60"),
              AG = factor(AG),
              trt = factor(trt,labels=c("standard","test")),
              prior = factor(prior,labels=c("N0","Yes")))

km_AG_fit <- survfit(Surv(time, status) ~ AG, data = vet)
km_AG_fit

autoplot(km_AG_fit)


# Fit Cox Model
cox <- coxph(Surv(time, status) ~ trt + celltype + karno + diagtime + age + prior , data = vet)
cox
summary(cox)

cox_fit <- survfit(cox)
cox_fit
#plot(cox_fit, main = "cph model", xlab="Days")
autoplot(cox_fit)

aa_fit <-aareg(Surv(time, status) ~ trt + celltype +
                   karno + diagtime + age + prior , 
               data = vet)
aa_fit


#summary(aa_fit)  # provides a more complete summary of results
autoplot(aa_fit)


# ranger model
r_fit <- ranger(Surv(time, status) ~ trt + celltype + 
                    karno + diagtime + age + prior,
                data = vet,
                mtry = 4,
                importance = "permutation",
                splitrule = "extratrees",
                verbose = TRUE)


# Average the survival models
death_times <- r_fit$unique.death.times 
surv_prob <- data.frame(r_fit$survival)
avg_prob <- sapply(surv_prob,mean)

# Plot the survival models for each patient
plot(r_fit$unique.death.times,r_fit$survival[1,], 
     type = "l", 
     ylim = c(0,1),
     col = "red",
     xlab = "Days",
     ylab = "survival",
     main = "Patient Survival Curves")

#
cols <- colors()
for (n in sample(c(2:dim(vet)[1]), 20)){
    lines(r_fit$unique.death.times, r_fit$survival[n,], type = "l", col = cols[n])
}
lines(death_times, avg_prob, lwd = 2)
legend(500, 0.7, legend = c('Average = black'))


vi <- data.frame(sort(round(r_fit$variable.importance, 4), decreasing = TRUE))
names(vi) <- "importance"
head(vi)


cat("Prediction Error = 1 - Harrell's c-index = ", r_fit$prediction.error)


# Set up for ggplot
kmi <- rep("KM",length(km_fit$time))
km_df <- data.frame(km_fit$time,km_fit$surv,kmi)
names(km_df) <- c("Time","Surv","Model")

coxi <- rep("Cox",length(cox_fit$time))
cox_df <- data.frame(cox_fit$time,cox_fit$surv,coxi)
names(cox_df) <- c("Time","Surv","Model")

rfi <- rep("RF",length(r_fit$unique.death.times))
rf_df <- data.frame(r_fit$unique.death.times,avg_prob,rfi)
names(rf_df) <- c("Time","Surv","Model")

plot_df <- rbind(km_df,cox_df,rf_df)

p <- ggplot(plot_df, aes(x = Time, y = Surv, color = Model))
p + geom_line()




############





install.packages("OIsurv")
library(OIsurv)

library(help=KMsurv)

data(aids)
glimpse(aids)


data(tongue)

glimpse(tongue)

my.surv.object <- Surv(tongue$time[tongue$type==1], tongue$delta[tongue$type==1])

my.surv.object

data(psych)

my.surv.object2 <- Surv(psych$age, psych$age+psych$time, psych$death)

my.surv.object2

