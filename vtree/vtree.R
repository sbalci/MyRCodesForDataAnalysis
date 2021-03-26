library(vtree)

vtree(build.data.frame(
  c("pet","breed","size"),
  list("dog","golden retriever","large",5),
  list("cat","tabby","small",2),
  list("dog","Dalmation","various",101),
  list("cat","Abyssinian","small",5),
  list("cat","Abyssinian","large",22),
  list("cat","tabby","large",86)))

(mytree <- vtree(
  build.data.frame(
  c("StudyPopulation","Tubular","Histotype", "MMR", "PDL1")
  , list("exclude", NA, NA, NA, NA, 232)
  , list("include", "tubular", "Int", "dMMR", "", 8)
  , list("include", "tubular", "Int", "pMMR", "", 27)
  , list("include", "tubular", "PB", "dMMR", "", 8)
  , list("include", "tubular", "PB", "pMMR", "", 46)
  , list("include", "nontubular", "Focal Mucinous", "dMMR", "", 6)
  , list("include", "nontubular", "Focal Mucinous", "pMMR", "", 11)
  , list("include", "nontubular", "Mucinous >50%", "pMMR", "", 17)
  , list("include", "nontubular", "Medullary", "dMMR", "", 7)
  , list("include", "nontubular", "Medullary", "pMMR", "", 1)
  , list("include", "nontubular", "AdenoSq", "pMMR", "", 2)
  , list("include", "nontubular", "PCC", "pMMR", "", 2)
  , list("include", "nontubular", "Poorly Diff \n Sarcomatoid", "pMMR", "", 9)
  
)
, "StudyPopulation Tubular Histotype MMR PDL1"
, prunebelow = list(StudyPopulation = "exclude")
# showlegend=TRUE,
# shownodelabels=TRUE
# , horiz=FALSE
# , plain=TRUE
, sameline=TRUE
)
)

cat(
  as.character(mytree[["x"]][["diagram"]])
  , sep = "\n"
  , file = here::here("output.gv")
  , append = TRUE
  )


DiagrammeR::grViz(diagram = here::here("vtree", "output.gv"))

  