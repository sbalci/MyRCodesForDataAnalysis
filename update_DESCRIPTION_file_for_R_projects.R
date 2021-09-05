# update DESCRIPTION file for R projects


## find all Rmd files in R projects

list_Rmd_files <- dir(here::here(), pattern = "*.Rmd")

exclude_Rmd_files <-
    dir(here::here(), pattern = "^_|references|other")

list_Rmd_files <-
    list_Rmd_files[!(list_Rmd_files %in% exclude_Rmd_files)]

list_Rmd_files <- unique(c("index.Rmd", list_Rmd_files))


## update DESCRIPTION file


imports <- c(
    "bookdown",
    "attachment",
    attachment::att_from_rmds(path = list_Rmd_files
        # ".", recursive = TRUE
        )
)

imports2 <- automagic::get_dependent_packages()

imports <- unique(c(imports, imports2))

suggests <- c(attachment::att_from_rscripts(".", recursive = TRUE))

attachment::att_to_desc_from_is(
    path.d = "DESCRIPTION",
    imports = imports,
    suggests = suggests,
    normalize = TRUE,
    add_remotes = TRUE
)


remotes::install_deps(upgrade = "always")
