# Carbon Pricing & Emission Trends
### Did the EU Emissions Trading System (Phase 3) reduce CO₂ emissions?

**Author:** Raymond Oluwaferanmi · **Date:** November 2026 · **Tool:** R

---

## Research question
The EU ETS is the world's largest carbon market. Phase 3 (2013–2020) tightened the cap significantly. Did covered emissions fall relative to a counterfactual?

## Method
Fixed-effects regression on a panel of European countries:
ln(CO2_pc) = α_i + β * post_2013 + ε_it

- **Outcome:** Log CO₂ emissions per capita.
- **Treatment:** A dummy variable equal to 1 for years ≥ 2013 (EU ETS Phase 3).
- **Fixed Effects:** Country fixed effects.
- **Controls:** Log GDP per capita, log population, industry share.
- **Standard Errors:** Clustered at the country level.

## Data
| Source | Variable | Code |
|--------|----------|------|
| World Bank | CO₂ emissions per capita | `EN.GHG.CO2.PC.CE.AR5` |
| World Bank | GDP per capita | `NY.GDP.PCAP.KD` |
| World Bank | Population | `SP.POP.TOTL` |
| World Bank | Industry value added | `NV.IND.TOTL.ZS` |

## Key finding
Using a fixed-effects model on a panel of European countries from 2005–2023, I find that the EU ETS Phase 3 (2013 onward) is associated with a **statistically significant 14.4% decrease in CO₂ emissions per capita** (coefficient = -0.156, p < 0.001). The result is robust to the inclusion of GDP, population, and industry share controls.

## Outputs
- `output/tables/main_results.html` — Regression table
- `output/figures/europe_trend.png` — Trend plot for Europe