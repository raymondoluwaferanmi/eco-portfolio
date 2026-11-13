# 00_setup.R — install and lock packages
# Run ONCE. Then commit renv.lock to GitHub.

install.packages(c("renv", "tidyverse", "fixest", "countrycode",
                   "WDI", "eurostat", "patchwork", "kableExtra", "broom"))

renv::init()
renv::snapshot()