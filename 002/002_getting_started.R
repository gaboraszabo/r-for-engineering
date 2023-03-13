# 0. INSTALLING PACKAGES ----
# This is a one-time thing

packages <- c("tidyverse", "sherlock", 'openxlsx')
install.packages(packages)


# 1. LOADING PACKAGES (LIBRARIES) ---
# You'll need to load packages every time you want to use them
library(tidyverse)
library(sherlock)


# 2. READING FILE INTO MEMORY ----

# 2.1 .XLSX FILES ----
openxlsx::read.xlsx(xlsxFile = "../../00_data/bond_strength.xlsx")

# 2.2 .CSV FILES ----
read.csv(file = "../../00_data/bond_strength.csv")

# 2.3 .TXT FILES ----
read_table(file = "../../00_data/bond_strength.txt")



# 2.4 ALL-IN-ONE USING SHERLOCK::LOAD_FILE() ----

load_file(path = "../../00_data/bond_strength.xlsx", filetype = ".xlsx")

load_file(path = "../../00_data/bond_strength.csv", filetype = ".csv")

load_file(path = "../../00_data/bond_strength.txt", filetype = ".txt")


# 3. ASSIGNING TO A VARIABLE CALLED "BOND_STRENGTH"
bond_strength <- load_file(path = "../../00_data/bond_strength.xlsx", filetype = ".xlsx")


# 
bond_strength %>% View()
View(bond_strength)

# 
bond_strength %>% glimpse()
glimpse(bond_strength)


bond_strength %>% 
    head()




bond_strength$Bond_Strength

bond_strength$Bond_Strength[1]


# 4. PLOT 
bond_strength %>% 
    draw_categorical_scatterplot(y_var = Bond_Strength, 
                                 grouping_var_1 = Line)

bond_strength %>% 
    draw_categorical_scatterplot(y_var = Bond_Strength, 
                                 grouping_var_1 = Line, 
                                 plot_means     = TRUE)

bond_strength %>% 
    draw_categorical_scatterplot(y_var = Bond_Strength, 
                                 grouping_var_1 = Line, 
                                 grouping_var_2 = x_time_numeric, size = 3, 
                                 jitter = FALSE)





bond_strength %>% 
    group_by(Line) %>% 
    summarize(mean_bond_stregnth = mean(Bond_Strength))


bond_strength %>% 
    mutate(Bond_Strength_N = Bond_Strength * 4.44822) %>% 
    select(index, Bond_Strength, Bond_Strength_N, everything())



