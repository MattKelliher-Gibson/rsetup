create_setup <- function() {
  f.code <- prepr::file_location("/Code")
  f.r <- prepr::file_location("/Code/R")
  f.setup <- prepr::file_location("/Code/R/P000_Setup.r")
  f.function <- prepr::file_location("/Code/R/P005_Functions.r")
  f.files <- prepr::file_location("/Files")

  i.options <- c("#############", "#I. Options #", "#############", "",
                 "#A. Memory Size", "", "\tmemory.limit(size = NA)", "",
                 "#B. stringsAsFactors", "", "\toptions(stringsAsFactors = FALSE)", "",

  ii.packages <- c("###############", "#II. Packages #", "###############\n",
                   "#A. prepr\n", "\tlibrary(prepr)\n",
                   "#B. rio\n", "\tlibrary(rio)\n",
                   "#C. tibble\n", "\tlibrary(tibble)\n",
                   "#D. dplyr\n", "\tlibrary(dplyr)\n",
                   "#E. tidyr\n", "\tlibrary(tidyr)\n",
                   "#F. purrr\n", "\tlibrary(purrr)\n",
                   "#G. DBI\n", "\tlibrary(DBI)\n",
                   "#H. obdc\n", "\tlibrary(odbc)\n")

  iii.variables <- c("#################", "#III. Variables #", "#################\n",
                     "#A. File Location\n", "\t#1. Import", "\t", "\t#2. Export\n",
                     "#B. Constant\n", "\t#1. SQL Query", "\t", "\t#2. Data Source Name\n")

  k.setup <- c(i.options, ii.packages, iii.variables)

  k.function <- c("#A. ", "\n")

  if(!dir.exists(f.code)) {
    dir.create(f.code)
    dir.create(f.r)
  } else if(!dir.exists(f.r)) {
    dir.create(f.r)
  }

  if(!dir.exists(f.files)) {
    dir.create(f.files)
  }

  readr::write_lines(k.setup, f.setup)
  readr::write_lines(k.function, f.function)
  file.edit(c(f.setup, f.function))
}
