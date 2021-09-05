# find all Rmd files in R projects

list_Rmd_files <- dir(here::here(), pattern = "*.Rmd")

exclude_Rmd_files <-
    dir(here::here(), pattern = "^_|references|other")

list_Rmd_files <-
    list_Rmd_files[!(list_Rmd_files %in% exclude_Rmd_files)]

list_Rmd_files <- unique(c("index.Rmd", list_Rmd_files))
