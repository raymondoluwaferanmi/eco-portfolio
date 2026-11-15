# Green Innovation & Firm Productivity
### Do firms with more green patents have higher productivity?

**Author:** Raymond Oluwaferanmi · **Date:** November 2026 · **Tool:** Python

---

## Research question
Does green innovation (measured by the number of green patents) drive firm-level productivity (Total Factor Productivity)?

## Method
Two-way fixed-effects panel regression using Python (`statsmodels`):
TFP_it = α_i + γ_t + β * GreenPatents_it + ε_it

- **Outcome:** Firm-level Total Factor Productivity (TFP).
- **Treatment:** Number of green patents filed by the firm.
- **Fixed Effects:** Firm fixed effects (α_i) and Year fixed effects (γ_t).

## Data
Since firm-level patent data is proprietary, this project uses a **simulated panel dataset** of 500 firms over 14 years (2010–2023). The data is generated with a known true effect (β = 0.05) to demonstrate the estimation pipeline. 

## Key finding
The model successfully recovers a positive effect: firms that file more green patents have **statistically significant higher productivity** (coefficient = 0.0303, p < 0.05). A one-unit increase in green patents is associated with a 0.0303 unit increase in TFP, holding firm and year factors constant.

## Reproduce
Open `green_innovation.ipynb` in Google Colab or Jupyter Notebook and run all cells. 

## Outputs
- `green_innovation_plot.png` — Scatter plot of patents vs. TFP with trend line.