# EDITION 009: YOUDEN PLOT

# 0. LOAD PACKAGES ----

library(tidyverse)
library(sherlock)


# 1. DRAW_YOUDEN_PLOT() FUNCTION ----

# 1.1 REPEATABILITY ASSESSMENT ----

youden_plot_data %>% 
    draw_youden_plot(x_axis_var = measurement_1, y_axis_var = measurement_2, size = 3)

youden_plot_data %>% 
    draw_youden_plot(x_axis_var = measurement_1, y_axis_var = measurement_2, grouping_var = location)


# 1.2 METHOD COMPARISON ----
youden_plot_data_2 %>% 
    draw_youden_plot(x_axis_var = gage_1, 
                     y_axis_var = gage_2, 
                     size = 3)

# 1.2.1 MEDIAN LINE PLOTTED ----
youden_plot_data_2 %>% 
    draw_youden_plot(x_axis_var = gage_1, 
                     y_axis_var = gage_2, 
                     median_line = TRUE, 
                     size = 3, 
                     analysis_desc_label = "Method Comparison - gage 1 and 2")

