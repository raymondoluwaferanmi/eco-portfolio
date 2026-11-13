# 01_download_data.R
library(eurostat)
library(WDI)
library(tidyverse)

dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)

# ---- EU ETS verified emissions by country-year ----
message("Downloading Eurostat ETS data...")
ets <- get_eurostat("env_ac_ets", time_format = "num")
write_csv(ets, "data/raw/eurostat_ets.csv")

# ---- World Bank controls ----
message("Downloading World Bank data...")
wdi <- WDI(
  country  = "all",
  indicator = c(
    gdp_pc   = "NY.GDP.PCAP.KD",
    pop      = "SP.POP.TOTL",
    industry = "NV.IND.TOTL.ZS"
  ),
  start = 2005, end = 2023
)
write_csv(wdi, "data/raw/wdi_controls.csv")

message("✅ Raw data downloaded.")