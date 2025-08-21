# Cleaning Summary
- Normalized column names to lowercase_with_underscores.
- Parsed currency strings ($, commas; parentheses → negatives) to DECIMAL.
- Robust datetime parsing; invalid/zero → NULL.
- Numeric coercion for malformed fields (e.g., '58523.0').
- Deduped by transaction_id; added unique key.
- QA: row-count parity (raw vs clean); amount parity; null diagnostics.
