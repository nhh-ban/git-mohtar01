library(tidyverse)



file_path <- "C:/Users/abuba/Documents/Ban400/AssignmentGit/git-mohtar01/suites_dw_Table1.txt"
lines <- readLines(file_path)

#For the seperator line in the text
separator_line <- grep("^-----+", lines)

#Column names are one row above the seperator line
col_names <- str_split(lines[separator_line - 1], "\\|")[[1]]
col_names <- str_trim(col_names)

#The data comes after the seperator line, and is split by "\\|"
data_list <- lapply(lines[(separator_line + 1):length(lines)], function(line) {
  str_split(line, "\\|")[[1]]
})

galaxies_df <- as.data.frame(do.call(rbind, data_list), stringsAsFactors = FALSE)
colnames(galaxies_df) <- col_names

#Remove white space
galaxies_df <- galaxies_df %>% mutate_all(str_trim)

head(galaxies_df)

