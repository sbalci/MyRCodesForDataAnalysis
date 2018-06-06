
# https://suatatan.wordpress.com/2017/10/07/bulk-replacing-turkish-characters-in-r/

makeNames(tolower(names(MDL307_Data)))

to.plain(names(MDL307_Data))

#turkce karakter donusumu
to.plain <- function(s) {
        # 1 character substitutions
    old1 <- "çğşıüöÇĞŞİÖÜ"
    new1 <- "cgsiuocgsiou"
    s1 <- chartr(old1, new1, s)
    # 2 character substitutions
    old2 <- c("œ", "ß", "æ", "ø")
    new2 <- c("oe", "ss", "ae", "oe")
    s2 <- s1
    for(i in seq_along(old2)) s2 <- gsub(old2[i], new2[i], s2, fixed = TRUE)
    s2
}
df$source=as.vector(sapply(df$source,to.plain))

