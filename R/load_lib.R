##' Load R files from /lib directory of project tree
##'
##' To save time and typing, this function will load R files from /lib
##' directory of project tree, either by name (such as \code{c("lib1",
##' "lib2")}) or all at once (default).
##' @title Load R files from /lib directory of project tree
##' @param str a character vector specifying the lib files to source,
##' defaults to "all", i.e., all R-files inside /lib will be sourced
##' @return nothing, invoked for side effects (sourcing of files)
##' @examples
##' \dontrun{load_lib()}
##' @export
load_lib <- function(str = "all", ...) {

  args <- match.call()[-1]

  nargs <- length(args)
  
  libs <- file.path(getwd(), "lib")

  if (any(as.character(str) == "all") & (nargs == 1)) {

    lib_files <- list.files(libs, pattern = "\\.R", full.names = TRUE)

    n <- length(lib_files)

    for (i in seq_len(n)) {
      source(lib_files[i])
    }
    
  } else {
    
    for (i in seq_len(nargs)) {

      lib_file <- paste(file.path(libs, as.character(args[[i]])), ".R", sep = "")
      
      if (file.exists(lib_file)) {
        source(lib_file)
      }
    }
  }
}