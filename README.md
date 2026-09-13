# BigBasket Category Performance Diagnostic

## Project Overview

This project presents an end-to-end category performance diagnostic using SQL, Google Sheets, Tableau Public, and Python.

The analysis uses a synthetic BigBasket-style order dataset covering January to June 2026. The objective is to clean and validate the data, measure category revenue against targets, identify high-performing and underperforming categories, analyse supplier performance, and communicate the findings through an interactive Tableau dashboard.

The project follows one connected workflow:

Raw Data → SQL Analysis → Spreadsheet Reconciliation → Tableau Dashboard → Python Data Cleaning & Cross-Validation

## Tools Used

- SQLite / Python `sqlite3` — database creation and SQL analysis
- Google Sheets — pivot analysis and reconciliation
- Tableau Public — interactive dashboard and visual analysis
- Python Pandas — data cleaning and diagnostic analysis
- Matplotlib — data visualisation
- GitHub — project documentation and version control

## Repository Structure

```text
BigBasket_Capstone/
├── generate_data.py
├── bigbasket_capstone.db
├── orders_raw.csv
├── products.csv
├── verify.sql
├── 01_foundations.sql
├── 02_aggregation_joins.sql
├── 03_reporting.sql
├── monthly_category_revenue.csv
├── BigBasket_Category_Performance.xlsx
├── analysis.ipynb
├── ai_log.md
└── README.md

## Part 1 — SQL and SQLite

The supplied data-generation script was used without changing the fixed random seed or predefined lists and weights.

The generated dataset contains:

- 31 products
- 50 customers
- 500 orders
- 6 category targets

Order status counts:

- Delivered: 434
- Cancelled: 42
- Pending: 24

The SQL analysis is divided into three scripts.

### `01_foundations.sql`

Contains foundational SQL queries covering:

- SELECT and WHERE
- DISTINCT
- ORDER BY and LIMIT
- Aliases using AS
- IN
- BETWEEN and NOT BETWEEN
- IS NULL

### `02_aggregation_joins.sql`

Contains:

- INNER JOIN analysis
- LEFT JOIN analysis
- COUNT, SUM and AVG
- GROUP BY
- HAVING
- Delivered-order revenue analysis
- Zero-order product validation

### `03_reporting.sql`

Contains:

- Product revenue performance tiers
- Monthly category revenue reporting
- Category target comparison
- Variance and percentage variance
- Above Target / Watch / Critical classification

The exported monthly reporting file is:

`monthly_category_revenue.csv`

It contains 36 rows representing 6 categories across 6 months.

Total delivered revenue from the SQL report:

**₹88,282**

## Part 2 — Spreadsheet Reconciliation

The exact `monthly_category_revenue.csv` generated in Part 1 was imported into Google Sheets.

The workbook contains:

- `Monthly Data`
- `Category Targets`
- Pivot analysis
- `Category Summary`

The Category Summary compares pivot revenue with target revenue and calculates:

- Variance
- Percentage variance
- Performance tier
- Reconciliation with Part 1 SQL totals

The reconciliation confirmed that the spreadsheet category totals matched the SQL results.

The final workbook is:

`BigBasket Category Performance Diagnostic.xlsx`

## Part 3 — Tableau Public Dashboard

The exact `monthly_category_revenue.csv` generated in Part 1 was connected to Tableau Public.

The dashboard includes:

- Monthly delivered revenue trend from January to June 2026
- Category revenue comparison
- Performance tier classification using category targets
- Total Revenue KPI
- Total Delivered Orders KPI
- Average Order Value KPI
- Categories Meeting Target KPI
- Interactive category filtering

The dashboard shows total delivered revenue of ₹88,282 across 434 delivered orders, with 3 of the 6 categories meeting their revenue targets.

### Live Tableau Public Dashboard

[View the BigBasket Category Performance Dashboard](https://public.tableau.com/app/profile/purvi.singh/viz/BigBasket_Category_Performance/BigBasketCategoryPerformanceDashboard)

## Data Story and Recommendations

### Diagnostic Summary

The dashboard shows total delivered revenue of ₹88,282 across 434 delivered orders.

Three categories are performing above their revenue targets:

- **Household Essentials:** ₹21,715 revenue vs ₹17,000 target — Above Target (+27.74%)
- **Personal Care:** ₹16,382 revenue vs ₹15,500 target — Above Target (+5.69%)
- **Bakery:** ₹15,410 revenue vs ₹12,000 target — Above Target (+28.42%)

**Dairy & Eggs** is classified as **Below Target - Watch**, with ₹14,090 revenue against a ₹16,500 target (-14.61%).

Two categories are classified as **Below Target - Critical**:

- **Snacks & Beverages:** ₹10,895 revenue vs ₹13,000 target (-16.19%)
- **Fruits & Vegetables:** ₹9,790 revenue vs ₹12,000 target (-18.42%)

### Recommendations

1. **Prioritize recovery in the two Critical categories — Fruits & Vegetables and Snacks & Beverages.** They are below their targets by ₹2,210 and ₹2,105 respectively. The business should investigate assortment, product availability, promotions, and supplier performance in these categories.

2. **Protect and scale the strongest categories, especially Household Essentials and Bakery.** Household Essentials generated ₹21,715 against a ₹17,000 target, while Bakery generated ₹15,410 against a ₹12,000 target. Maintaining strong availability and service levels while selectively expanding these categories could help sustain their performance.