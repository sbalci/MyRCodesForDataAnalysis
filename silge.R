# devtools::install_github("juliasilge/packagesurvey")

library(tidyverse)
library(packagesurvey)
data(package_survey)

nrespondent <- n_distinct(package_survey$respondent)

package_survey %>%
    mutate(total = n_distinct(respondent)) %>%
    count(answer, total) %>%
    arrange(desc(n)) %>%
    mutate(proportion = scales::percent(n / total),
           answer = case_when(str_detect(answer, "R-specific search websites") ~ "R-specific search websites such as METACRAN or Rdocumentation",
                              str_detect(answer, "Other") ~ "Other",
                              TRUE ~ answer)) %>% 
    select(-total, -n) %>%
    knitr::kable(col.names = c("How do you currently discover and learn about R packages?",
                               "% of respondents"),
                 caption = "Percentage of respondents who chose each answer on survey")

package_survey %>%
    distinct(respondent, .keep_all = TRUE) %>%
    ggplot(aes(response_time)) +
    geom_histogram() +
    theme_minimal() +
    labs(x = NULL,
         y = "Number of R users",
         title = "Responses to survey on package discovery over time")
