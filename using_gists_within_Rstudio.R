# using gists within Rstudio

# https://github.com/nemochina2008/gistrAddin
devtools::install_github("nemochina2008/gistrAddin")

# https://github.com/MilesMcBain/gistfo
remotes::install_github("MilesMcBain/gistfo", dependencies = TRUE)

gistfo:::gistfo_app(user = "sbalci", preload_all_gists = TRUE)

# https://github.com/yonicd/carbonate
install.packages('carbonate')
