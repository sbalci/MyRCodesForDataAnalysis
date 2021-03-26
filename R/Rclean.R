# devtools::install_github("MKLau/Rclean")
# BiocManager::install("Rgraphviz")


knitr::purl("~/Documents/whipple-ables/whippleables.Rmd")

library(Rclean)


Rclean::get_vars("~/whippleables.R")


Rclean::code_graph("~/whippleables.R")


