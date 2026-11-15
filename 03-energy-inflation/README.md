# Energy Shocks & Inflation
### How do oil price shocks pass through to consumer price inflation?

**Author:** Raymond Oluwaferanmi · **Date:** November 2026 · **Tool:** EViews & R

---

## Research question
How does a sudden shock in global oil prices (like the 2022 energy crisis) transmit to consumer price inflation over time?

## Method
Vector Autoregression (VAR) model with 2 lags:
Y_t = A_1 Y_{t-1} + A_2 Y_{t-2} + ε_t
Where Y_t contains [CPI, Fed Funds Rate, Oil Price].

- **Impulse Response Function (IRF):** Traces the effect of a one-standard-deviation shock to Oil Prices on CPI over a 12-month horizon.
- **Software:** EViews (for the VAR estimation and IRF) and R (for data cleaning).

## Data
| Source | Variable | Ticker |
|--------|----------|--------|
| FRED | Consumer Price Index | `CPIAUCSL` |
| FRED | Crude Oil Prices (WTI) | `DCOILWTICO` |
| FRED | Federal Funds Rate | `FEDFUNDS` |

*Note: Due to the 59-observation limit in EViews Student Lite, this analysis uses the most recent 57 months of data (Jan 2022 – Oct 2026). The R script to clean and merge the full historical dataset is included in the `data/` folder.*

## Key finding
The VAR estimates and impulse response functions show that a positive shock to oil prices leads to an immediate but temporary increase in CPI (inflation), which peaks around 2 months after the shock before gradually returning toward baseline. This demonstrates the pass-through mechanism of energy shocks into consumer prices.

## Outputs
- `var_output.png` — The EViews VAR estimation output (coefficients, t-stats, R-squared).
- `irf_plot.png` — The Impulse Response Function graph showing how CPI reacts to an oil shock.

## Reproduce (in EViews)
1. Import `data/merged_data.csv` into EViews.
2. Select `cpi`, `oil`, `fed_funds` > Right-click > Open > as VAR.
3. Set Lag Intervals to `1 2` > Click OK.
4. View > Impulse Response > Impulses: `oil`, Responses: `cpi`, Horizon: `12`.