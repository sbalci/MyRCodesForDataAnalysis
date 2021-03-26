# =======================================
# =     Enhancements to data tidying    =
# =          Hadley Wickham             =
# = https://rstd.io/tidyhancements-2019 =
# =======================================

# What is tidy data? ----------------------------------------------------------
# 1. Each column is a variable.
# 2. Each row is an observation.
# 3. Each cell is a value.

# Today I want to talk about two sets of improvements to the tidyr package
# These are currently only available in the dev version, but we're aiming
# to get to CRAN soon

remotes::install_github("tidyverse/tidyr")
library(tidyr)
library(tidyverse)
# Spread and gather; what the what? -------------------------------------------
# The goal of spread() and gather() is to help solve the first two problems
# which are usually tightly intertwined). But:
# * https://twitter.com/gshotwell/status/675344503566417921
# * https://twitter.com/mattfrost/status/768078660200898560
# * https://twitter.com/darinself/status/798717697806794752
# * https://twitter.com/toates_19/status/917698355370889216
# * https://twitter.com/irismwang/status/994349937944158208

# What are spread and gather supposed to do?
remotes::install_github("chrk623/dataAnim")
# Master's Thesis project by Charco Hui
library(dataAnim)
gather_anim(
  key = "Subject",
  value = "Score",
  col = c("English", "Maths"),
  data = datoy_wide
)
spread_anim(
  key = "Subject",
  value = "Score",
  data = datoy_long
)

# How can we give these functions better names?
# A big hint is in how people talk about them
# https://github.com/hadley/table-shapes
# longer and wider

# But what should the verb be? I decided to use pivot
# because that's how I picture it in my head

datoy_wide
datoy_wide %>%
  pivot_longer(...)

datoy_long %>%
  pivot_wider(...)


# -------------------------------------------------------------------------

# As well as better function and argument names, pivot_longer() and
# pivot_wider() are also more featureful; drawing inspirations from
# new tools in the data.table and cdata packages.

# Multiple variables in column names
who

# Multiple observations per row; from data.table
family <- tribble(
  ~family,  ~dob_child1,  ~dob_child2, ~gender_child1, ~gender_child2,
  1L, "1998-11-26", "2000-01-29",             1L,             2L,
  2L, "1996-06-22",           NA,             2L,             NA,
  3L, "2002-07-11", "2004-04-05",             2L,             2L,
  4L, "2004-10-10", "2009-08-27",             1L,             1L,
  5L, "2000-12-05", "2005-02-28",             2L,             1L,
)
family <- family %>% mutate_at(vars(starts_with("dob")), parse_date)
family

family

# Wider

fish_encounters

# Both

world_bank_pop


# Rectangling -------------------------------------------------------------
library(repurrrsive)
chars <- tibble(char = got_chars)
chars

chars %>%
  unnest_auto(char) %>%
  select(id, name, gender, titles) %>%
  unnest_auto(titles)

# Recommend unnest_wider() and unnest_longer() after initial exploration
# Also see hoist() if there's one bit deeply embedded bit of data that
# you want to pull out.

# Learn more --------------------------------------------------------------

# https://tidyr.tidyverse.org/dev/articles/pivot.html
# https://tidyr.tidyverse.org/dev/articles/rectangle.html
# https://rstd.io/tidyhancements-2019
