# SDG 7: Affordable and Clean Energy Dashboard
### Visualizing the relationship between economic development and electricity access.

**Author:** Raymond Oluwaferanmi · **Date:** November 2026 · **Tool:** Python

---

## Project Overview
This project builds an **interactive data dashboard** to track global progress toward **UN Sustainable Development Goal 7** (Ensure access to affordable, reliable, sustainable and modern energy for all). 

## Methodology
1.  **Data Extraction:** Used the World Bank API (`requests`) to download the latest 2021 data for Access to Electricity (% of population) and GDP per Capita for 250 countries.
2.  **Data Processing:** Merged and cleaned the datasets using `pandas` and `numpy`.
3.  **Visualization:** Built an interactive bubble chart using `plotly.express`. 
    *   **X-axis:** GDP per capita (Log scale).
    *   **Y-axis:** Access to Electricity (%).
    *   **Bubble Size/Color:** Represents GDP and access levels.
    *   **Hover:** Displays the country name and exact statistics.

## Key finding
The dashboard visually demonstrates the strong non-linear relationship between wealth and energy access. Countries with a GDP per capita below $5,000 often struggle to provide universal electricity, whereas countries above $15,000 consistently achieve near-universal access. 

## How to View the Dashboard
Because the dashboard is interactive, you cannot view it directly in GitHub's file preview. 
1. Download the `sdg7_dashboard.html` file from this repository.
2. Double-click it to open it in any web browser (Chrome, Edge, Safari). 
3. Hover over the bubbles, zoom in, and explore the data!

## Files
- `sdg_dashboard.ipynb` — The Python Jupyter Notebook.
- `sdg7_dashboard.html` — The interactive dashboard file.