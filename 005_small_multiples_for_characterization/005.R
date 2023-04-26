# WEEK 005: SMALL MULTIPLES, HUGE ADVANTAGE

# 0. LOAD LIBRARIES ----
library(tidyverse)
library(sherlock)


# 1. READ IN DATA ----
bond_strength_wide <- load_file("https://raw.githubusercontent.com/gaboraszabo/datasets-for-sherlock/main/bond_strength_wide.csv", 
                                filetype = ".csv")

# 2. DATA TRANSFORMATION ----
bond_strength_long <- bond_strength_wide %>%
    mutate(Cycle = rep(1:3, times = 3) %>% as_factor()) %>% 
    pivot_longer(cols = 2:6, names_to = "Line", values_to = "Bond_Strength") %>% 
    mutate(Line = Line %>% str_remove("Line ")) %>% 
    arrange(Time, Line)


# 3. MULTIVARI PLOT ----

bond_strength_long %>% 
    draw_multivari_plot(response = Bond_Strength, 
                        factor_1 = Cycle, 
                        factor_2 = Line, 
                        factor_3 = Time)


