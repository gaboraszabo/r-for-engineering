# WEEK 007: DATA DISTRIBUTION PLOTTING WITH KERNEL DENSITY ESTIMATION

# 0. INSTALL PACKAGE AND LOAD LIBRARIES ----

install.packages("overlapping")

library(tidyverse)
library(sherlock)
library(overlapping)


# 1. SET.SEED() FOR REPRODUCIBILITY ----
set.seed(132535)

# 2. CREATE DATASET ----
product_stress <- tibble(strength = rnorm(n = 100, mean = 38, sd = 5),
                         stress   = rlnorm(n = 100, meanlog = 3, sdlog = 0.1))

# 2.1 TRANSFORM DATASET FOR PLOTTING ----
product_stress_pivoted <- product_stress %>% 
    pivot_longer(cols = everything(), names_to = "type", values_to = "value")


# 3. PLOTTING ----

# 3.1 ----
product_stress_pivoted %>% 
    draw_categorical_scatterplot(y_var = value, 
                                 grouping_var_1 = type, 
                                 group_color    = TRUE, 
                                 alpha          = 0.3)

# 3.2 DENSITY PLOT ----
product_stress_pivoted %>% 
    ggplot(aes(value)) +
    geom_density(aes(fill = type), alpha = 0.2, color = "grey80") +
    scale_x_continuous(limits = c(0, 60), labels = scales::number_format(accuracy = 1)) +
    theme_sherlock() +
    scale_fill_sherlock()


# 4. JOINT PROBABILITY CALCULATION (OVERLAPPING AREA) ----

two_distributions <- as.list(product_stress)

overlapping::overlap(two_distributions)

joint_probability <- overlapping::overlap(two_distributions)$OV

joint_probability



# 4. ADDING JOINT PROBABILITY TO DENSITY PLOT ----
product_stress %>% 
    pivot_longer(cols = everything(), names_to = "type", values_to = "value") %>% 
    
    ggplot(aes(value)) +
    geom_density(aes(fill = type), alpha = 0.2, color = "grey80") +
    scale_x_continuous(limits = c(0, 60), labels = scales::number_format(accuracy = 1)) +
    theme_sherlock() +
    scale_fill_sherlock() +
    annotate(geom = "text", x = 40, y = 0.09, 
             label = str_glue("Joint probability: {joint_probability %>% scales::percent(accuracy = 0.01)}"), 
             color = "grey50", size = 5)



