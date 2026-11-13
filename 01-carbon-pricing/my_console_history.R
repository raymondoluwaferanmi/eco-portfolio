q()
5+7
abs[-17]
abs[-17]
5+6
a <- 5
b <- 6
a+b
sum(a,b)
gdp
gdp <- c(120, 135, 142, 155, 168, 180, 195, 210, 225, 240)
gdp
mean(gdp)
sd(gdp)
inflation <- c(8.2, 9.1, 10.5, 11.2, 12.0, 13.5, 14.1, 15.3, 16.0, 17.2)
inflation
data <- data.frame(gdp, inflation)
summary(data)
names(data)
str(data)
data$gdp
data[1, ]
data[1:5, ]
cor(data$gdp, data$inflation)
cor(data$gdp, data$inflation)
model <- lm(gdp ~ inflation, data = data)
summary(model)
coef(model)
summary(model)
...
...
Coefficients:
Estimate Std. Error t value Pr(>|t|)
Coefficients:
summary(model)
Coefficients:
summary(model)
model
summary(model)
summary(model)
coef(summary(model))
t value
13.277319 / 0.5079505
</box>
# 3. View the regression table
summary(model)
# 6. View the regression results
summary(capm_model)
install.packages("WDI")
library(WDI)
data <- WDI(
country = c("NG", "GH", "KE", "ZA"),
indicator = c(
GDP_GROWTH = "NY.GDP.MKTP.KD.ZG",
INFLATION = "FP.CPI.TOTL.ZG",
GDP_PC = "NY.GDP.PCAP.CD",
POPULATION = "SP.POP.TOTL",
FDI = "BX.KLT.DINV.WD.GD.ZS"
),
start = 2000,
end = 2024
)
head(data)
dim(data)
names(data)
str(data)
summary(data)
data[which.min(data$GDP_GROWTH), ]
data[which.max(data$GDP_GROWTH), ]
data$GDP_GROWTH
which.min(data$GDP_GROWTH)data[ ... , ]
nrow(df)
dplyr::n_distinct(df$country)
nrow(df)
ls()
names(data)
dim(data)
ls()
class(model)
names(model)
formula(model)
summary(model)
source("C:/Users/pc/eco-portfolio/01-carbon-pricing/code/00_setup.R")
source("C:/Users/pc/eco-portfolio/01-carbon-pricing/code/00_setup.R")
setwd("C:/Users/pc/eco-portfolio/01-carbon-pricing")
library(eurostat)
install.packages(c("tidyverse", "fixest", "countrycode", "WDI", "eurostat", "patchwork", "kableExtra", "broom"))
setwd("C:/Users/pc/eco-portfolio/01-carbon-pricing")
library(eurostat)
install.packages("eurostat")
setwd("C:/Users/pc/eco-portfolio/01-carbon-pricing")
getwd()
list.files("data/raw")
ets <- get_eurostat("env_ac_ainah_r2", time_format = "num")
library(eurostat)
install.packages("eurostat", dependencies = TRUE)
library(eurostat)
install.packages("stringi")
install.packages("stringi")
install.packages("C:/Users/pc/Downloads/stringi_1.8.9.zip", repos = NULL, type = "win.binary")
library(eurostat)
ets_data <- get_eurostat("env_ac_ainah_r2", time_format = "num")
list.files("data/raw")
list.files("data/raw")
list.files("data/raw")
library(WDI)
library(readr)
# Download GDP per capita
wdi_data <- WDI(
country = "all",
indicator = "NY.GDP.PCAP.KD",
start = 2005,
end = 2023
)
# Rename the column to match our script
wdi_data <- wdi_data %>% rename(gdp_pc = NY.GDP.PCAP.KD)
library(tidyverse)
library(WDI)
library(readr)
# Download GDP per capita
wdi_data <- WDI(
country = "all",
indicator = "NY.GDP.PCAP.KD",
start = 2005,
end = 2023
)
# Rename the column to match our script
wdi_data <- wdi_data %>% rename(gdp_pc = NY.GDP.PCAP.KD)
# Save it
write_csv(wdi_data, "data/raw/wdi_controls.csv")
message("✅ World Bank data saved!")
list.files("data/raw")
library(tidyverse)
library(countrycode)
# 1. Load the raw data
ets <- read_csv("data/raw/eurostat_emissions.csv", show_col_types = FALSE)
wdi <- read_csv("data/raw/wdi_controls.csv", show_col_types = FALSE)
# 2. Clean Eurostat data
ets_clean <- ets %>%
filter(airpol == "CO2", nace_r2 == "TOTAL") %>%
select(geo, TIME_PERIOD, OBS_VALUE) %>%
rename(iso2 = geo, year = TIME_PERIOD, emissions = OBS_VALUE) %>%
mutate(iso3 = countrycode(iso2, "iso2c", "iso3c")) %>%
filter(!is.na(iso3), !is.na(emissions))
library(readr)
ets <- read_csv("data/raw/eurostat_emissions.csv", show_col_types = FALSE)
names(ets)
library(tidyverse)
library(countrycode)
# 1. Load the data and fix that weird column name
ets <- read_csv("data/raw/eurostat_emissions.csv", show_col_types = FALSE)
# Rename that messy first column to just "geo"
names(ets)[1] <- "geo"
# 2. Clean and reshape the data
ets_clean <- ets %>%
# Filter for CO2 and Total activities
filter(airpol == "CO2", nace_r2 == "TOTAL") %>%
# Select the geo column and ANY column that is a year (starts with a number)
select(geo, matches("^\\d{4}")) %>%
# Pivot the years from columns into rows
pivot_longer(
cols = -geo,
names_to = "year",
values_to = "emissions"
) %>%
# Convert year to numeric and clean the emissions values
mutate(
year = as.numeric(year),
emissions = as.numeric(emissions)
) %>%
# Convert country codes
mutate(iso3 = countrycode(geo, "iso2c", "iso3c")) %>%
filter(!is.na(iso3), !is.na(emissions))
library(tidyverse)
library(countrycode)
# 1. Load data and fix the first column name
ets <- read_csv("data/raw/eurostat_emissions.csv", show_col_types = FALSE)
names(ets)[1] <- "geo"
# 2. Clean and reshape
ets_clean <- ets %>%
# Filter for CO2 and Total activities
filter(airpol == "CO2", nace_r2 == "TOTAL") %>%
# Keep ONLY the geo column. Drop freq, airpol, nace_r2, unit entirely.
select(geo, everything()) %>%
select(-freq, -airpol, -nace_r2, -unit) %>%
# Pivot EVERYTHING except geo into long format
pivot_longer(
cols = -geo,
names_to = "year",
values_to = "emissions"
) %>%
# Clean up the year column (remove any spaces or tabs) and make emissions numeric
mutate(
year = as.numeric(str_extract(year, "\\d{4}")), # Extracts just the 4-digit year
emissions = as.numeric(emissions)
) %>%
# Convert country codes and drop NAs
mutate(iso3 = countrycode(geo, "iso2c", "iso3c")) %>%
filter(!is.na(iso3), !is.na(emissions))
Q
library(tidyverse)
library(countrycode)
library(stringr)
# 1. Load data and fix the first column name
ets <- read_csv("data/raw/eurostat_emissions.csv", show_col_types = FALSE)
names(ets)[1] <- "geo"
# 2. Clean and reshape
ets_clean <- ets %>%
# Filter for CO2 and Total activities
filter(airpol == "CO2", nace_r2 == "TOTAL") %>%
# Keep ONLY the geo column and ANY column containing a 4-digit year
select(geo, matches("\\d{4}")) %>%
# Pivot everything except geo into long format
pivot_longer(
cols = -geo,
names_to = "year",
values_to = "emissions"
) %>%
# Clean up the year column and make emissions numeric
mutate(
year = as.numeric(str_extract(year, "\\d{4}")),
emissions = as.numeric(emissions)
) %>%
# Convert country codes and drop NAs
mutate(iso3 = countrycode(geo, "iso2c", "iso3c")) %>%
filter(!is.na(iso3), !is.na(emissions))
# 3. Check it
head(ets_clean)
library(tidyverse)
library(countrycode)
library(stringr)
# 1. Load data and fix the first column name
ets <- read_csv("data/raw/eurostat_emissions.csv", show_col_types = FALSE)
names(ets)[1] <- "geo"
# 2. Clean and reshape
ets_clean <- ets %>%
# Fix the Austria code issue immediately
mutate(geo = if_else(geo == "A", "AT", geo)) %>%
# Filter for CO2 and Total activities
filter(airpol == "CO2", nace_r2 == "TOTAL") %>%
# Keep ONLY the geo column and ANY column with a 4-digit year
select(geo, matches("\\d{4}")) %>%
# Pivot to long
pivot_longer(
cols = -geo,
names_to = "year",
values_to = "emissions"
) %>%
# Convert to numbers (ignoring warnings for text like ":")
mutate(
year = as.numeric(str_extract(year, "\\d{4}")),
emissions = suppressWarnings(as.numeric(emissions))
) %>%
# Drop any rows where emissions couldn't be converted to a number
filter(!is.na(emissions)) %>%
# Convert country codes
mutate(iso3 = suppressWarnings(countrycode(geo, "iso2c", "iso3c"))) %>%
filter(!is.na(iso3))
# 3. Check it!
print(paste("Rows in cleaned ETS data:", nrow(ets_clean)))
head(ets_clean)
# Reload the raw data
library(readr)
ets <- read_csv("data/raw/eurostat_emissions.csv", show_col_types = FALSE)
names(ets)[1] <- "geo"
# Look at the unique values in the airpol and nace_r2 columns
unique(ets$airpol)
unique(ets$nace_r2)
unique(ets$airpol)
library(tidyverse)
library(countrycode)
library(stringr)
# 1. Load data
ets <- read_csv("data/raw/eurostat_emissions.csv", show_col_types = FALSE)
names(ets)[1] <- "geo"
# 2. Clean and reshape
ets_clean <- ets %>%
# Fix Austria
mutate(geo = if_else(geo == "A", "AT", geo)) %>%
# Use the exact pollutant name here!
filter(airpol == CO2, nace_r2 == "TOTAL") %>%
select(geo, matches("\\d{4}")) %>%
pivot_longer(cols = -geo, names_to = "year", values_to = "emissions") %>%
mutate(
year = as.numeric(str_extract(year, "\\d{4}")),
emissions = suppressWarnings(as.numeric(emissions))
) %>%
filter(!is.na(emissions)) %>%
mutate(iso3 = suppressWarnings(countrycode(geo, "iso2c", "iso3c"))) %>%
filter(!is.na(iso3))
library(tidyverse)
library(countrycode)
library(stringr)
# 1. Load data
ets <- read_csv("data/raw/eurostat_emissions.csv", show_col_types = FALSE)
names(ets)[1] <- "geo"
# 2. Clean and reshape
ets_clean <- ets %>%
# Fix Austria
mutate(geo = if_else(geo == "A", "AT", geo)) %>%
# Use the exact pollutant name here!
filter(airpol == "YOUR_EXACT_CO2_NAME", nace_r2 == "TOTAL") %>%
select(geo, matches("\\d{4}")) %>%
pivot_longer(cols = -geo, names_to = "year", values_to = "emissions") %>%
mutate(
year = as.numeric(str_extract(year, "\\d{4}")),
emissions = suppressWarnings(as.numeric(emissions))
) %>%
filter(!is.na(emissions)) %>%
mutate(iso3 = suppressWarnings(countrycode(geo, "iso2c", "iso3c"))) %>%
filter(!is.na(iso3))
# 3. Check it!
print(paste("Rows in cleaned ETS data:", nrow(ets_clean)))
head(ets_clean)
library(tidyverse)
# Reload
ets <- read_csv("data/raw/eurostat_emissions.csv", show_col_types = FALSE)
names(ets)[1] <- "geo"
# Debug step 1: How many rows in total?
print(paste("Total rows:", nrow(ets)))
# Debug step 2: How many CO2 rows?
ets_co2 <- ets %>% filter(airpol == "CO2")
print(paste("CO2 rows:", nrow(ets_co2)))
# Debug step 3: How many TOTAL industry rows?
ets_tot <- ets_co2 %>% filter(nace_r2 == "TOTAL")
print(paste("CO2 + TOTAL rows:", nrow(ets_tot)))
# 1. Load the package
library(eurostat)
# 1. Load packages
library(eurostat)
list.files("data/raw")
# Check Eurostat data
ets <- read_csv("data/raw/eurostat_emissions.csv")
head(ets)
# Check World Bank data
wdi <- read_csv("data/raw/wdi_controls.csv")
head(wdi)
library(tidyverse)
library(countrycode)
# 1. Clean the Eurostat data
ets_clean <- ets %>%
filter(!is.na(values)) %>%
mutate(iso3 = countrycode(geo, "iso2c", "iso3c")) %>%
group_by(iso3, time) %>%
summarise(emissions = sum(values, na.rm = TRUE), .groups = "drop") %>%
rename(year = time)
colnames(ets)
# Re-download using the 'bulk' download method which forces a clean format
ets <- get_eurostat("env_ac_ets", time_format = "num", type = "code")
library(eurostat)
ets <- get_eurostat("env_ac_ets", time_format = "num", type = "code")
install.packages("eurostat")
library(eurostat)
install.packages("e1071")
library(eurostat)
ets <- get_eurostat("env_ac_ets", time_format = "num", type = "code")
library(WDI)
library(tidyverse)
# 1. Download all variables from World Bank at once
wdi_raw <- WDI(
country   = "all",
indicator = c(
co2_pc   = "EN.ATM.CO2E.PC",
gdp_pc   = "NY.GDP.PCAP.KD",
pop      = "SP.POP.TOTL",
industry = "NV.IND.TOTL.ZS"
),
start = 2005, end = 2023
)
# 2. Clean and create our panel
panel <- wdi_raw %>%
# Keep only countries (remove regional aggregates like "World" or "Euro area")
filter(!is.na(iso3c), region != "Aggregates") %>%
mutate(
ln_co2       = log(co2_pc + 1),
ln_gdp_pc    = log(gdp_pc),
ln_pop       = log(pop),
post_2013    = as.integer(year >= 2013) # EU ETS Phase 3 started in 2013
) %>%
# Keep only rows with complete data
filter(!is.na(ln_co2), !is.na(ln_gdp_pc), !is.na(industry))
library(WDI)
library(tidyverse)
# 1. Download all variables from World Bank at once
wdi_raw <- WDI(
country   = "all",
indicator = c(
co2_pc   = "EN.ATM.CO2E.PC",
gdp_pc   = "NY.GDP.PCAP.KD",
pop      = "SP.POP.TOTL",
industry = "NV.IND.TOTL.ZS"
),
start = 2005, end = 2023
)
# 2. Clean and create our panel
panel <- wdi_raw %>%
# Keep only actual countries (remove regional aggregates like "World" or "Euro area")
filter(!is.na(iso3c), region != "Aggregates") %>%
mutate(
ln_co2       = log(co2_pc + 1),
ln_gdp_pc    = log(gdp_pc),
ln_pop       = log(pop),
post_2013    = as.integer(year >= 2013) # Our policy shock
) %>%
# Keep only rows with complete data for our variables
filter(!is.na(ln_co2), !is.na(ln_gdp_pc), !is.na(industry))
library(WDI)
library(tidyverse)
# 1. Download all variables from World Bank at once
wdi_raw <- WDI(
country   = "all",
indicator = c(
co2_pc   = "EN.ATM.CO2E.PC",
gdp_pc   = "NY.GDP.PCAP.KD",
pop      = "SP.POP.TOTL",
industry = "NV.IND.TOTL.ZS"
),
start = 2005, end = 2023
)
# 2. Clean and create our panel
panel <- wdi_raw %>%
# Keep only actual countries (iso3c must be exactly 3 characters)
filter(!is.na(iso3c), nchar(iso3c) == 3) %>%
mutate(
ln_co2       = log(co2_pc + 1),
ln_gdp_pc    = log(gdp_pc),
ln_pop       = log(pop),
post_2013    = as.integer(year >= 2013) # Our policy shock
) %>%
# Keep only rows with complete data
filter(!is.na(ln_co2), !is.na(ln_gdp_pc), !is.na(industry))
colnames(wdi_raw)
co2_test <- WDI(country = "all", indicator = "EN.ATM.CO2E.PC", start = 2005, end = 2023)
co2_csv <- read.csv("https://api.worldbank.org/v2/en/indicator/EN.ATM.CO2E.PC?downloadformat=csv", skip = 4)
co2_new <- WDI(country = "all", indicator = "EN.GHG.CO2.PC.CE.AR5", start = 2005, end = 2023)
colnames(co2_new)
library(WDI)
library(tidyverse)
# Download with the NEW CO2 code
wdi_raw <- WDI(
country   = "all",
indicator = c("EN.GHG.CO2.PC.CE.AR5", "NY.GDP.PCAP.KD", "SP.POP.TOTL", "NV.IND.TOTL.ZS"),
start = 2005, end = 2023
)
# Rename columns explicitly
wdi_clean <- wdi_raw %>%
rename(
co2_pc   = `EN.GHG.CO2.PC.CE.AR5`,
gdp_pc   = `NY.GDP.PCAP.KD`,
pop      = `SP.POP.TOTL`,
industry = `NV.IND.TOTL.ZS`
)
# Clean and build panel
panel <- wdi_clean %>%
filter(!is.na(iso3c), nchar(iso3c) == 3) %>%
mutate(
ln_co2       = log(co2_pc + 1),
ln_gdp_pc    = log(gdp_pc),
ln_pop       = log(pop),
post_2013    = as.integer(year >= 2013)
) %>%
filter(!is.na(ln_co2), !is.na(ln_gdp_pc), !is.na(industry))
# Save
dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)
write_csv(panel, "data/processed/panel_clean.csv")
message("✅ Clean Panel built: ", nrow(panel), " observations, ", n_distinct(panel$iso3c), " countries.")
savehistory(file = "C:/Users/pc/eco-portfolio/01-carbon-pricing/my_console_history.R")
