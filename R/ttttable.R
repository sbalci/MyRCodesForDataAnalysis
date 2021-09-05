# # ttable: a grammar of tables
# # https://gist.github.com/leeper/f9cfbe6bd185763762e126a4d8d7c286
# 
# # aggregate/summarize
# 
# # arrange
# 
# # annotation (metadata features)
# 
# # theme
# 
# # render
# 
# 
# 
# ttable <- function(formula, data, FUN = length, ...) {
#     
#     ttab <- aggregate(formula = formula, data = data, FUN = FUN, ...)
#     
#     vars <- all.vars(formula)
#     outcome_var <- vars[1L]
#     vars <- vars[-1L]
#     
#     outcome_var <- names(ttab)[ncol(ttab)]
#     names(ttab)[ncol(ttab)] <- "value"
#     ttab[,"variable"] <- outcome_var
#     ttab[,"summarizer"] <- as.character(substitute(FUN))
#     structure(ttab, class = c("ttable", "data.frame"), 
#               formula = formula,
#               row.vars = vars, 
#               col.vars = NULL)
# }
# 
# rowvars <- function(ttable) {
#     attr(ttable, "row.vars")
# }
# 
# colvars <- function(ttable) {
#     attr(ttable, "col.vars")
# }
# 
# arrange <- function(ttable, row.vars = rowvars(ttable), col.vars = colvars(ttable)) {
#     ttable
#     w <- which(names(ttable) %in% c("variable", "summarizer"))
#     ttable <- ttable[, -w, drop = FALSE]
#     if (!is.null(row.vars)) {
#         col.vars <- col.vars[-which(col.vars %in% row.vars)]
#     }
#     if (length(col.vars)) {
#         ttable[["rows"]] <- interaction(ttable[,names(ttable)[!names(ttable) %in% c("value", col.vars)]])
#         reshape(ttable, v.names = "value", direction = "wide", timevar = "rows")
#     } else {
#         ttable
#     }
# }
# 
# ttable(mpg ~ am + cyl + vs, data = mtcars)
# arrange(ttable(mpg ~ am + cyl + vs, data = mtcars), col.vars = "cyl")
# 
# #
# # A **table** is an *arrangement* of *summaries* of a dataset into rows and/or columns and/or facets
# #
# # The basic unit of a table is a *cell*. Cells represent subsets of the data specified by grouping factor(s).
# # 
# # The contents of a cell are determined by a *summarizer* (a function, often a summary statistic) 
# # applied to each subset of the data defined by the grouping factors that compose the rows, columns, and facets
# #
# # - The simplest summarizer is the identity function `I()`; 
# #   a dataset is a table, where columns summarize different variables and the summarizer is the I()
# #
# # - A table can contain multiple summarizers, with the cells using separate summarizers grouped, facetted, or with
# #   the aesthetics of the cells (font family, font style, font size, font color, fill color) conveying summarizers
# #   - Multiple summarizers need to be treated in a "tidy" fashion; a table can only have one "content" column, such
# #     that each summarizer generates an observation/row in the internal representation;
# #     an arrangement (see below) might use the summarizer "variable" to dictate cell position
# #     (e.g., by placing cells for two summarizers applied to the same subset adjacent to one another)
# #   - How should such aesthetics be communicated in plain text?
# #
# # - Other packages provide some useful, if incoherent, functionality:
# #   - Stata's `tab var1, summarize(var2)` syntax follows this logic
# #   - Stata's `tabstat var2, s(min max mean median) by(var1)` allow for multiple summarizers
# #   - SPSS defaults to tables with multiple summarizers per cell (frequency, percentage, etc.)
# #
# # - Some tables involve iterative application of summarizers
# #   - This gives an impression that summarizers need to be "aware" of other cells values (e.g., to do row/column proportions),
# #     but those prop.table() is just a summarizer (a proportion function) applied to an intermediate representation (i.e., the tabulation)
# #   - This means that the intermediate representation of a table should itself be able able to be submitted for further tabulation
# #   - A table should just be a data.frame that can be further aggregated, summarized, and arranged
# #
# # - Summarizers can also be formatted strings combining the results of
# #   multiple summarizers (e.g., `stat1 (stat2)`, `stat1, stat2`, etc.)
# #
# # - Summarizers might also generate small-multiples style graphics, icons, or emoji
# #
# # The positions of the cells within the table are specified by an *arrangement*.
# #
# # - Arrangements specify the display order of levels within factors and relative positions of groups of cells to one another
# #
# # - An arrangement involves the mapping of grouping factor(s) to:
# #   - rows and columns
# #   - facets
# #   - a tree/dendrogram?
# #   - others?
# #
# # A table's *features* are table-level metadata not defined by the data, including:
# # - title
# # - subtitle
# # - notes
# # - (hidden) label, identifier, etc.
# # - others?
# #
# # The *theme* (overall visual aesthetic) of the table is irrelevant to and must be separate from its content
# #
# # - any particular table arrangement can be formatted in multiple ways independent of the informational content of the table
# # 
# # - a table's *labels* are text that describe the grouping factors (typically displayed on the margins of the table);
# #   these might be displayed in many ways depending on the theme
# #
# # - the **xtable** approach of storing this theme information in the table itself constantly reveals its flaws and is too complex;
# #   all thematic information should be in a ggplot2-style theme() object that can easily be swapped out
# #
# # - ideally, themes are independent of the renderer, such that any theme can be rendered similarly in any markup language
# #
# # The *renderer* of the table should convey the cell content, layout, and theme in a markup language
# # - Possible renderer
# #   - markdown
# #   - latex
# #   - html
# #   - OpenDocument
# #   - docx
# #   - rtf
# #   - Excel
# #   - others?
# #
# # - Having a summarizer generate aesthetics can be complicated for rendering across markup languages and devices
# #
# 
# # Base R functionality that may be useful:
# # - aggregate()
# # - xtabs()
# # - ftable()
# # - table()
# # - ave()
# 
# # Relevant existing packages and functions:
# # - renderers
# #   - xtable
# #   - rtf
# #   - knitr::kable()
# #   - formattable
# #   - knitLatex
# #   - htmlTable
# #   - psytabs
# #   - SortableHTMLTables
# #   - tablaxlsx
# #   - table1xls
# #   - tableHTML
# #   - TableMonster
# #   - texreg
# #   - ztable
# #   - apaStyle
# #   - apaTables
# #   - apsrtable
# # - higher-level functionality
# #   - tables
# #   - stargazer
# #   - pixiedust
# #   - reporttools
# #   - rtable
# #   - summarytools
# #   - tab
# #   - tableone
# #   - carpenter
# #   - dtables
# #   - etable
# # - pivots
# #   - rpivotTable
# # - other
# #   - gtable
# 
# # Some motivations, comments, and issues to consider:
# # 
# # - The terminology "cross-table" and "table" is a not very useful distinction between the general class "table" and 
# #   the special case "cross-table" (cross tabulation; contingency table) where the number of grouping factors >= 2 
# #
# # - A pivot table reveals some of the grammar of tables well by interactively manipulating the grouping factors
# #
# # - Table "marginals" are simply table cells summarizing data without aggregating by >= 1 of the table's grouping factors
# # 
# # - A table may have many marginals and different levels of aggregation and using different summarizers;
# #   for example a table may have row means, but also column subtotals and totals
# #
# # - The `prop.table(table())` dance is stupid and confusing.
# 
# # Consider the following table, with several different arrangements:
# 
# |   | C | D |
# | A | 1 | 2 | 
# | B | 3 | 4 |
# 
# |   | C | D |
# | B | 3 | 4 | 
# | A | 1 | 2 |
# 
# |   | D | C |
# | A | 2 | 1 | 
# | B | 4 | 3 |
# 
# |   | D | C |
# | B | 4 | 3 | 
# | A | 2 | 1 |
# 
# | A | C | 1 |
# | A | D | 2 |
# | B | C | 3 |
# | B | D | 4 |
# 
# | B | C | 3 |
# | B | D | 4 |
# | A | C | 1 |
# | A | D | 2 |
# 
# | A | D | 2 |
# | A | C | 1 |
# | B | D | 4 |
# | B | C | 3 |
# 
# | B | D | 4 |
# | B | C | 3 |
# | A | D | 2 |
# | A | C | 1 |
# 
# | A | C | 1 |
# | B | C | 3 |
# | A | D | 2 |
# | B | D | 4 |
# 
# | A | D | 2 |
# | B | D | 4 |
# | A | C | 1 |
# | B | C | 3 |
# 
# | A | A | B | B |
# | C | D | C | D |
# | 1 | 2 | 3 | 4 |
# 
# | B | B | A | A |
# | C | D | C | D |
# | 3 | 4 | 1 | 2 |
# 
# | A | B | A | B |
# | C | C | D | D |
# | 1 | 3 | 2 | 4 |
# 
# # The `ftable()` structure might be particularly helpful:
# ftable(Titanic, row.vars = 1:3)
# ##                    Survived  No Yes
# ## Class Sex    Age                   
# ## 1st   Male   Child            0   5
# ##              Adult          118  57
# ##       Female Child            0   1
# ##              Adult            4 140
# ## 2nd   Male   Child            0  11
# ##              Adult          154  14
# ##       Female Child            0  13
# ##              Adult           13  80
# ## 3rd   Male   Child           35  13
# ##              Adult          387  75
# ##       Female Child           17  14
# ##              Adult           89  76
# ## Crew  Male   Child            0   0
# ##              Adult          670 192
# ##       Female Child            0   0
# ##              Adult            3  20
# str(ftable(Titanic, row.vars = 1:3))
# ##  ftable [1:16, 1:2] 0 118 0 4 0 154 0 13 35 387 ...
# ##  - attr(*, "row.vars")=List of 3
# ##   ..$ Class: chr [1:4] "1st" "2nd" "3rd" "Crew"
# ##   ..$ Sex  : chr [1:2] "Male" "Female"
# ##   ..$ Age  : chr [1:2] "Child" "Adult"
# ##  - attr(*, "col.vars")=List of 1
# ##   ..$ Survived: chr [1:2] "No" "Yes"
# #
# # this interesting printing of "ftable" objects is basically just `stats:::format.ftable()`
# 
# # this is basically the result of `aggregate()` with arrangement specified as an attribute
# aggregate(Freq ~ ., data = as.data.frame(Titanic), FUN = sum)
# ##    Class    Sex   Age Survived Freq
# ## 1    1st   Male Child       No    0
# ## 2    2nd   Male Child       No    0
# ## 3    3rd   Male Child       No   35
# ## 4   Crew   Male Child       No    0
# ## 5    1st Female Child       No    0
# ## 6    2nd Female Child       No    0
# ## 7    3rd Female Child       No   17
# ## 8   Crew Female Child       No    0
# ## 9    1st   Male Adult       No  118
# ## 10   2nd   Male Adult       No  154
# ## 11   3rd   Male Adult       No  387
# ## 12  Crew   Male Adult       No  670
# ## 13   1st Female Adult       No    4
# ## 14   2nd Female Adult       No   13
# ## 15   3rd Female Adult       No   89
# ## 16  Crew Female Adult       No    3
# ## 17   1st   Male Child      Yes    5
# ## 18   2nd   Male Child      Yes   11
# ## 19   3rd   Male Child      Yes   13
# ## 20  Crew   Male Child      Yes    0
# ## 21   1st Female Child      Yes    1
# ## 22   2nd Female Child      Yes   13
# ## 23   3rd Female Child      Yes   14
# ## 24  Crew Female Child      Yes    0
# ## 25   1st   Male Adult      Yes   57
# ## 26   2nd   Male Adult      Yes   14
# ## 27   3rd   Male Adult      Yes   75
# ## 28  Crew   Male Adult      Yes  192
# ## 29   1st Female Adult      Yes  140
# ## 30   2nd Female Adult      Yes   80
# ## 31   3rd Female Adult      Yes   76
# ## 32  Crew Female Adult      Yes   20
# 
# # Notes:
# # From Hadley (https://github.com/yihui/knitr/issues/53)
# ## Use "Manual of tabular presentation" from the census for basic structure and common layouts.
# ## http://www.iq.harvard.edu/blog/sss/archives/2009/03/writing_excel_o.shtml
# ## http://www.nettakeaway.com/tp/article/446/tabled
# ## http://stats.stackexchange.com/questions/3542/what-is-a-good-resource-on-table-design
# ## Look at Duncan Murdoch's tables package: https://cran.r-project.org/web/packages/tables/vignettes/tables.pdf
