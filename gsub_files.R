
files_recent <-
    list.files(path = "~/AutoJournalWatch/",
               pattern = "*Recent*.Rmd",
               full.names = TRUE)

xfun::gsub_files(
    files = files_recent,
    pattern = "articles <- readRDS('~/JournalWatchPBPath/articles.rds')",
    replacement = "",
    fixed = TRUE
)

