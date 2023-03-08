# INSTALL PACKAGES ----
# This is a one-time thing

packages <- c("tidyverse", "sherlock", 'openxlsx')
install.packages(packages)


# LOAD LIBRARIES ---
library(tidyverse)
library(sherlock)


# 2. READ FILE INTO MEMORY ----

# 2.1 .XLSX FILES ----
openxlsx::read.xlsx(xlsxFile = )


# 2.2 .CSV FILES ----
read.csv()

# 2.3 .TXT FILES ----
read_table()



# 2.4 ALL-IN-ONE USING SHERLOCK::LOAD_FILE() ----

load_file()