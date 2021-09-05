# batch rename files

Book1 <- read.csv(file.choose())

wd <- dirname(file.path(file.choose()))

for (i in 1:dim(Book1)[1]) {
    
    oldfilepath <- paste0(wd, "/", Book1[i,2])
    
    newfilepath <- paste0(wd, "/",Book1[i,1],".txt")
    
    file.rename(from = oldfilepath, to = newfilepath)
    
}

