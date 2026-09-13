# AI-Assisted Prompting Log

## Prompt #1 — SQL and Reporting

### Role
Act as a SQL and data analytics mentor for a student completing a BigBasket category performance diagnostic.

### Context
The project uses a synthetic BigBasket dataset containing products, customers, orders, and category targets. The analysis requires SQLite queries, aggregation, joins, monthly reporting, category target comparison, and a CSV export for downstream spreadsheet and Tableau analysis.

### Task
Guide me through creating the SQL analysis and reporting queries, including foundational SQL, aggregation and joins, product revenue tiers, monthly category revenue, and category target variance analysis.

### Constraints
- Use SQLite syntax.
- Follow the project requirements exactly.
- Do not change the supplied data-generation logic.
- The monthly category revenue output must contain exactly 36 rows and 5 columns.
- Revenue calculations must use Delivered orders.
- Explain the logic so that I can perform and verify the work myself.

### Format
Provide labelled SQL queries with clear explanations and verification checks.

### Verification performed
I verified the generated database and SQL outputs. The monthly category revenue CSV contained 36 rows, 5 columns, and total revenue of ₹88,282. The category totals and target-performance classifications were also reconciled with the spreadsheet pivot.

---

## Prompt #2 — Python Data Cleaning and Diagnostic Analysis

### Role
Act as a Python and data-analysis mentor guiding a beginner through a reproducible data-cleaning and diagnostic workflow.

### Context
The project includes a separate messy raw orders CSV and products CSV. The raw orders file contains duplicate order IDs, inconsistent text formatting, missing amounts, and extreme order amounts. The cleaned data must be used to identify the top delivered-revenue category and supplier and cross-validate them against Part 1 SQL results.

### Task
Guide me through loading, inspecting, cleaning, validating, and analysing the raw CSV files using pandas and matplotlib. The workflow should include duplicate removal, city/category text cleaning, missing-value analysis, IQR-based outlier detection, capping of extreme Delivered amounts, date/month fields, revenue-per-unit calculation, supplier merging, category/supplier revenue analysis, cross-validation, and three charts.

### Constraints
- Keep the original raw files unchanged.
- Remove duplicate records using order_id and keep the first occurrence.
- The cleaned orders dataset must contain exactly 500 rows.
- Do not replace missing amount values with invented values.
- Exclude missing amounts from revenue calculations.
- Leave rating nulls unchanged.
- Calculate the IQR upper fence using Delivered amounts.
- Cap extreme Delivered amounts rather than deleting them.
- Cross-validate the Python top category and supplier with Part 1 SQL.
- Use matplotlib for exactly three charts.
- Explain the process so I can perform and verify each step myself.

### Format
Use clearly labelled notebook sections, reproducible Python code, verification outputs, charts, and three What–Why–Next-step observations.

### Verification performed
The cleaned dataset contained exactly 500 unique orders. There were 10 missing amount values in total, including 9 Delivered orders. The Delivered revenue IQR upper fence was ₹552.50, and 16 Delivered amounts were capped. Python identified Household Essentials as the top category and HomeEssentials Traders as the top supplier. Both results matched the Part 1 SQL results.