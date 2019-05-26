library(tidyverse)
library(cowplot)
library(bartext) # devtools::install_github("Omni-Analytics-Group/bartext")

mpg_manu <- mpg %>%
    distinct(manufacturer, model) %>%
    mutate_all(tools::toTitleCase) %>%
    mutate(model = gsub(" 4wd| 2wd| Pickup| Wagon|Toyota ", "", model))

p1 <- ggplot(mpg_manu, aes(x = manufacturer)) +
    geom_bartext(aes(label = model), fill = "goldenrod3", colour = "black", fontface = "bold") +
    scale_y_continuous(breaks = seq(0, 6, by = 1)) +
    labs(
        title = "Car Models by Manufacturer",
        subtitle = "Illustrating the geom_bartext() Functionality"
    ) +
    theme_minimal(16) 

ggsave(p1, filename = "graphics/car_models.png", dpi = 300, width = 17, height = 8)
