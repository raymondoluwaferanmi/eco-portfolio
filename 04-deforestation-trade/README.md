# Deforestation & Agricultural Trade
### Does agricultural export intensity drive deforestation in the Global South?

**Author:** Raymond Oluwaferanmi · **Date:** November 2026 · **Tool:** R

---

## Research question
Does a country's reliance on agricultural raw material exports lead to a reduction in forest area over time?

## Method
Two-way fixed-effects panel regression:
ln(Forest_Area_it) = α_i + γ_t + β * ln(Ag_Exports_it) + Controls_it + ε_it

- **Outcome:** Log of forest area (% of land area).
- **Treatment:** Log of agricultural raw materials exports (% of merchandise exports).
- **Controls:** Log GDP per capita, log population, agricultural land (% of land area).
- **Fixed Effects:** Country fixed effects (α_i) and Year fixed effects (γ_t).
- **Standard Errors:** Clustered at the country level.

## Data
| Source | Variable | Ticker |
|--------|----------|--------|
| World Bank | Forest area (% of land) | `AG.LND.FRST.ZS` |
| World Bank | Agricultural raw materials exports (%) | `TX.VAL.AGRI.ZS.UN` |
| World Bank | GDP per capita | `NY.GDP.PCAP.KD` |
| World Bank | Population | `SP.POP.TOTL` |
| World Bank | Agricultural land (% of land) | `AG.LND.AGRI.ZS` |

The sample covers 3,677 observations from developing regions (excluding North America, Europe, and Australia) between 2000 and 2022.

## Key finding
Controlling for country and year fixed effects, **agricultural export intensity is positively associated with forest area (coefficient = 0.0148) but the effect is not statistically significant**. However, the share of agricultural land is highly significant and negatively associated with forest area (coefficient = -0.0073, p < 0.001). This suggests that land-use change (expanding agricultural land) is a stronger driver of deforestation than export intensity alone in this sample.

## Reproduce
Run `code/deforestation_analysis.R` in RStudio. The script downloads data directly from the World Bank API.

## Outputs
- `output/tables/deforestation_results.html` — Regression table
- `output/figures/forest_trend.png` — Average forest area trend, 2000–2022