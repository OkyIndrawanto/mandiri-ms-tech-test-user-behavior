# User Behavior Analysis — MySQL + Looker Studio (Mandiri Sekuritas)

**Live Dashboard:** https://lookerstudio.google.com/reporting/91ef9605-5b13-443e-960c-6bb766eed1d7

This project cleans public user/transactions data in MySQL and delivers 7 stakeholder-focused insights with a Looker Studio dashboard. 
It’s built for the Mandiri Sekuritas Data Analyst technical test and emphasizes accuracy, clarity, and decision-ready storytelling.

---

## Data Access (cleaned datasets)

Cleaned tables are hosted on **Google Drive** for easy download:
- **Drive folder:** https://drive.google.com/drive/folders/1b5Xu0ArnIQj_nze-elK_rTVBVZGM4izv?usp=sharing

### How to use these files
- **MySQL import (local):** Download the CSV(s) and load into your MySQL `devdb` schema as `clean_transactions`, `clean_cards`, and `clean_users` (ensure column names are lowercase_with_underscores).
- **Looker Studio (fast path):**
  - *Sheets method:* Upload each CSV to Google Drive → open with Google Sheets → connect each Sheet in Looker Studio.
  - *File Upload method:* In Looker Studio, **Add data → File upload** and upload the CSV(s) directly.
- **Do not commit** multi‑GB files to Git: keep large data in Drive/Releases; the repo stays lightweight.

---

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
presentation.pdf
docs/
  README_cleaning_summary.md  # optional extended notes
```

---

## How to Reproduce (quick)

1. **Load data in MySQL** (already completed in my environment):
   - Tables: `devdb.clean_transactions`, `devdb.clean_cards`, `devdb.clean_users`
2. **Run the 7 SQLs** (in `sql/`).  
   For extract-based dashboard, export results to CSV and connect via **Google Sheets/File Upload** in Looker Studio.
3. **Open the dashboard**: see **looker/dashboard_link.txt** or the link above.

---

## Data Size & Performance

- **Scale:** ~13,000,000 transaction rows (multi-GB CSV), plus card and user reference tables.  
- **Challenges:** local imports timed out; mixed date formats (including `0000-00-00 00:00:00`); currency strings with parentheses for negatives; occasional numeric strings like `'58523.0'`.
- **Solutions:**
  - **Chunked ingestion** via batched inserts with extended timeouts to prevent disconnects.
  - **Robust parsing:** guarded `STR_TO_DATE` patterns; invalid/zero dates → `NULL`; currency normalization (strip `$`, commas; parentheses → negative).
  - **Schema discipline:** `lowercase_with_underscores`, concrete numeric types, and **unique key on `transaction_id`**.
  - **Indexes** for speed: `client_id`, `card_id`, `merchant_state`, `txn_datetime`, etc.
  - **Dashboard strategy:** pre-aggregated extracts (7 small CSV/Sheets) for Looker Studio, keeping visuals **fast and lightweight**; optional BigQuery path for hosted, live queries.

---

## Insights (Actions only)

1) Allocate resources to the **top 5–10 states** to maximize return.  
2) **Migrate volume to lower-risk channels** (chip/online) to improve approval and reduce disputes.  
3) **Partner with high-AOV brands** and calibrate credit limits to optimize revenue and risk.  
4) Establish a **VIP retention program** for top-spending customers.  
5) **Strengthen controls** in high-risk states and review merchants with elevated error rates.  
6) **Audit and remediate high-error merchants**, enforcing operational fixes and monitoring.  
7) **Target high-value age cohorts** with tailored offers and lifecycle campaigns.
