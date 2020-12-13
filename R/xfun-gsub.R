x = glue::glue("---", "\n",
     "# aaabbbb"
)

x

gsub(pattern = "---\n#", replacement = "#", x = x)

xfun::gsub_dir(pattern = "---", 
               replacement = "",
               ext = c("Rmd")
               )

