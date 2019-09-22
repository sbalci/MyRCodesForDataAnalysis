# https://stackoverflow.com/questions/43419385/how-to-export-survfit-output-as-a-csv-table
res <- summary(km_fit, times = c(12,36,60))
save.df <- as.data.frame(res[c("strata", "time", "n.risk", "n.event", "surv", "std.err", "lower", "upper")])
# write.csv(save.df, file = "./file.csv")