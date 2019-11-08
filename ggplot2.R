# ggplot2 ----

mpg


ggplot(mpg) + 
    geom_point(aes(x = displ, y = hwy))
ggplot(mpg, aes(model, manufacturer)) + geom_point()


ggplot(mpg, aes(displ, cty, colour = year)) + 
    geom_point()



ggplot(mpg, aes(displ, hwy)) + 
    geom_point(aes(shape = year))


ggplot(mpg, aes(displ, hwy)) + 
    geom_point() + 
    geom_smooth(span = 0.2)



ggplot(mpg, aes(hwy)) +
    geom_histogram() +
    geom_freqpoly()




ggplot(mpg, aes(cty, hwy)) + 
    geom_point() +
    geom_smooth()


ggplot(mpg, aes(class, hwy)) + geom_boxplot()
ggplot(mpg, aes(reorder(class, hwy), hwy)) + geom_boxplot()


# gganimate ----



library(gganimate)

p <- ggplot(iris, aes(x = Petal.Width, y = Petal.Length)) + 
    geom_point()

plot(p)


anim <- p + 
    transition_states(Species,
                      transition_length = 2,
                      state_length = 1)

anim


p + 
    enter_appear()

library(tidyverse)
library(babynames)
hadley <- dplyr::filter(babynames, name == "Hadley")
ggplot(hadley, aes(year, n)) + 
    geom_line()



sometext <-strsplit(
    paste0("You can even try to make some crazy things like this paragraph. ","It may seem like a useless feature right now but it's so cool ","and nobody can resist. ;)"), " ")[[1]]


text_formatted <-paste(
    kableExtra::text_spec(sometext,
              "latex",
              color = kableExtra::spec_color(1:length(sometext), end = 0.9),
              font_size =kableExtra::spec_font_size(1:length(sometext), begin = 5, end = 20)),collapse = " ")

# To display the text, type`r text_formatted`outside of the chunk







