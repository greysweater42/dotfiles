options(scipen=999)

if (Sys.info()[["user"]] == "dyrkat") {
  .libPaths("~/.R/3.4.3")
} else {
  .libPaths("~/.R/3.4.2")
}

library(colorout)

local({
  r = getOption("repos")             
  r["CRAN"] <- "http://cran.us.r-project.org"
  options(repos = r)
})

# from the AER book by Zeileis and Kleiber
options(prompt="R> ", digits=4, show.signif.stars=FALSE)

# never save workspace
utils::assignInNamespace(
  "q", 
  function(save = "no", status = 0, runLast = TRUE) {
    .Internal(quit(save, status, runLast))
  }, 
  "base"
)
