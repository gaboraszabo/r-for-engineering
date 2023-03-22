# 0. INSTALLING PACKAGES ----
# This is a one-time thing

# 0.1 Either installing one package at a time ----
install.packages("tidyverse")
install.packages("sherlock")
install.packages("openxlsx")

# 0.2 or Installing multiple packages through concatenation ----
install.packages(c("tidyverse", "sherlock", 'openxlsx'))

# 0.3 or Assigning as a variable and calling it ----
packages <- c("tidyverse", "sherlock", 'openxlsx')
install.packages(packages)


# 1. LOADING PACKAGES (LIBRARIES) ---
# You'll need to load packages every time you intend to use them
library(tidyverse)
library(sherlock)
library(openxlsx)


# 2. READING FILE INTO MEMORY ----

# 2.1 From RStudio: Go to Environment -> Import Dataset ----

# 2.2 Programmatically: .XLSX FILES USING OPENXLSX::READ.XLSX() ----
read.xlsx(xlsxFile = "../../00_data/bond_strength.xlsx")

# 2.3 Programmatically: .CSV FILES USING READR::READ_CSV() ----
read_csv(file = "../../00_data/experiment_2.csv")

# 2.4 Programmatically: .TXT FILES USING READR::READ_TABLE() ----
read_table(file = "../../00_data/experiment_3_data.txt")


# 2.4 Programmatically: ALL-IN-ONE USING SHERLOCK::LOAD_FILE() ----

load_file(path = "../../00_data/bond_strength.xlsx", filetype = ".xlsx")
load_file(path = "../../00_data/experiment_2.csv", filetype = ".csv")
load_file(path = "../../00_data/experiment_3_data.txt", filetype = ".txt")


# 3. BASIC DATA EXPLORATION ----

# 3.1 ASSIGNING TO A VARIABLE CALLED "BOND_STRENGTH" ----
# Run the below function call by selecting lines 50-52 and hitting Ctrl + Enter. 
# Pulls file from GitHub and assigns it to a variable named bond_strength.
bond_strength <- load_file(
    path = "https://raw.githubusercontent.com/gaboraszabo/datasets-for-sherlock/main/bond_strength_multivari.csv", 
    filetype = ".csv")

# 3.2 DISPLAYING FIRST TEN ROWS IN THE CONSOLE ----
# Simply run this
bond_strength

# 3.3 VIEW()
bond_strength %>% View()
View(bond_strength)

# 3.4 GLIMPSE()
bond_strength %>% glimpse()
glimpse(bond_strength)

# 3.5 HEAD(), TAIL()
bond_strength %>% 
    head()




# 4. A SIMPLE PLOTTING FUNCTION ----

bond_strength %>% 
    draw_categorical_scatterplot(y_var = `Bond Strength`)


bond_strength %>% 
    draw_categorical_scatterplot(y_var = `Bond Strength`, 
                                 grouping_var_1 = `Bonding Station`,
                                 plot_means     = TRUE, 
                                 group_color    = TRUE)



bond_strength %>% 
    mutate(`Bonding Station` = `Bonding Station` %>% as_factor()) %>% 
    ggplot(aes(x = `Bonding Station`, y = `Bond Strength`, color = `Bonding Station`)) +
    geom_point() +
    stat_summary(fun = "mean", color = "black")



bond_strength %>% 
    draw_categorical_scatterplot(y_var  = `Bond Strength`, 
                                 grouping_var_1 = `Bonding Station`, 
                                 grouping_var_2 = `Stopcock Mold Cavity Number`, 
                                 size   = 3,
                                 jitter = FALSE)


