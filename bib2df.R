# https://discuss.ropensci.org/t/using-bib2df-to-parse-the-r-journal-archives/1718

journal <- bib2df::bib2df("https://journal.r-project.org/archive/RJournal.bib")
knitr::kable(
    journal[grepl("CRAN", journal$TITLE), c("TITLE", "MONTH", "YEAR", "URL")]
)

# https://docs.ropensci.org/bib2df/
# https://blog.r-hub.io/2019/05/29/keep-up-with-cran/

