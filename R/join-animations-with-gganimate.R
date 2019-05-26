# Animated dplyr joins with gganimate
# * Garrick Aden-Buie
# * garrickadenbuie.com
# * MIT License: https://opensource.org/licenses/MIT

# Note: I used Fira Sans and Fira Mono fonts.
#       Use search and replace to use a different font if Fira is not available.

library(tidyverse)
library(gganimate)

# Data ----
x <- data_frame(
  id = 1:3,
  x = paste0("x", 1:3)
)

y <- data_frame(
  id = (1:4)[-3],
  y = paste0("y", (1:4)[-3])
)

# Functions ----
proc_data <- function(x, .id = "x") {
  colors <- scales::brewer_pal(type = "qual", "Set1")(max(x$id))
  x %>%
    mutate(.y = -row_number()) %>%
    tidyr::gather("label", "value", -.y) %>%
    mutate(value = as.character(value)) %>%
    group_by(.y) %>%
    mutate(
      .x = 1:n(),
      .id = .id,
      color = ifelse(label == "id", value, max(x$id) + 1),
      color = colors[as.integer(color)],
      color = ifelse(is.na(color), "#d0d0d0", color),
      color = ifelse(is.na(value), "#ffffff", color)
    )
}

plot_data <- function(x, title = "") {
  ggplot(x) +
    aes(.x, .y, fill = color, label = value) +
    geom_tile(color = "white", size = 3) +
    geom_text(aes(x = .x), hjust = 0.5, size = 12, family = "Fira Sans", color = "white") +
    scale_fill_identity() +
    coord_equal() +
    ggtitle(title) +
    theme_void() +
    theme(plot.title = element_text(family = "Fira Mono", hjust = 0.5, size = 24)) +
    guides(fill = FALSE)
}

animate_plot <- function(x) {
  x +
    transition_states(frame, transition_length = 2, state_length = 1) +
    enter_fade() +
    exit_fade() +
    ease_aes("sine-in-out")
}

# Left Join ----
initial_dfs <- proc_data(x, "x") %>%
  bind_rows(mutate(proc_data(y, "y"), .x = .x + 3)) %>%
  mutate(frame = 1)

joined_dfs <- left_join(x, y, "id") %>%
  proc_data("x") %>%
  mutate(frame = 2, .x = .x + 1)

extra_blocks <- inner_join(x, y, "id") %>%
  select(id) %>%
  proc_data("y") %>%
  mutate(frame = 2, .x = .x + 1)

lj <- initial_dfs %>%
  bind_rows(joined_dfs) %>%
  bind_rows(extra_blocks) %>%
  mutate(color = ifelse(is.na(value), "#ffffff", color)) %>%
  plot_data("left_join(x, y)") %>%
  animate_plot()

lj <- animate(lj)
anim_save("animated-left-join.gif", lj)


# Right Join ----
joined_dfs <- right_join(x, y, "id") %>%
  proc_data("y") %>%
  mutate(frame = 2, .x = .x + 1)

extra_blocks <- inner_join(x, y, "id") %>%
  select(id) %>%
  proc_data("x") %>%
  mutate(frame = 2, .x = .x + 1)

rj <- initial_dfs %>%
  bind_rows(joined_dfs, extra_blocks) %>%
  arrange(desc(.id), frame, desc(label), value) %>%
  plot_data("right_join(x, y)") %>%
  animate_plot()


rj <- animate(rj)
anim_save("animated-right-join.gif", rj)

# Inner Join ----
joined_df <- inner_join(x, y, "id")
joined_df <- bind_rows(
  proc_data(joined_df, "x"),
  proc_data(joined_df, "y")
) %>%
  filter(!(label == "x" & .id == "y") & !(label == "y" & .id == "x")) %>%
  mutate(frame = 2, .x = .x + 1)

ij <- initial_dfs %>%
  bind_rows(joined_df) %>%
  mutate(removed = value %in% c("3", "4", "x3", "y4"),
         remove = as.integer(removed)) %>%
  arrange(desc(frame), removed) %>%
  plot_data("inner_join(x, y)") %>%
  animate_plot()

ij <- animate(ij)
anim_save("animated-inner-join.gif", ij)

# Full Join ----
joined_df <- full_join(x, y, "id") %>%
  proc_data("x") %>%
  mutate(.id = ifelse(value %in% c("4", "y4"), "y", .id)) %>%
  mutate(frame = 2, .x = .x + 1)

extra_blocks <- inner_join(x, y, "id") %>%
  select(id) %>%
  proc_data("y") %>%
  mutate(frame = 2, .x = .x + 1)

fj <- initial_dfs %>%
  bind_rows(joined_df, extra_blocks) %>%
  plot_data("full_join(x, y)") +
  transition_states(frame, transition_length = 2, state_length = 1) +
  enter_appear() +
  exit_disappear(early = TRUE) +
  ease_aes("sine-in-out")

fj <- animate(fj)
anim_save("animated-full-join.gif", fj)

# Semi Join ----
joined_df <- semi_join(x, y, "id") %>%
  proc_data("x") %>%
  mutate(frame = 2, .x = .x + 1)

# Re-use extra_blocks from full_join
extra_blocks <- extra_blocks %>%
  mutate(.x = .x - 1)

sj <- initial_dfs %>%
  bind_rows(joined_df, extra_blocks) %>%
  plot_data("semi_join(x, y)") %>%
  animate_plot()

sj <- animate(sj)
anim_save("animated-semi-join.gif", sj)

# Anti Join ----
step2 <- initial_dfs %>%
  filter(.id == "x" | value %in% paste(1:2)) %>%
  mutate(
    frame = 2,
    .x = ifelse(.id == "y", 1, .x),
    .x = .x + 1
  )

step3 <- step2 %>%
  filter(grepl("3", value)) %>%
  ungroup() %>%
  mutate(frame = 3, .y = -1)

aj <- initial_dfs %>%
  mutate(removed = .id == "y", removed = as.integer(removed)) %>%
  bind_rows(step2, step3) %>%
  mutate(removed = ifelse(is.na(removed), 0, removed)) %>%
  arrange(removed, .y, .x, desc(frame)) %>% #View()
  mutate(alpha = case_when(
    grepl("3", value) ~ 1,
    frame == 2 & label == "id" ~ 0.25,
    frame == 2 ~ 0.65,
    TRUE ~ 1
  )) %>%
  {
    plot_data(., "anti_join(x, y)") +
      aes(alpha = alpha) +
      scale_alpha_identity()
  } %>%
  animate_plot()

aj <- animate(aj)
anim_save("animated-anti-join.gif", aj)
