# User Behavior Analysis — MySQL + Looker Studio (Mandiri Sekuritas)

**Dashboard:** https://lookerstudio.google.com/reporting/91ef9605-5b13-443e-960c-6bb766eed1d7

This repo contains SQL and documentation for the Technical Test (Data Analyst).  
Pipeline: Raw CSV → MySQL `raw_*` → `clean_*` → QA → SQL insights → Looker Studio (7 visuals).

## Repo Structure

```
sql/                          # 7 insight queries (MySQL)
  01_core_top_states.sql
  02_core_channel_mix.sql
  03_core_avg_ticket_by_brand.sql
  04_core_top_customers.sql
  05_core_risk_by_state.sql
  06_bonus_high_error_merchants.sql
  07_bonus_age_group_value.sql
data/
  extracts/                   # optional: CSV extracts used for Looker (if Sheets/File Upload)
looker/
  dashboard_link.txt          # Looker report URL
slides/
  Mandiri_MS_Exec_Template_v2.pptx  # exec-ready deck (drop charts & export to PDF)
docs/
  README_cleaning_summary.md  # optional extended notes
```

## Reproduce

1. Load MySQL tables: `devdb.clean_transactions`, `devdb.clean_cards`, `devdb.clean_users`.
2. Run the 7 SQLs in `sql/`. Export aggregates for Looker if using Sheets/File Upload.
3. Open the dashboard: see `looker/dashboard_link.txt`.

## Actions (summary)

1) Allocate resources to the top 5–10 states.
2) Migrate volume to lower-risk channels (chip/online).
3) Partner with high-AOV brands and calibrate credit limits.
4) Establish a VIP retention program for top spenders.
5) Strengthen controls in high-risk states; review error-prone merchants.
6) Audit and remediate high-error merchants.
7) Target high-value age cohorts with tailored offers.
