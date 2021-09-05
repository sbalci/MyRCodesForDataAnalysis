# unname and rename all chunks in R project

purrr::map(
    .x = list_Rmd_files,
    .f = namer::unname_all_chunks
)
purrr::map(
    .x = list_Rmd_files,
    .f = namer::name_chunks
)
