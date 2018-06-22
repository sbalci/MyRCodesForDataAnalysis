install.packages("formattable")




install.packages("devtools")
library("devtools")
install_github("neuropsychology/psycho.R")
library("psycho")

install.packages("styler")




## Data Manipulation##
install.packages("tidyverse")
# tidyverse contains many packages for data manipulation, graphs etc
install.packages("splitstackshape")
# Really nice syntax for expanding datasets

# Basic Epi
install.packages("epiR")
# Some useful epitools especially 2*2 tables and stratified MH Odds
install.packages("lmtest")
# for doing likelihood ratio tests between models

# Poisson & Cox Regression & Survival Analysis
install.packages("Epi")
# Tools for Lexis Models
install.packages("popEpi")
# Extra tools to go with 'Epi' and make nice rate tables
install.packages("survival")
# for survial analysis, kaplan-meier plots and cox regression
install.packages("survminer")
# Really nice KM plots!

# Random-Effects Modeks
install.packages("lme4")
# For fitting random-effects models
install.packages("sjstats")
# For intraclass correlation coeffiecients from Random-effects models

# Multiple Imputation
install.packages("mice")
# For multiple imputation

install.packages("arsenal")
# Really nice summmary tables

# Complex survey data analysis
install.packages("survey")
# For handling complex survey data
install.packages("ICC")
# Alternative methods for ICC calculation from survey data

# Meta-analysis
install.packages("meta")
install.packages("metafor")

install.packages("workflowr")


install.packages("DiagrammeR")


install.packages("tangram")


devtools::install_github("lbusett/insert_table")



## Obtain names of all packages on CRAN
names.available.packages <- rownames(available.packages())

## Extract packages names that contain Rcmdr
Rcmdr.related.packages <- names.available.packages[grep("Rcmdr", names.available.packages)]
Rcmdr.related.packages

## Install these packages
install.packages(pkgs = Rcmdr.related.packages)










usePackage <- function(p) {
  if (!is.element(p, installed.packages()[, 1])) {
    install.packages(p, dep = TRUE)
  }
  require(p, character.only = TRUE)
}


file.edit("~/Desktop/foo/.Rprofile")
# This opens up a script window, within which you can enter in your library commands
library(ggplot2)
library(scales)
library(plyr)
library(reshape2)









install.packages("stargazer")
install.packages("pander")
install.packages("tables")
install.packages("ascii")
install.packages("xtable")

devtools::install_github("hadley/dplyr")


install.packages("gapminder")

install.packages("alluvial")


vignette("databases", package = "dplyr")

install.packages("robustbase")
install.packages("insuranceData")

install.packages("Lahman")


install.packages("tidyverse")

install.packages("qdap")

install.packages("openxlsx")


devtools::install_github("kassambara/r2excel")

install.packages("WriteXLS")
install.packages("XLConnect")
library(XLConnect)


if (!require(wordcloud)) {
  install.packages("wordcloud")
  library(wordcloud)
}


installed <- as.data.frame(installed.packages())
write.csv(installed, "installed_previously.csv")

installedPreviously <- read.csv("installed_previously.csv")
baseR <- as.data.frame(installed.packages())
toInstall <- setdiff(installedPreviously, baseR)

install.packages(toInstall)


packagelist <- installed.packages()
class(packagelist)
packagelist[, 1]

# AlgDesign                         BCA                   BiasedUrn
# "AlgDesign"                       "BCA"                 "BiasedUrn"
# BsMD                          ca                         clv
# "BsMD"                        "ca"                       "clv"
# coin                    combinat                 conf.design
# "coin"                  "combinat"               "conf.design"
# date                      deldir                  depthTools
# "date"                    "deldir"                "depthTools"
# DiceDesign                    DoE.base                 DoE.wrapper
# "DiceDesign"                  "DoE.base"               "DoE.wrapper"
# doParallel                      ENmisc                        epiR
# "doParallel"                    "ENmisc"                      "epiR"
# estimability                          ez                   flexclust
# "estimability"                        "ez"                 "flexclust"
# foreach                    fracdiff                        FrF2
# "foreach"                  "fracdiff"                      "FrF2"
# ggthemes                     goftest                    gridBase
# "ggthemes"                   "goftest"                  "gridBase"
# igraph                       irlba                   iterators
# "igraph"                     "irlba"                 "iterators"
# lhs                     lsmeans                  modeltools
# "lhs"                   "lsmeans"                "modeltools"
# NLP                         NMF                     ordinal
# "NLP"                       "NMF"                   "ordinal"
# orloca                   orloca.es                    pkgmaker
# "orloca"                 "orloca.es"                  "pkgmaker"
# polyclip                    quadprog                    quantmod
# "polyclip"                  "quadprog"                  "quantmod"
# R2HTML                   randtests             RcmdrPlugin.BCA
# "R2HTML"                 "randtests"           "RcmdrPlugin.BCA"
# RcmdrPlugin.coin      RcmdrPlugin.depthTools             RcmdrPlugin.DoE
# "RcmdrPlugin.coin"    "RcmdrPlugin.depthTools"           "RcmdrPlugin.DoE"
# RcmdrPlugin.doex         RcmdrPlugin.EACSPIR             RcmdrPlugin.EBM
# "RcmdrPlugin.doex"       "RcmdrPlugin.EACSPIR"           "RcmdrPlugin.EBM"
# RcmdrPlugin.epack             RcmdrPlugin.EZR       RcmdrPlugin.KMggplot2
# "RcmdrPlugin.epack"           "RcmdrPlugin.EZR"     "RcmdrPlugin.KMggplot2"
# RcmdrPlugin.mosaic        RcmdrPlugin.MPAStats          RcmdrPlugin.orloca
# "RcmdrPlugin.mosaic"      "RcmdrPlugin.MPAStats"        "RcmdrPlugin.orloca"
# RcmdrPlugin.plotByGroup            RcmdrPlugin.qual            RcmdrPlugin.SCDA
# "RcmdrPlugin.plotByGroup"          "RcmdrPlugin.qual"          "RcmdrPlugin.SCDA"
# RcmdrPlugin.seeg             RcmdrPlugin.SLC              RcmdrPlugin.SM
# "RcmdrPlugin.seeg"           "RcmdrPlugin.SLC"            "RcmdrPlugin.SM"
# RcmdrPlugin.steepness        RcmdrPlugin.survival   RcmdrPlugin.TeachingDemos
# "RcmdrPlugin.steepness"      "RcmdrPlugin.survival" "RcmdrPlugin.TeachingDemos"
# RcmdrPlugin.temis             RcmdrPlugin.UCA               RcppArmadillo
# "RcmdrPlugin.temis"           "RcmdrPlugin.UCA"             "RcppArmadillo"
# registry                     reshape                    rngtools
# "registry"                   "reshape"                  "rngtools"
# rpart.plot                         rsm               scatterplot3d
# "rpart.plot"                       "rsm"             "scatterplot3d"
# SCMA                        SCRT                        SCVA
# "SCMA"                      "SCRT"                      "SCVA"
# seeg                     sfsmisc                    sgeostat
# "seeg"                   "sfsmisc"                  "sgeostat"
# slam                         SLC                    spatstat
# "slam"                       "SLC"                  "spatstat"
# spatstat.utils                   steepness               TeachingDemos
# "spatstat.utils"                 "steepness"             "TeachingDemos"
# tensor                    timeDate                     tkrplot
# "tensor"                  "timeDate"                   "tkrplot"
# tm                     tseries                         TTR
# "tm"                   "tseries"                       "TTR"
# ucminf                         vcd                         xts
# "ucminf"                       "vcd"                       "xts"
# abind                     acepack               AnnotationDbi
# "abind"                   "acepack"             "AnnotationDbi"
# aplpack                         arm                  assertthat
# "aplpack"                       "arm"                "assertthat"
# backports                        base                   base64enc
# "backports"                      "base"                 "base64enc"
# BH                       bindr                    bindrcpp
# "BH"                     "bindr"                  "bindrcpp"
# Biobase                BiocGenerics               BiocInstaller
# "Biobase"              "BiocGenerics"             "BiocInstaller"
# bit                       bit64                      bitops
# "bit"                     "bit64"                    "bitops"
# blob                        boot                       broom
# "blob"                      "boot"                     "broom"
# car                     caTools                  cellranger
# "car"                   "caTools"                "cellranger"
# checkmate                       class                     cluster
# "checkmate"                     "class"                   "cluster"
# coda                   codetools                  colorspace
# "coda"                 "codetools"                "colorspace"
# compiler                        curl                  data.table
# "compiler"                      "curl"                "data.table"
# datasets                         DBI                   dichromat
# "datasets"                       "DBI"                 "dichromat"
# digest                       dplyr                       e1071
# "digest"                     "dplyr"                     "e1071"
# effects                    evaluate                     forcats
# "effects"                  "evaluate"                   "forcats"
# foreign                     formatR                     Formula
# "foreign"                   "formatR"                   "Formula"
# gdata                     ggplot2                       ggvis
# "gdata"                   "ggplot2"                     "ggvis"
# glue                    graphics                   grDevices
# "glue"                  "graphics"                 "grDevices"
# grid                   gridExtra                      gtable
# "grid"                 "gridExtra"                    "gtable"
# gtools                       haven                       highr
# "gtools"                     "haven"                     "highr"
# Hmisc                         hms                   htmlTable
# "Hmisc"                       "hms"                 "htmlTable"
# htmltools                 htmlwidgets                      httpuv
# "htmltools"               "htmlwidgets"                    "httpuv"
# httr                     IRanges                    jsonlite
# "httr"                   "IRanges"                  "jsonlite"
# KernSmooth                       knitr                    labeling
# "KernSmooth"                     "knitr"                  "labeling"
# lattice                latticeExtra                    lazyeval
# "lattice"              "latticeExtra"                  "lazyeval"
# leaps                        lme4                      lmtest
# "leaps"                      "lme4"                    "lmtest"
# lubridate                    magrittr                    markdown
# "lubridate"                  "magrittr"                  "markdown"
# MASS                      Matrix                  matrixcalc
# "MASS"                    "Matrix"                "matrixcalc"
# MatrixModels                     memoise                     methods
# "MatrixModels"                   "memoise"                   "methods"
# mgcv                          mi                        mime
# "mgcv"                        "mi"                      "mime"
# minqa                      mnormt                      modelr
# "minqa"                    "mnormt"                    "modelr"
# multcomp                     munsell                     mvtnorm
# "multcomp"                   "munsell"                   "mvtnorm"
# nlme                      nloptr                        nnet
# "nlme"                    "nloptr"                      "nnet"
# nortest                     openssl                    parallel
# "nortest"                   "openssl"                  "parallel"
# pbkrtest                   pkgconfig                       plogr
# "pbkrtest"                 "pkgconfig"                     "plogr"
# plyr                       psych                       purrr
# "plyr"                     "psych"                     "purrr"
# quantreg                          R6                       Rcmdr
# "quantreg"                        "R6"                     "Rcmdr"
# RcmdrMisc                RColorBrewer                        Rcpp
# "RcmdrMisc"              "RColorBrewer"                      "Rcpp"
# RcppEigen                       readr                      readxl
# "RcppEigen"                     "readr"                    "readxl"
# relimp                     rematch                    reshape2
# "relimp"                   "rematch"                  "reshape2"
# rgl                      RISmed                       rJava
# "rgl"                    "RISmed"                     "rJava"
# rlang                   rmarkdown                      RMySQL
# "rlang"                 "rmarkdown"                    "RMySQL"
# rpart                   rprojroot                     RSQLite
# "rpart"                 "rprojroot"                   "RSQLite"
# rvest                   S4Vectors                    sandwich
# "rvest"                 "S4Vectors"                  "sandwich"
# scales                     selectr                         sem
# "scales"                   "selectr"                       "sem"
# shiny                 shinythemes                 sourcetools
# "shiny"               "shinythemes"               "sourcetools"
# SparseM                     spatial                     splines
# "SparseM"                   "spatial"                   "splines"
# stats                      stats4                     stringi
# "stats"                    "stats4"                   "stringi"
# stringr                    survival                       tcltk
# "stringr"                  "survival"                     "tcltk"
# tcltk2                     TH.data                      tibble
# "tcltk2"                   "TH.data"                    "tibble"
# tidyr                   tidyverse                       tools
# "tidyr"                 "tidyverse"                     "tools"
# utils                     viridis                 viridisLite
# "utils"                   "viridis"               "viridisLite"
# XLConnect               XLConnectJars                        xml2
# "XLConnect"             "XLConnectJars"                      "xml2"
# xtable                        yaml                         zoo
# "xtable"                      "yaml"                       "zoo"



install.packages("Rcmdr")
install.packages("RcmdrPlugin.BCA")
install.packages("RcmdrPlugin.coin")
install.packages("RcmdrPlugin.depthTools")
install.packages("RcmdrPlugin.doBy")
install.packages("RcmdrPlugin.DoE")
install.packages("RcmdrPlugin.doex")
install.packages("RcmdrPlugin.EACSPIR")
install.packages("RcmdrPlugin.EBM")
install.packages("RcmdrPlugin.epack")
install.packages("RcmdrPlugin.EZR")
install.packages("RcmdrPlugin.HH")
install.packages("RcmdrPlugin.IPSUR")
install.packages("RcmdrPlugin.KMggplot2")
install.packages("RcmdrPlugin.mosaic")
install.packages("RcmdrPlugin.MPAStats")
install.packages("RcmdrPlugin.orloca")
install.packages("RcmdrPlugin.plotByGroup")
install.packages("RcmdrPlugin.qcc")
install.packages("RcmdrPlugin.qual")
install.packages("RcmdrPlugin.SCDA")
install.packages("RcmdrPlugin.seeg")
install.packages("RcmdrPlugin.SLC")
install.packages("RcmdrPlugin.SM")
install.packages("RcmdrPlugin.StatisticalURV")
install.packages("RcmdrPlugin.steepness")
install.packages("RcmdrPlugin.survival")
install.packages("RcmdrPlugin.TeachingDemos")
install.packages("RcmdrPlugin.temis")
install.packages("RcmdrPlugin.UCA")

source("https://bioconductor.org/biocLite.R")
biocLite()

install.packages("tidyverse")
install.packages("devtools")

devtools::install_github("hadley/colformat")
devtools::install_github("ropenscilabs/skimr")

install.packages("hflights")
install.packages("dbplyr")
install.packages("xlsx")

require(devtools)
install_github("ProjectMOSAIC/mosaic")

install.packages("jmv")

install.packages("tm")
install.packages("wordcloud")
install.packages("https://cran.r-project.org/src/contrib/Archive/tm/tm_0.6.tar.gz", repos = NULL)
install.packages("SnowballC")
install.packages("RColorBrewer")
install.packages("tidytext")

install.packages("packrat")

install.packages("testthat")

install.packages("prettydoc")
install.packages("rmdformats")

install.packages(c("fivethirtyeight", "tidyverse", "knitr", "kableExtra", "ggthemes"))

library(devtools)
install_github("SPSStoR", username = "lebebr01")
library(SPSStoR)



ip <- installed.packages()
pkgs.to.remove <- ip[!(ip[, "Priority"] %in% c("base", "recommended")), 1]
sapply(pkgs.to.remove, remove.packages)
sapply(pkgs.to.remove, install.packages)




install.packages("devtools")
devtools::install_github("AndreaCirilloAC/updateR")
library(updateR)
updateR(admin_password = "") # Where "PASSWORD" stands for your system password




survival

survminer

install.packages("tutorial")


devtools::install_github("romainfrancois/highlight")

install.packages("highr", repos = "http://rforge.net", type = "source")



install.packages("xplain")
