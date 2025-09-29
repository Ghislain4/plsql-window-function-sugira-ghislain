# PL/SQL Window Functions — Sugira Ghislain (ID: 27776)

## Project overview
**Business context:** Green Land apartment company (Kigali & Musanze).  
**Problem:** Identify top-performing apartments, monthly revenue trends, and segment customers for targeted promotions.  
**Objective:** Demonstrate mastery of PL/SQL window functions (ranking, aggregate frames, navigation, distribution) through queries, analysis, and documented results.

---

## What I delivered
- DDL and data load scripts (`sql/01_create_tables.sql`, `sql/02_insert_sample_data.sql`)
- Window-function SQL queries with comments (`sql/03_window_queries.sql`)
- Screenshots of query results (`screenshots/`) — 20+ required images included
- Analysis report (`analysis/results_analysis.md`)
- References used in research (`references.md`)
- Integrity statement (below)

---

## How to run
1. Clone repo.
2. Connect to your Oracle/PLSQL environment (adjust scripts for MySQL/Postgres if needed).
3. Run `sql/01_create_tables.sql` then `sql/02_insert_sample_data.sql`.
4. Execute queries in `sql/03_window_queries.sql` and save screenshots.

---

## Key queries (short)
- Top apartments by revenue using `RANK()`, `ROW_NUMBER()`, `DENSE_RANK()`.
- Running monthly totals and 3-month moving average using `SUM() OVER(...)` and `AVG() OVER(...)`.
- Month-over-month growth using `LAG()`.
- Customer quartiles using `NTILE(4)` and `CUME_DIST()`.

---

## Key findings (two insights for submission)
1. A small set (~20%) of apartments generate ~60% of rent revenue — good candidates for premium services and targeted retention.
2. Seasonal dips in payment activity in Q3 suggest potential offer windows to stabilize occupancy in Musanze.

---

## Results analysis
See `analysis/results_analysis.md` — contains descriptive, diagnostic, and prescriptive layers.

---

## Integrity statement
All sources are cited in `references.md`. Implementations and analysis represent original work. No AI-generated content was copied without attribution or adaptation.

AUTHOR 
Sugira Ghislain 27776
Instructer: Eric Maniraguha
Submission date: September 29/2025


Signed — Sugira Ghislain

