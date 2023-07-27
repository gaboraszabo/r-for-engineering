# EDITION 010: CREATING A PROJECT SUBFOLDER STRUCTURE ----

# 0. LOAD PACKAGES ----
library(tidyverse)
library(sherlock)


# 1. CREATE A DIRECTORY NAMED ENGINEERING_PROJECTS ----
fs::dir_create(path = "Engineering_Projects")

# 2. USE CREATE_PROJECT_FOLDER() ----
sherlock::create_project_folder(folder_name = "001_XYZ_Study", path = "Engineering_Projects/")