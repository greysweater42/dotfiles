options(scipen=999)

r_ver <- gsub("[a-zA-Z ]", "", gsub("\\s*\\([^\\)]+\\)", "", R.version.string))
r_lib_path <- paste("~", ".R", r_ver, sep = "/")
.libPaths(r_lib_path)

# default libraries
if ("colorout" %in% rownames(utils::installed.packages())) library(colorout)
if (Sys.info()[["user"]] == "dyrkat") {
  library(shiny)
  ra <- runApp
} 

# default CRAN mirror
local({
  r = getOption("repos")             
  r["CRAN"] <- "http://cran.us.r-project.org"
  options(repos = r)
})

# from the AER book by Zeileis and Kleiber
options(prompt="R> ", digits=4, show.signif.stars=FALSE)
