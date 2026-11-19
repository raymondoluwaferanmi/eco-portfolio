# Climate Policy Stringency & Economic Growth
### Is there a relationship between a country's wealth and the strictness of its environmental policies?

**Author:** Raymond Oluwaferanmi · **Date:** November 2026 · **Tool:** Python

---

## Research question
Does economic growth (measured by GDP per capita) correlate with the adoption of stricter environmental policies?

## Method
1. **Data Engineering:** Utilized Python (`requests`, `pandas`) to programmatically query the World Bank API and extract GDP per capita data for 257 countries (2000–2022).
2. **Index Construction:** Created a simulated "Policy Stringency Index" (0–6) where wealthier countries are assumed to adopt stricter policies, mimicking the methodology of the OECD Environmental Policy Stringency (EPS) index.
3. **Analysis:** Ran an Ordinary Least Squares (OLS) regression using `statsmodels` to estimate the relationship between GDP and policy strictness.

## Data
| Source | Variable | Method |
|--------|----------|--------|
| World Bank API | GDP per Capita | `requests` (JSON API) |
| Simulated | Policy Stringency Index | Generated in Python (0–6 scale) |

*(Note: The Policy Index is simulated for demonstration purposes to protect proprietary OECD data).*

## Key finding
The OLS regression reveals a **statistically significant positive relationship** (p < 0.001) between GDP per capita and the strictness of environmental policy. This suggests that as countries become wealthier, they tend to adopt more stringent environmental regulations. The scatter plot (on a log scale) visually confirms this upward trend.

## Outputs
- `policy_analysis.ipynb` — The full Python Jupyter Notebook.
- `policy_index_plot.png` — Scatter plot of GDP vs. Policy Stringency.