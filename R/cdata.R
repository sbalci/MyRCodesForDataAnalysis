# https://winvector.github.io/cdata/


iris <- data.frame(iris)
iris$iris_id <- seq_len(nrow(iris))

# show the data
head(iris)


library("ggplot2")
library("cdata")


controlTable <- wrapr::qchar_frame(
  "flower_part", "Length"     , "Width"     |
    "Petal"    , Petal.Length , Petal.Width |
    "Sepal"    , Sepal.Length , Sepal.Width )

transform <- rowrecs_to_blocks_spec(
  controlTable,
  recordKeys = c("iris_id", "Species"))

# do the unpivot to convert the row records to block records
iris_aug <- iris %.>% transform

# show the tranformed data
head(iris_aug)

# plot the graph
ggplot(iris_aug, aes(x=Length, y=Width)) +
  geom_point(aes(color=Species, shape=Species)) + 
  facet_wrap(~flower_part, labeller = label_both, scale = "free") +
  ggtitle("Iris dimensions") +  scale_color_brewer(palette = "Dark2")


print(transform)

unclass(transform)

















