# WEEK 003: A PIVOTAL MOMENT

# 0. LOADING PACKAGES ----
library(tidyverse)
library(sherlock)


# 1. READ IN DATA ----

bond_strength_wide <- load_file("https://raw.githubusercontent.com/gaboraszabo/datasets-for-sherlock/main/bond_strength_wide.csv", 
                                filetype = ".csv")



# 2. DATA TRANSFORMATION ----

bond_strength_long <- bond_strength_wide %>% 
    
    # 2.1 Create "Cycle" column ---- 
mutate(Cycle = rep(1:3, times = 3) %>% as_factor()) %>% 
    
    # 2.2 Convert to long form ----
pivot_longer(cols = 2:6, names_to = "Line", values_to = "Bond_Strength") %>% 
    
    # 2.3 Remove "Line" string ----
mutate(Line = Line %>% str_remove("Line ")) %>% 
    
    # 2.4 Arrange by Time and Line variables (not absolutely necessary) ----
arrange(Time, Line)


bond_strength_long



# 3. PLOT DATA ----

# 3.1 STRATIFICATION BY LINE ----
bond_strength_long %>% 
    # calling the ggplot() function and creating a blank "canvas" (coordinate system)
    ggplot(aes(x = Line, y = Bond_Strength)) + 
    # adding a geom (visual)
    geom_point(size = 3.5, color = "darkblue", alpha = 0.3) +
    # adding a custom theme
    theme_sherlock() +
    # customizing labels
    labs(title = "Bond Strength Characterization Study", 
         y     = "Bond Strength [lbf]")



# 3.2 STRATIFICATION BY LINE USING DRAW_CATEGORICAL_SCATTERPLOT() FUNCTION ----
bond_strength_long %>% 
    draw_categorical_scatterplot(y_var = Bond_Strength, grouping_var_1 = Line, plot_means = TRUE, size = 3.5)







