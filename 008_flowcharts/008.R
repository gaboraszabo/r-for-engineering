# EDITION 008: FLOWCHARTS

# 0. INSTALL PACKAGE GGFLOWCHART AND LOAD LIBRARIES ----

install.packages("ggflowchart")

library(tidyverse)
library(sherlock)
library(ggflowchart)



# 1. GGFLOWCHART() FUNCTION ----

# 1.1 A SIMPLE EXAMPLE ----
simple_flow <- tibble(from = c("Step 1", "Step 2"),
                      to   = c("Step 2", "Step 3"))

ggflowchart(data = simple_flow)


# 1.2 DECISION TREE EXAMPLE ----
search_tree <- tibble(from = c(rep("What drives variation in bond strength?", times = 2), 
                               "Higher family group", "Higher family group", 
                               "Higher family group ", "Higher family group "), 
                      to   = c("Elemental variation", "Higher family group", 
                               "Cyclical variation", "Higher family group ", 
                               "Structural variation", "Temporal variation"))


ggflowchart(data = search_tree, text_size = 3.5, 
            x_nudge = 0.35, text_colour = "grey30", 
            arrow_colour = "grey50", color = "grey30")


# 2 FUNCTION TO CREATE SIMPLE FLOWCHARTS ----

draw_flowchart <- function(steps, category = NULL, horizontal = TRUE, chart_title = "", 
                           x_nudge = 0.1, y_nudge = 0.25) {
    
    process_steps <- steps
    
    processs_steps_length <- length(process_steps)
    
    from_column <- process_steps[1:processs_steps_length-1]
    to_column   <- process_steps[2:processs_steps_length]
    
    process_flow_tbl <- tibble(from = from_column,
                               to   = to_column)
    
    if (!is.null(category)) {
        nodes <- tibble(name = process_steps, 
                        type = category %>% as_factor())  
    }
    
    # plotting ----
    if (is.null(category)) {
        flowchart <- ggflowchart(process_flow_tbl, horizontal = horizontal) +
            scale_fill_sherlock()  
        
    } else {
        flowchart <- ggflowchart(process_flow_tbl, node_data = nodes, fill = type, horizontal = horizontal, 
                                 x_nudge = x_nudge, y_nudge = y_nudge) +
            scale_fill_sherlock()  
    }
    
    flowchart <- flowchart +
        labs(title = chart_title) +
        theme(plot.title   = element_text(color = "grey20"), 
              legend.title = element_blank(), 
              legend.text  = element_text(color = "grey20")
        )
    
    return(flowchart) 
    
}


# 3. TEST FUNCTION ----

# 3.1 STEPS OF A GRAVITY DIE CASTING PROCESS ----
casting_process_steps <- c("Core making", "Casting", "Shakeout", 
                           "Riser saw-off", "Cleaning", "Heat treatment", 
                           "Shot blasting", "Machining", "Final inspection")
# 3.2 METADATA (LOCATION WITHIN MANUFACTURING PLANT) ----
location <- c("Building 1", rep("Building 2", times = 6), rep("Building 3", times = 2))


# 3.3 DRAW_FLOWCHART() FUNCTION ----

# 3.3.1 No location information ----
draw_flowchart(steps = casting_process_steps, horizontal = FALSE, 
               chart_title = "Gravity Die Casting Process Steps")

# 3.3.2 WIth location information ----
draw_flowchart(steps = casting_process_steps, category = location, horizontal = FALSE, 
               chart_title = "Gravity Die Casting Process Steps")

