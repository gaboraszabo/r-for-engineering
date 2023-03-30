# WEEK 004: SMALL MULTIPLES, HUGE ADVANTAGE

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


# 3. PLOTTING ----

# 3.1 LINE PLOT - FIRST ATTEMPT ----
bond_strength_long %>% 
    ggplot(aes(Cycle, Bond_Strength)) +
    geom_line() +
    theme_sherlock()

# 3.2 LINE PLOT - SECOND ATTEMPT ----
bond_strength_long %>% 
    ggplot(aes(Cycle, Bond_Strength, group = Line)) +
    geom_line() +
    theme_sherlock()

# 3.3 LINE PLOT WITH FACET_WRAP() ----
bond_strength_long %>% 
    ggplot(aes(Cycle, Bond_Strength, group = Line, color = Line)) +
    geom_line() +
    facet_wrap(~ Time) +
    theme_sherlock()


bond_strength_long %>% 
    ggplot(aes(Cycle, Bond_Strength, group = Time, color = Time)) +
    geom_line() +
    facet_wrap(~ Line, nrow = 1) +
    theme_sherlock()


# 3.4 FACET_GRID() ----
bond_strength_long %>% 
    ggplot(aes(Cycle, Bond_Strength, group = Time, color = Time)) +
    geom_line() +
    facet_grid(Time ~ Line) +
    theme_sherlock()
    
