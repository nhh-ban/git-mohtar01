library(tidyverse)


#Code from Problem 2
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


#Problem 3:

#I start by making plots for the a_26 value since this represents the size of the galaxy
#Historgram
ggplot(galaxies_df, aes(x = as.numeric(a_26))) +
  geom_histogram(binwidth = 0.5, alpha = 0.7) +
  labs(x = "a_26", y = "Count")
#This doesnt really show an underepresentation, since there are a lot of observations of smaller objects.


ggplot(galaxies_df, aes(x = as.numeric(a_26))) +
  geom_density()
#Even the density plot doesnt really show the underrepresentation. 


#I didnt find anything yet so i continue with the variable = m_b, which also represents size
ggplot(galaxies_df, aes(x = as.numeric(m_b))) +
  geom_density()
# There is a clear normal distribution here which shows less observations for the smaller objects


#Next I will check out a mass variable: log_1k
ggplot(galaxies_df, aes(x = as.numeric(log_lk))) +
  geom_density()
#This one also shows lower density of observations for objects with less mass


#I think a reasonable explanation for this might be that smaller objects are more difficult to spot and observe
#thus there are less of them.