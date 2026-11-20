# Air Quality & Housing Prices
### A Hedonic Pricing Analysis of PM2.5 Pollution

**Author:** Raymond Oluwaferanmi · **Date:** November 2026 · **Tool:** R

---

## Research question
Does local air pollution (PM2.5) affect residential property values? If so, how much of a "price penalty" do homeowners pay for dirty air?

## Method
**Hedonic Pricing Model:** Housing is a bundle of attributes (size, age, location, environmental quality). We estimate the implicit price of clean air by regressing log house prices on PM2.5 and housing characteristics:
ln(Price_i) = β_0 + β_1 * PM2.5_i + β_2 * SqFt_i + β_3 * Bedrooms_i + β_4 * Age_i + γ_city + ε_i

- **Model 1:** Basic OLS without city fixed effects.
- **Model 2:** Adds city fixed effects (γ_city) to control for unobserved local amenities (schools, crime, etc.).
- **Standard Errors:** Heteroskedasticity-robust.

## Data
Since real estate transaction data is proprietary, this project uses a **simulated dataset** of 5,000 houses across four cities. The data is generated with a known true effect (house prices decrease by $5,000 per unit of PM2.5) to demonstrate the econometric pipeline.

## Key finding
The hedonic regression reveals a **highly statistically significant negative relationship** (p < 0.001) between PM2.5 and house prices. The coefficient of -0.0151 implies that a one-unit increase in PM2.5 concentrations is associated with an approximately **1.5% decrease in house prices**, holding house size, bedrooms, age, and city fixed effects constant. This quantifies the "willingness to pay" for clean air.

## Outputs
- `output/hedonic_results.html` — Regression table comparing Model 1 and Model 2.
- `output/pm25_vs_price.png` — Scatter plot of PM2.5 vs. Log House Prices with trend line.