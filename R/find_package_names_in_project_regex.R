# Find Packages Used in a Project Using Regular Expressions RegEx

list_of_Rmd_R <- c(
    list.files(path = here::here(),
               pattern = "\\.Rmd|.R$", # find files ending with .Rmd and .R
               full.names = TRUE
    ),
    
    list.files(path = here::here("childRmd"),
               pattern = "\\.Rmd|.R$",
               full.names = TRUE
    ),
    
    list.files(path = here::here("R"),
               pattern = "\\.Rmd|.R$",
               full.names = TRUE
    )
    
)


text_of_Rmd_R <- purrr::map(
    .x = list_of_Rmd_R,
    .f = readLines # read .Rmd and .R files as text document
)

text_of_Rmd_R <- as.vector(unlist(text_of_Rmd_R)) 

librarylist <-
    stringr::str_extract(
        string = text_of_Rmd_R, 
        pattern = 
            "([[:alnum:]]*)::|library..?([[:alnum:]]*)|p_load..?([[:alnum:]]*)"
        # extract word before '::', after `library`, after `p_load` 
    )

librarylist <- librarylist[!is.na(librarylist)]
librarylist <- unique(librarylist)
librarylist <- gsub(pattern = "::|library|,|\"|\\\\|\\(|\\/|\\-|\\}|\\{", # remove some characters
                    replacement = "",
                    x = librarylist)
librarylist <- trimws(librarylist) # remove whitespace
librarylist <- unique(librarylist[!librarylist %in% c("", "is")])
librarylist

librarylist[!librarylist %in% installed.packages()]
