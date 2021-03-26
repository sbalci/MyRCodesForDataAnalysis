
# gtsummary ----
# http://www.danieldsjoberg.com/gtsummary/articles/tbl_summary.html


# install.packages("gtsummary")
# install.packages("remotes")
# remotes::install_github("rstudio/gt")


library(gtsummary)
library(gt)
library(dplyr)

# printing trial data
head(trial) %>% knitr::kable()


t1 <-
  tbl_summary(
    data = trial[c("trt", "age", "grade", "response")],
    by = trt
  ) %>%
  add_p() 
t1

mod1 <- 
  glm(response ~ trt + age + grade, trial, family = binomial(link = "logit"))

t2 <- tbl_regression(mod1, exponentiate = TRUE)
t2


# printing trial data
head(trial) %>% knitr::kable()


trial2 <- 
  trial %>%
  select(trt, marker, stage)

tbl_summary(trial2)


tbl_summary(trial2, by = trt) %>% add_p()


trial2 %>%
  # build base summary table
  tbl_summary(
    by = trt,
    # change variable labels
    label = list(vars(marker) ~ "Marker, ng/mL",
                 vars(stage) ~ "Clinical T Stage"),
    # change statistics printed in table
    statistic = list(all_continuous() ~ "{mean} ({sd})",
                     all_categorical() ~ "{n} / {N} ({p}%)"),
    digits = list("marker" ~ c(1, 2))
  ) %>%
  # add p-values, report t-test, round large pvalues to two decimal place
  add_p(test = list(vars(marker) ~ "t.test"),
        pvalue_fun = function(x) style_pvalue(x, digits = 2)) %>%
  # add statistic labels
  add_stat_label() %>%
  # bold variable labels, italicize levels
  bold_labels() %>%
  italicize_levels() %>%
  # bold p-values under a given threshold (default is 0.05)
  bold_p(t = 0.2) %>%
  # include percent in headers
  modify_header(stat_by = "**{level}**, N = {n} ({style_percent(p, symbol = TRUE)})")



trial %>%
  dplyr::select(trt, response, age, stage, marker, grade) %>%
  tbl_summary(
    by = trt,
    type = list(c("response", "grade") ~ "categorical"), # select by variables in a vector
    statistic = list(all_continuous() ~ "{mean} ({sd})", all_categorical() ~ "{p}%") # select by summary type/attribute
  ) %>%
  add_p(test = list(contains("response") ~ "fisher.test", # select using functions in tidyselect
                    all_continuous() ~ "t.test"))




tab1 = tbl_summary(trial2, by = trt)
tab1


tbl_summary(trial2) %>% purrr::pluck("gt_calls") %>% head(n = 5)
#> $gt
#> gt::gt(data = x$table_body)
#> 
#> $cols_align
#> gt::cols_align(align = 'center') %>% gt::cols_align(align = 'left', columns = gt::vars(label))
#> 
#> $fmt_missing
#> gt::fmt_missing(columns = gt::everything(), missing_text = '')
#> 
#> $tab_style_text_indent
#> gt::tab_style(style = gt::cell_text(indent = gt::px(10), align = 'left'),locations = gt::cells_data(columns = gt::vars(label),rows = row_type != 'label'))
#> 
#> $footnote_stat_label
#> gt::tab_footnote(footnote = 'Statistics presented: n (%); median (IQR)',locations = gt::cells_column_labels(columns = gt::vars(label)))




tbl_summary(trial2, by = trt) %>%
  as_gt(exclude = "footnote_stat_label") %>%
  gt::tab_spanner(label = "Randomization Group",
                  columns = gt::starts_with("stat_"))


# tbl_regression ----
# http://www.danieldsjoberg.com/gtsummary/articles/tbl_regression.html


# build logistic regression model
m1 = glm(response ~ age + stage + grade,
         trial,
         family = binomial(link = "logit"))

# format results into data frame
tbl_regression(m1, exponentiate = TRUE)



# format results into data frame with global p-values
m1 %>%
  tbl_regression(
    exponentiate = TRUE, 
    pvalue_fun = function(x) style_pvalue(x, digits = 2),
    estimate_fun = function(x) style_ratio(x, digits = 3)
  ) %>% 
  add_global_p() %>%
  bold_p(t = 0.10) %>%
  bold_labels() %>% 
  italicize_levels()




tbl_m1 <- tbl_regression(m1, exponentiate = TRUE)
tbl_m1


`r # inline_text(tbl_m1, variable = "age")`


`r # inline_text(tbl_m1, variable = "age", pattern = "(OR {estimate}; 95% CI {conf.low}, {conf.high}; {p.value})")`


tbl_regression(m1) %>% names()


tbl_regression(m1) %>% purrr::pluck("gt_calls") %>% head(n = 5)



tbl_regression(m1, exponentiate = TRUE) %>%
  as_gt(exclude = "footnote_abbreviation")


trial %>%
  select(-death, -ttdeath, -stage) %>%
  tbl_uvregression(
    method = glm,
    y = response,
    method.args = list(family = binomial),
    exponentiate = TRUE,
    pvalue_fun = function(x) style_pvalue(x, digits = 2)
  ) %>%
  # overrides the default that shows p-values for each level
  add_global_p() %>%
  # adjusts global p-values for multiple testing (default method: FDR)
  add_q() %>%
  # bold p-values under a given threshold (default 0.05)
  bold_p() %>%
  # now bold q-values under the threshold of 0.10
  bold_p(t = 0.10, q = TRUE) %>%
  bold_labels()



# help("Rprofile")

# usethis::edit_r_profile()











