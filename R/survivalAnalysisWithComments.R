library(survival)

km_fit <- survfit(Surv(time, status) ~ sex, data = lung)

km_fit_summary <- summary(km_fit, times = c(0.5, 1, 2), scale = 365.25)

km_fit_df <- as.data.frame(km_fit_summary[c("strata", "time", "n.risk", "n.event", "surv", "std.err", "lower", "upper")])


km_fit_df %>% 
    dplyr::mutate(
        description = 
            glue::glue(
                "When {strata}, {time} year survival is {scales::percent(surv)} [{scales::percent(lower)}-{scales::percent(upper)}, 95% CI]."
            )
    ) %>% 
    dplyr::select(description) %>% 
    pull()
