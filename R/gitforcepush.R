# gitUpdateCommitPush
CommitMessage <- paste("updated on ", Sys.time(), sep = "")
wd <- getwd()
gitCommand <- paste("cd ", wd, " \n git add . \n git commit --message '", CommitMessage, "' \n git push origin master \n", sep = "")
# gitCommand <- paste("cd ", wd, " \n git add . \n git commit --no-verify --message '", CommitMessage, "' \n git push origin master \n", sep = "")
system(command = gitCommand, intern = TRUE)