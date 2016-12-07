create_setup <- function() {
  f.code <- prepr::file_location("/Code")
  f.r <- prepr::file_location("/Code/R")
  f.setup <- file_location("/Code/R/P000_Setup.r")

  i.options <- c("#############", "#I. Options #", "#############", "",
                 "#A. Memory Size", "", "\tmemory.limit(size = NA)", "",
                 "#B. stringsAsFactors", "", "\toptions(stringsAsFactors = FALSE)", "")

  ii.packages <- c("###############", "#II. Packages #", "###############\n",
                   "#A. prepr\n", "\tlibrary(prepr)\n",
                   "#B. readr\n", "\tlibrary(readr)\n",
                   "#C. tibble\n", "\tlibrary(tibble)\n",
                   "#D. dplyr\n", "\tlibary(dplyr)\n",
                   "#E. tidyr\n", "\tlibrary(tidyr)\n",
                   "#F. purrr\n", "\tlibrary(purrr)\n",
                   "#G. RODBC\n", "\tlibrary(RODBC)\n")

  iii.variables <- c("#################", "#III. Variables #", "#################\n",
                     "#A. File Location\n", "\t#1. Import", "\t", "\t#2. Export\n",
                     "#B. Constant\n", "\t#1. SQL Query", "\t", "\t#2. Data Source Name\n")

  k.setup <- c(i.options, ii.packages, iii.variables)

  if(!dir.exists(f.code)) {
    dir.create(f.code)
    dir.create(f.r)
  } else if(!dir.exists(f.r)) {
    dir.create(f.r)
  }

  readr::write_lines(k.setup, f.setup)
  file.edit(f.setup)
}
