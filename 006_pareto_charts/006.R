# WEEK 006: PRIORITIES, PRIORITIES - PARETO CHARTS

# 0. LIBRARIES

# install.packages("devtools")
devtools::install_github("gaborszabo11/sherlock")

 
library(tidyverse)
library(sherlock)


# 1. LOAD FILE ----
auto_recalls <- load_file("https://raw.githubusercontent.com/gaboraszabo/datasets-for-sherlock/main/auto_recalls_1966_2023.csv", ".csv")


auto_recalls

# 2.1 PARETO CHART FOR NUMBER OF RECALLS BY TYPE OF COMPONENT, 1966-2023 ----
auto_recalls %>%
  draw_pareto_chart(cat_var = Component, summarize = TRUE)

auto_recalls <- auto_recalls %>%
  mutate(Component = Component %>% str_to_title())


auto_recalls %>%
  draw_pareto_chart(cat_var     = Component, 
                    summarize   = TRUE, 
                    title_label = "NHTSA Automobile Recalls, 1966-2023")


# 2.2 PARETO CHART FORMATTED ----
auto_recalls %>%
  draw_pareto_chart(cat_var   = Component,
                    summarize = TRUE,
                    highlight_first_n_items = 1,
                    lump_last_n_items       = 20,
                    lumped_cat_name = "Other Components")


# 2.3 GROUPED PARETO FOR NUMBER OF RECALLS BY TYPE OF COMPONENT GROUPED BY TYPE OF RECALL, 1966-2023 ----
auto_recalls %>%
  draw_pareto_chart_grouped(cat_var = Component,
                            grouping_var = `Recall Type`,
                            summarize = TRUE,
                            highlight_first_n_items = 1)

# 2.4 GROUPED PARETO FOR NUMBER OF VEHICLES POTENTIALLY AFFECTED BY TYPE OF COMPONENT GROUPED BY TYPE OF RECALL, 1966-2023 ----
auto_recalls %>%
  group_by(`Recall Type`, Component) %>%
  summarize(Sum_Potentially_Affected = sum(`Potentially Affected`)) %>%
  drop_na() %>%
  draw_pareto_chart_grouped(cat_var = Component,
                            grouping_var = `Recall Type`,
                            summarize = FALSE,
                            continuous_var = Sum_Potentially_Affected,
                            highlight_first_n_items = 1)


# 2.4.1 FIXED X AXIS FOR COMPARISON ----
auto_recalls %>%
  group_by(`Recall Type`, Component) %>%
  summarize(Sum_Potentially_Affected = sum(`Potentially Affected`)) %>%
  drop_na() %>%
  draw_pareto_chart_grouped(cat_var = Component,
                            grouping_var = `Recall Type`,
                            summarize = FALSE,
                            continuous_var = Sum_Potentially_Affected,
                            x_axis_span = "fixed",
                            highlight_first_n_items = 1)


